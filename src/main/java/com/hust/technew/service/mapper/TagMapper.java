package com.hust.technew.service.mapper;

import com.hust.technew.domain.*;
import com.hust.technew.service.dto.TagDTO;

import org.mapstruct.*;
import java.util.List;

/**
 * Mapper for the entity Tag and its DTO TagDTO.
 */
@Mapper(componentModel = "spring", uses = {})
public interface TagMapper {

    TagDTO tagToTagDTO(Tag tag);

    List<TagDTO> tagsToTagDTOs(List<Tag> tags);

    Tag tagDTOToTag(TagDTO tagDTO);

    List<Tag> tagDTOsToTags(List<TagDTO> tagDTOs);
}
