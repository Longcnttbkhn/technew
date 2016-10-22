package com.hust.technew.service.mapper;

import com.hust.technew.domain.*;
import com.hust.technew.service.dto.CommentDTO;

import org.mapstruct.*;
import java.util.List;

/**
 * Mapper for the entity Comment and its DTO CommentDTO.
 */
@Mapper(componentModel = "spring", uses = {})
public interface CommentMapper {

    CommentDTO commentToCommentDTO(Comment comment);

    List<CommentDTO> commentsToCommentDTOs(List<Comment> comments);

    Comment commentDTOToComment(CommentDTO commentDTO);

    List<Comment> commentDTOsToComments(List<CommentDTO> commentDTOs);
}
