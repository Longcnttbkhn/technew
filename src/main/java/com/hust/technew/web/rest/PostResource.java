package com.hust.technew.web.rest;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.time.ZonedDateTime;
import java.util.List;
import java.util.Optional;

import javax.inject.Inject;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.codahale.metrics.annotation.Timed;
import com.hust.technew.domain.Author;
import com.hust.technew.domain.Post;
import com.hust.technew.domain.enumeration.Status;
import com.hust.technew.repository.PostRepository;
import com.hust.technew.security.AuthoritiesConstants;
import com.hust.technew.service.AuthorService;
import com.hust.technew.service.PostService;
import com.hust.technew.service.StorageService;
import com.hust.technew.service.UserService;
import com.hust.technew.service.dto.AvatarDTO;
import com.hust.technew.service.dto.PostDTO;
import com.hust.technew.service.dto.PostLessDTO;
import com.hust.technew.service.mapper.PostMapper;
import com.hust.technew.web.rest.util.HeaderUtil;
import com.hust.technew.web.rest.util.PaginationUtil;

/**
 * REST controller for managing Post.
 */
@RestController
@RequestMapping("/api")
public class PostResource {

	private final Logger log = LoggerFactory.getLogger(PostResource.class);

	@Inject
	private PostRepository postRepository;

	@Inject
	private PostMapper postMapper;

	@Inject
	private AuthorService authorService;

	@Inject
	private UserService userService;

	@Inject
	private PostService postService;
	
	@Inject
	private StorageService storageService;

