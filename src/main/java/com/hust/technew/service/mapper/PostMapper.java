package com.hust.technew.service.mapper;

import com.hust.technew.domain.*;
import com.hust.technew.service.dto.PostDTO;

import org.mapstruct.*;
import java.util.List;

/**
 * Mapper for the entity Post and its DTO PostDTO.
 */
@Mapper(componentModel = "spring", uses = {})
public interface PostMapper {

    PostDTO postToPostDTO(Post post);

    List<PostDTO> postsToPostDTOs(List<Post> posts);

    Post postDTOToPost(PostDTO postDTO);

    List<Post> postDTOsToPosts(List<PostDTO> postDTOs);
}
