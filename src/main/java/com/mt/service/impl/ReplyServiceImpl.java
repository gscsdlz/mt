package com.mt.service.impl;

import com.mt.dao.PostDao;
import com.mt.dao.ReplyDao;
import com.mt.entity.Reply;
import com.mt.service.PostService;
import com.mt.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {
    @Autowired
    private ReplyDao replyDao;

    @Autowired
    private PostDao postDao;

    @Override
    public boolean addReply(Reply r) {
        if (replyDao.addReply(r.getPostId(), r.getContent(), r.getReplyId(), r.getAccountId()) > 0) {
            return postDao.addReplyNum(r.getPostId()) > 0;
        }
        return false;
    }

    @Override
    public boolean delReply(int replyId) {
        return replyDao.delReply(replyId) > 0;
    }

    @Override
    public List<Reply> getAllReply(int postId, int page, int size) {
        List<Reply> res = replyDao.getAllReply(postId, (page - 1) * size, size);
        int idx = 1;
        for (Reply r : res) {
            r.setIdx(idx++);
        }
        return res;
    }

    @Override
    public int countAllReply() {
        return replyDao.countAllReply();
    }

    @Override
    public boolean updateContent(String content, int id) {
        return replyDao.updateContent(content, id) > 0;
    }

    @Override
    public List<Reply> getMeReply(int accountId, int page, int size) {
        return replyDao.getMeReply(accountId, (page - 1) * size, size);
    }

    @Override
    public List<Reply> getReplyMe(int accountId, int page, int size) {
        return replyDao.getReplyMe(accountId, (page - 1) * size, size);
    }
}
