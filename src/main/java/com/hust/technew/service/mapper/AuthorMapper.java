package com.hust.technew.service.mapper;

import com.hust.technew.domain.*;
import com.hust.technew.service.dto.AuthorDTO;

import org.mapstruct.*;
import java.util.List;

/**
 * Mapper for the entity Author and its DTO AuthorDTO.
 */
@Mapper(componentModel = "spring", uses = {UserMapper.class, })
public interface AuthorMapper {

    @Mapping(source = "user.id", target = "userId")
    AuthorDTO authorToAuthorDTO(Author author);

    List<AuthorDTO> authorsToAuthorDTOs(List<Author> authors);

    @Mapping(source = "userId", target = "user")
    @Mapping(target = "posts", ignore = true)
    Author authorDTOToAuthor(AuthorDTO authorDTO);

    List<Author> authorDTOsToAuthors(List<AuthorDTO> authorDTOs);
}
