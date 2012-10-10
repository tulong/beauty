package com.wwt.cn.beauty.repository;

import org.bson.types.ObjectId;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.wwt.cn.beauty.model.Image;

public interface ImageRepository extends PagingAndSortingRepository<Image, ObjectId> {

}
