package com.hust.technew.service;

import java.util.Optional;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hust.technew.domain.Author;
import com.hust.technew.domain.Authority;
import com.hust.technew.domain.User;
import com.hust.technew.repository.AuthorRepository;
import com.hust.technew.security.AuthoritiesConstants;

@Service
public class AuthorService {
	@Inject
	AuthorRepository authorRepository;
	
	@Inject
	UserService userService;
	
	public boolean hasAuthority(User user, String role) {
		boolean check = false;
		for (Authority authority : user.getAuthorities()) {
			if (authority.getName().equals(role))
				check = true;
		}
		return check;
	}
	
	public Author getCurrentAuthor() {
		User user = userService.getUserWithAuthorities();
//		user.getId();
		if (hasAuthority(user, AuthoritiesConstants.AUTHOR)) {
			Optional<Author> optionalAuthor = authorRepository.findOneByUserId(user.getId());
			return optionalAuthor.get();
		} else
			return null;
	}
}
