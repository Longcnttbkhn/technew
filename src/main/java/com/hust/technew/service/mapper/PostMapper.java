package com.hust.technew.service.mapper;

import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import com.hust.technew.domain.Category;
import com.hust.technew.domain.Post;
import com.hust.technew.domain.Tag;
import com.hust.technew.service.dto.PostDTO;

/**
 * Mapper for the entity Post and its DTO PostDTO.
 */
@Mapper(componentModel = "spring", uses = {UserMapper.class, TagMapper.class, })
public interface PostMapper {

    @Mapping(source = "author.id", target = "authorId")
    @Mapping(source = "category.id", target = "categoryId")
    PostDTO postToPostDTO(Post post);

    List<PostDTO> postsToPostDTOs(List<Post> posts);

    @Mapping(source = "authorId", target = "author")
    @Mapping(source = "categoryId", target = "category")
    Post postDTOToPost(PostDTO postDTO);

    List<Post> postDTOsToPosts(List<PostDTO> postDTOs);

    default Category categoryFromId(Long id) {
        if (id == null) {
            return null;
        }
        Category category = new Category();
        category.setId(id);
        return category;
    }

    default Tag tagFromId(Long id) {
        if (id == null) {
            return null;
        }
        Tag tag = new Tag();
        tag.setId(id);
        return tag;
    }
}