	/**
	 * POST /posts : Create a new post.
	 *
	 * @param postDTO
	 *            the postDTO to create
	 * @return the ResponseEntity with status 201 (Created) and with body the
	 *         new postDTO, or with status 400 (Bad Request) if the post has
	 *         already an ID
	 * @throws URISyntaxException
	 *             if the Location URI syntax is incorrect
	 */
	@RequestMapping(value = "/posts", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@Timed
	@Secured(AuthoritiesConstants.AUTHOR)
	public ResponseEntity<PostDTO> createPost(@Valid @RequestBody PostDTO postDTO) throws URISyntaxException {
		log.debug("REST request to save Post : {}", postDTO);
		if (postDTO.getId() != null) {
			return ResponseEntity.badRequest()
					.headers(HeaderUtil.createFailureAlert("post", "idexists", "A new post cannot already have an ID"))
					.body(null);
		}
		Author author = authorService.getCurrentAuthor();
		if (author.checkStatus(Status.LOCKED))
			return ResponseEntity.badRequest()
					.headers(HeaderUtil.createFailureAlert("author", "locked", "Your account has been locked"))
					.body(null);
		Post post = postMapper.postDTOToPost(postDTO);
		post.setAuthor(author);
		post.setCreatedDate(ZonedDateTime.now());
		post = postRepository.save(post);
		PostDTO result = postMapper.postToPostDTO(post);
		return ResponseEntity.created(new URI("/api/posts/" + result.getId()))
				.headers(HeaderUtil.createEntityCreationAlert("post", result.getId().toString())).body(result);
	}

	/**
	 * PUT /posts : Updates an existing post.
	 *
	 * @param postDTO
	 *            the postDTO to update
	 * @return the ResponseEntity with status 200 (OK) and with body the updated
	 *         postDTO, or with status 400 (Bad Request) if the postDTO is not
	 *         valid, or with status 500 (Internal Server Error) if the postDTO
	 *         couldnt be updated
	 * @throws URISyntaxException
	 *             if the Location URI syntax is incorrect
	 */
	@RequestMapping(value = "/posts", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
	@Timed
	@Secured({ AuthoritiesConstants.AUTHOR, AuthoritiesConstants.ADMIN })
	public ResponseEntity<PostDTO> updatePost(@Valid @RequestBody PostDTO postDTO) throws URISyntaxException {
		log.debug("REST request to update Post : {}", postDTO);
		if (postDTO.getId() == null) {
			return createPost(postDTO);
		}
		Post post = postRepository.findOne(postDTO.getId());
		if (userService.hasAuthority(AuthoritiesConstants.ADMIN))
			postMapper.updateByAdmin(postDTO, post);
		else {
			Author author = authorService.getCurrentAuthor();
			// Kiem tra so huu
			if (!post.checkAuthor(author))
				return ResponseEntity.badRequest()
						.headers(HeaderUtil.createFailureAlert("post", "notOwner", "You are not owner of this post"))
						.body(null);
			// Kiem tra trang thai author
			if (author.checkStatus(Status.LOCKED))
				return ResponseEntity.badRequest()
						.headers(HeaderUtil.createFailureAlert("author", "locked", "Your account has been locked"))
						.body(null);
			// Kiem tra trang thai post
			if (post.checkStatus(Status.APPROVED))
				return ResponseEntity.badRequest()
						.headers(
								HeaderUtil.createFailureAlert("post", "approved", "You can't modify the approved post"))
						.body(null);
			// update
			postMapper.updateByAuthor(postDTO, post);
		}
		post = postRepository.save(post);
		PostDTO result = postMapper.postToPostDTO(post);
		return ResponseEntity.ok().headers(HeaderUtil.createEntityUpdateAlert("post", postDTO.getId().toString()))
				.body(result);
	}

	/**
	 * POST /posts/:id/avatar : Change avatar
	 * 
	 */
	@RequestMapping(value = "/posts/{id}/avatar", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@Timed
	@Secured({ AuthoritiesConstants.AUTHOR, AuthoritiesConstants.ADMIN })
	public ResponseEntity<AvatarDTO> changeAvatar(@RequestParam MultipartFile file, @PathVariable Long id) {
		Post post = postRepository.findOne(id);
		if (!userService.hasAuthority(AuthoritiesConstants.ADMIN)) {
			Author author = authorService.getCurrentAuthor();
			// Kiem tra so huu
			if (!post.checkAuthor(author))
				return ResponseEntity.badRequest()
						.headers(HeaderUtil.createFailureAlert("post", "notOwner", "You are not owner of this post"))
						.body(null);
			// Kiem tra trang thai author
			if (author.checkStatus(Status.LOCKED))
				return ResponseEntity.badRequest()
						.headers(HeaderUtil.createFailureAlert("author", "locked", "Your account has been locked"))
						.body(null);
			// Kiem tra trang thai post
			if (post.checkStatus(Status.APPROVED))
				return ResponseEntity.badRequest()
						.headers(
								HeaderUtil.createFailureAlert("post", "approved", "You can't modify the approved post"))
						.body(null);
		}
		try {
			String path = postService.changeAvatar(file, id);
			post.setAvatar(path);
			postRepository.save(post);
			return new ResponseEntity<>(new AvatarDTO(path), HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	/**
	 * GET /posts/{id}/avatar/{size} : GET avatar of post
	 * 
	 */
	@RequestMapping(value = "/posts/{id}/avatar/{size}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@Timed
	public ResponseEntity<Resource> getAvatar(@PathVariable Long id, @PathVariable String size) {
		String path = "/posts/" + id + "/avatar/" + size;
		try {
			Resource avatar = storageService.loadResource(path);
			return ResponseEntity.ok().body(avatar);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	/**
	 * GET /posts : get all the posts.
	 *
	 * @param pageable
	 *            the pagination information
	 * @return the ResponseEntity with status 200 (OK) and the list of posts in
	 *         body
	 * @throws URISyntaxException
	 *             if there is an error to generate the pagination HTTP headers
	 */
	@RequestMapping(value = "/posts", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@Timed
	public ResponseEntity<List<PostLessDTO>> getAllPosts(Pageable pageable) throws URISyntaxException {
		log.debug("REST request to get a page of Posts");
		Page<Post> page = postRepository.findAll(pageable);
		HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, "/api/posts");
		return new ResponseEntity<>(postMapper.postsToPostLessDTOs(page.getContent()), headers, HttpStatus.OK);
	}

	/**
	 * GET /posts/:id : get the "id" post.
	 *
	 * @param id
	 *            the id of the postDTO to retrieve
	 * @return the ResponseEntity with status 200 (OK) and with body the
	 *         postDTO, or with status 404 (Not Found)
	 */
	@RequestMapping(value = "/posts/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@Timed
	public ResponseEntity<PostDTO> getPost(@PathVariable Long id) {
		log.debug("REST request to get Post : {}", id);
		Post post = postRepository.findOne(id);
		PostDTO postDTO = postMapper.postToPostDTO(post);
		return Optional.ofNullable(postDTO).map(result -> new ResponseEntity<>(result, HttpStatus.OK))
				.orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}

	/**
	 * DELETE /posts/:id : delete the "id" post.
	 *
	 * @param id
	 *            the id of the postDTO to delete
	 * @return the ResponseEntity with status 200 (OK)
	 */
	@RequestMapping(value = "/posts/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
	@Timed
	@Secured({ AuthoritiesConstants.AUTHOR, AuthoritiesConstants.ADMIN })
	public ResponseEntity<Void> deletePost(@PathVariable Long id) {
		log.debug("REST request to delete Post : {}", id);
		Post post = postRepository.findOne(id);
		if (!userService.hasAuthority(AuthoritiesConstants.ADMIN)) {
			Author author = authorService.getCurrentAuthor();
			// Kiem tra so huu
			if (!post.checkAuthor(author))
				return ResponseEntity.badRequest()
						.headers(HeaderUtil.createFailureAlert("post", "notOwner", "You are not owner of this post"))
						.body(null);
			// Kiem tra trang thai author
			if (author.checkStatus(Status.LOCKED))
				return ResponseEntity.badRequest()
						.headers(HeaderUtil.createFailureAlert("author", "locked", "Your account has been locked"))
						.body(null);
			// Kiem tra trang thai post
			if (post.checkStatus(Status.APPROVED))
				return ResponseEntity.badRequest()
						.headers(
								HeaderUtil.createFailureAlert("post", "approved", "You can't modify the approved post"))
						.body(null);
		}
		postRepository.delete(id);
		return ResponseEntity.ok().headers(HeaderUtil.createEntityDeletionAlert("post", id.toString())).build();
	}

	/**
	 * GET /posts/author/:id : get all the posts create by author.
	 *
	 * @param pageable
	 *            the pagination information
	 * @return the ResponseEntity with status 200 (OK) and the list of posts in
	 *         body
	 * @throws URISyntaxException
	 *             if there is an error to generate the pagination HTTP headers
	 */
	@RequestMapping(value = "/posts/author/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@Timed
	public ResponseEntity<List<PostLessDTO>> getAllPostByAuthors(Pageable pageable, @PathVariable Long id)
			throws URISyntaxException {
		log.debug("REST request to get a page of Posts");
		Page<Post> page = postRepository.findAllByAuthorId(pageable, id);
		HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, "/api/posts/author");
		return new ResponseEntity<>(postMapper.postsToPostLessDTOs(page.getContent()), headers, HttpStatus.OK);
	}

}
