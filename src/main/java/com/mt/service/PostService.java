package com.mt.service;

import com.mt.entity.Post;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface PostService {
    boolean updatePostTitle(String postTitle, int postId);

    int addPost(String PostTitle, int accountId);

    boolean delPost(int postId);

    List<Post> getAllPost(int page, int size);

    List<Post> getAllPostByUser(int accountId, int page, int size);

    Post getPostById(int postId);

    List<Post> getHotPostByDate();

    List<Post> getHotPostByReply();

    int countPostByDate(String date);

    int countPost();

    List<Post> getPostByDate(String date);

    Map<Integer, String> getMultiTitle(Set<Integer> ids);
}
