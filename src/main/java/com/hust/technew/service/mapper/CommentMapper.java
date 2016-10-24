package com.hust.technew.service.mapper;

import com.hust.technew.domain.*;
import com.hust.technew.service.dto.CommentDTO;

import org.mapstruct.*;
import java.util.List;

/**
 * Mapper for the entity Comment and its DTO CommentDTO.
 */
@Mapper(componentModel = "spring", uses = {UserMapper.class, })
public interface CommentMapper {

    @Mapping(source = "user.id", target = "userId")
    @Mapping(source = "post.id", target = "postId")
    CommentDTO commentToCommentDTO(Comment comment);

    List<CommentDTO> commentsToCommentDTOs(List<Comment> comments);

    @Mapping(source = "userId", target = "user")
    @Mapping(source = "postId", target = "post")
    Comment commentDTOToComment(CommentDTO commentDTO);

    List<Comment> commentDTOsToComments(List<CommentDTO> commentDTOs);

    default Post postFromId(Long id) {
        if (id == null) {
            return null;
        }
        Post post = new Post();
        post.setId(id);
        return post;
    }
}
