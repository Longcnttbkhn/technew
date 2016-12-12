package com.hust.technew.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.hust.technew.domain.Author;
import com.hust.technew.domain.Post;

/**
 * Spring Data JPA repository for the Post entity.
 */
@SuppressWarnings("unused")
public interface PostRepository extends JpaRepository<Post,Long> {
	Page<Post> findAllByAuthorId(Pageable pageable, Long id);
}
