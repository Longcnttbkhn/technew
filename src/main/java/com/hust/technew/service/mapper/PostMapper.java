package com.hust.technew.service.mapper;

import com.hust.technew.domain.*;
import com.hust.technew.service.dto.PostDTO;
import com.hust.technew.service.dto.PostLessDTO;

import org.mapstruct.*;
import java.util.List;

/**
 * Mapper for the entity Post and its DTO PostDTO.
 */
@Mapper(componentModel = "spring", uses = {AuthorMapper.class, CategoryMapper.class, CommentMapper.class, })
public interface PostMapper {

	@Mapping(target = "roleAdmin", ignore = true)
	@Mapping(target = "roleOwner", ignore = true)
    PostDTO postToPostDTO(Post post);

    List<PostDTO> postsToPostDTOs(List<Post> posts);

    @Mapping(target = "comments", ignore = true)
    @Mapping(target = "author", ignore = true)
    @Mapping(target = "view", constant = "0")
    @Mapping(target = "status", constant = "PENDING")
    Post postDTOToPost(PostDTO postDTO);
    
    @Mapping(target = "comments", ignore = true)
    @Mapping(target = "author", ignore = true)
    @Mapping(target = "view", ignore = true)
    @Mapping(target = "status", ignore = true)
    void updateByAuthor(PostDTO postDTO, @MappingTarget Post post);
    
    @Mapping(target = "comments", ignore = true)
    @Mapping(target = "author", ignore = true)
    @Mapping(target = "view", ignore = true)
    void updateByAdmin(PostDTO postDTO, @MappingTarget Post post);
    
    List<Post> postDTOsToPosts(List<PostDTO> postDTOs);
    
    @Mapping(source = "author.name", target = "authorName")
    @Mapping(source = "category.name", target = "categoryName")
    PostLessDTO postToPostLessDTO(Post post);
    
    List<PostLessDTO> postsToPostLessDTOs(List<Post> posts);

    default Author authorFromId(Long id) {
        if (id == null) {
            return null;
        }
        Author author = new Author();
        author.setId(id);
        return author;
    }

    default Category categoryFromId(Long id) {
        if (id == null) {
            return null;
        }
        Category category = new Category();
        category.setId(id);
        return category;
    }
}
