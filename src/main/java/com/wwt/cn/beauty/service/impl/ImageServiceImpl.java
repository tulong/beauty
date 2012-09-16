package com.wwt.cn.beauty.service.impl;

import java.net.URL;

import org.springframework.web.multipart.MultipartFile;

import com.aliyun.openservices.ClientException;
import com.aliyun.openservices.oss.OSSClient;
import com.aliyun.openservices.oss.OSSException;
import com.aliyun.openservices.oss.model.Bucket;
import com.aliyun.openservices.oss.model.ObjectListing;
import com.aliyun.openservices.oss.model.ObjectMetadata;
import com.wwt.cn.beauty.service.ImageService;

public class ImageServiceImpl implements ImageService {

    private OSSClient client ;
    //TODO 输入你的accessId和accessKey
    private String accessId = "7j6rygo7b4orxhqoq5eq40he";
    private String accessKey = "p7zvuGpGIp3cX+/9WybadCxDmgk=";
    private String ossEndpoint = "http://storage.aliyun.com/";
    
	@Override
	public URL uploadProductImage(MultipartFile imgFile, String categroyString)
			throws Exception {
		// TODO Auto-generated method stub

        client = new OSSClient(ossEndpoint, accessId, accessKey);

        ObjectMetadata objectMeta = new ObjectMetadata();
        
		String objectName=imgFile.getOriginalFilename();
		
//		String bucketString="pic_storage/"+categroyString;
		String bucketString="pic_storage";
		ensureBucket(client, bucketString);

        objectMeta.setContentLength(imgFile.getSize());
        //上传文件
        client.putObject(bucketString, categroyString+"/"+objectName, imgFile.getInputStream(), objectMeta);
        
		URL picuUrl=new URL(ossEndpoint+bucketString+"/"+categroyString+"/"+objectName);
		return picuUrl;
	}
	
    private static void ensureBucket(OSSClient client, String bucketName)
            throws OSSException, ClientException{

        if (client.isBucketExist(bucketName)){
            return;
        }

        //创建bucket
        client.createBucket(bucketName);
    }

}
