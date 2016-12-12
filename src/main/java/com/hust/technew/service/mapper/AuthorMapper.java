package com.hust.technew.service.mapper;

import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import com.hust.technew.domain.Author;
import com.hust.technew.service.dto.AuthorDTO;

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
