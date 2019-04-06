package com.mt.service;

import com.mt.entity.Post;

import java.util.List;

public interface PostService {
    boolean updatePostTitle(String postTitle, int postId);

    boolean addPost(String PostTitle, int accountId);

    boolean delPost(int postId);

    List<Post> getAllPost(int page, int size);

    List<Post> getAllPostByUser(int accountId, int page, int size);

    Post getPostById(int postId);
}
