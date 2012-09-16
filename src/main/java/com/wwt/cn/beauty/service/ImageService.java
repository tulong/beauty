package com.wwt.cn.beauty.service;

import java.net.URL;

import org.springframework.web.multipart.MultipartFile;

public interface ImageService {

	public URL uploadProductImage(MultipartFile imgFile,String categroyString)throws Exception;
}
