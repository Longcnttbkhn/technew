package com.hust.technew.service;

import java.io.IOException;
import java.util.Optional;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hust.technew.domain.Author;
import com.hust.technew.domain.Authority;
import com.hust.technew.domain.User;
import com.hust.technew.repository.AuthorRepository;
import com.hust.technew.repository.UserRepository;
import com.hust.technew.security.AuthoritiesConstants;
import com.hust.technew.security.SecurityUtils;

@Service
public class AuthorService {
	@Inject
	AuthorRepository authorRepository;
	
	@Inject
	UserService userService;
	
	@Inject
	StorageService storageService;
	
	@Inject
	UserRepository userRepository;
	
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
	
	public String changeAvatar(MultipartFile file) throws IOException {
	    User user = userRepository.findOneByLogin(SecurityUtils.getCurrentUserLogin()).get();
	    Author author = authorRepository.findOneByUserId(user.getId()).get();
	    String path = "/authors/" + author.getId() + "/avatar";
	    storageService.saveAvatarAuthor(file, path);
	    author.setAvatar("/api" + path + "/");
	    authorRepository.save(author);
	    return "/api" + path + "/";
	}
}
