package com.mt.service.impl;

import com.mt.dao.PostDao;
import com.mt.entity.Post;
import com.mt.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostServiceImpl implements PostService {
    @Autowired
    private PostDao postDao;

    @Override
    public boolean updatePostTitle(String postTitle, int postId) {
        return postDao.updatePostTitle(postId, postTitle) > 0;
    }

    @Override
    public boolean addPost(String PostTitle, int accountId) {
        return postDao.addPost(PostTitle, accountId) > 0;
    }

    @Override
    public boolean delPost(int postId) {
        return postDao.delPost(postId) > 0;
    }

    @Override
    public List<Post> getAllPost(int page, int size) {
        return postDao.getAllPost((page-1) * size, size);
    }

    @Override
    public List<Post> getAllPostByUser(int accountId, int page, int size) {
        return postDao.getAllPostByUser(accountId, (page-1) * size, size);
    }

    @Override
    public Post getPostById(int postId) {
        return postDao.getPostById(postId);
    }

    @Override
    public List<Post> getHotPostByDate() {
        return postDao.getHotPostByDate();
    }

    @Override
    public List<Post> getHotPostByReply() {
        return postDao.getHotPostByReply();
    }

    @Override
    public int countPostByDate(String date) {
        return postDao.countPostByDate(date + " 00:00:00", date + " 23:59:59");
    }

    @Override
    public int countPost() {
        return postDao.countPost();
    }

    @Override
    public List<Post> getPostByDate(String date) {
        return postDao.getPostByDate(date + " 00:00:00", date + " 23:59:59");
    }
}
