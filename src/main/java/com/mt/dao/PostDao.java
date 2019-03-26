package com.mt.dao;

import com.mt.entity.Post;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PostDao {
    int addPost(@Param("post_title") String postTitle, @Param("manager_id") int managerId);

    int delPost(@Param("id") int postId);

    List<Post> getAllPost(@Param("offset") int offset, @Param("limit") int limit);

    List<Post> getAllPostByUser(@Param("manager_id") int managerId, @Param("offset") int offset, @Param("limit") int limit);

    int updatePostTitle(@Param("id") int postId, @Param("post_title") String postTitle);
}
