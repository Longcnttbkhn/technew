package com.hust.technew.service;

import java.io.IOException;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class PostService {
	@Inject
	private StorageService storageService;
	
	public String changeAvatar(MultipartFile file, Long id) throws IOException {
	    String path = "/posts/" + id + "/avatar";
	    storageService.saveAvatar(file, path);
	    return "/api" + path + "/";
	}
}
