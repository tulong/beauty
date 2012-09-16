package com.wwt.cn.beauty.repository;

import org.bson.types.ObjectId;
import org.springframework.data.repository.CrudRepository;

import com.wwt.cn.beauty.model.Image;

public interface ImageRepository extends CrudRepository<Image, ObjectId> {

}
