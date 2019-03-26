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
}
