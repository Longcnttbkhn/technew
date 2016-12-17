package com.hust.technew.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.hust.technew.domain.Author;
import com.hust.technew.domain.Post;
import com.hust.technew.domain.enumeration.Status;

/**
 * Spring Data JPA repository for the Post entity.
 */
@SuppressWarnings("unused")
public interface PostRepository extends JpaRepository<Post,Long> {
	Page<Post> findAllByAuthorIdOrderByCreatedDateDesc(Pageable pageable, Long id);
	
	Page<Post> findAllByStatusAndAuthorIdOrderByCreatedDateDesc(Pageable pageable, Status status, Long id);
	
	Page<Post> findAllByOrderByCreatedDateDesc(Pageable pageable);
	
	Page<Post> findAllByStatusOrderByCreatedDateDesc(Pageable pageable, Status status);
	
	Page<Post> findAllByCategoryIdOrderByCreatedDateDesc(Pageable pageable, Long id);
	
	Page<Post> findAllByStatusAndCategoryIdOrderByCreatedDateDesc(Pageable pageable, Status status, Long id);
	
}
