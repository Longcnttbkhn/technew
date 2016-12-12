package com.hust.technew.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hust.technew.domain.Author;

/**
 * Spring Data JPA repository for the Author entity.
 */
@SuppressWarnings("unused")
public interface AuthorRepository extends JpaRepository<Author,Long> {
	
	Optional<Author> findOneByUserId(Long id);
	
	Optional<Author> findOneById(Long authorId);
}
