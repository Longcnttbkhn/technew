package com.hust.technew.service.mapper;

import com.hust.technew.domain.*;
import com.hust.technew.service.dto.PostDTO;

import org.mapstruct.*;
import java.util.List;

/**
 * Mapper for the entity Post and its DTO PostDTO.
 */
@Mapper(componentModel = "spring", uses = {TagMapper.class, })
public interface PostMapper {

    @Mapping(source = "author.id", target = "authorId")
    @Mapping(source = "category.id", target = "categoryId")
    PostDTO postToPostDTO(Post post);

    List<PostDTO> postsToPostDTOs(List<Post> posts);

    @Mapping(target = "comments", ignore = true)
    @Mapping(source = "authorId", target = "author")
    @Mapping(source = "categoryId", target = "category")
    Post postDTOToPost(PostDTO postDTO);

    List<Post> postDTOsToPosts(List<PostDTO> postDTOs);

    default Tag tagFromId(Long id) {
        if (id == null) {
            return null;
        }
        Tag tag = new Tag();
        tag.setId(id);
        return tag;
    }

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
