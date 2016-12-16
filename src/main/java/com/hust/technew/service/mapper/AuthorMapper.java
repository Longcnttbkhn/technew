package com.hust.technew.service.mapper;

import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

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
    
    @Mapping(target = "user", ignore = true)
    @Mapping(target = "posts", ignore = true)
    @Mapping(target = "status", ignore = true)
    void updateByAuthor(AuthorDTO authorDTO, @MappingTarget Author author);
    
    @Mapping(target = "user", ignore = true)
    @Mapping(target = "posts", ignore = true)
    void updateByAdmin(AuthorDTO authorDTO, @MappingTarget Author author);

    List<Author> authorDTOsToAuthors(List<AuthorDTO> authorDTOs);
}
