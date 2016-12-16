package com.hust.technew.service;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hust.technew.config.JHipsterProperties;

@Service
public class StorageService {

	private final String rootLocation;

	private final int LG = 320;
	private final int MD = 160;
	private final int SM = 80;
	private final int XS = 40;

	@Autowired
	public StorageService(JHipsterProperties jhHipsterProperties) {
		this.rootLocation = jhHipsterProperties.getStorage().getLocation();
	}

	private static BufferedImage resizeImage(BufferedImage originalImage, int IMG_WIDTH, int IMG_HEIGHT) {
		int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
		BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
		g.dispose();
		return resizedImage;
	}

	public void saveAvatar(MultipartFile fileSource, String path) throws IOException {
		String pathStr = rootLocation + path;
		Path pathDist = Paths.get(pathStr);
		File fileDist = pathDist.toFile();
		if (!fileDist.exists()) {
			fileDist.mkdirs();
		} else {
			if (fileDist.list().length != 0) {
				FileUtils.cleanDirectory(fileDist);
			}
		}
		BufferedImage bImg = ImageIO.read(fileSource.getInputStream());
		BufferedImage resizeImg = resizeImage(bImg, LG, LG);
		ImageIO.write(resizeImg, "png", pathDist.resolve("lg").toFile());
		resizeImg = resizeImage(bImg, MD, MD);
		ImageIO.write(resizeImg, "png", pathDist.resolve("md").toFile());
		resizeImg = resizeImage(bImg, SM, SM);
		ImageIO.write(resizeImg, "png", pathDist.resolve("sm").toFile());
		resizeImg = resizeImage(bImg, XS, XS);
		ImageIO.write(resizeImg, "png", pathDist.resolve("xs").toFile());
	}

	public Resource loadResource(String path) throws MalformedURLException {
		String resourcePath = rootLocation + path;
		Resource resource = new UrlResource(Paths.get(resourcePath).toUri());
		if (!resource.exists())
			throw new MalformedURLException();
		return resource;
	}

}
