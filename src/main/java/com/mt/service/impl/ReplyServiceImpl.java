package com.mt.service.impl;

import com.mt.dao.ReplyDao;
import com.mt.entity.Reply;
import com.mt.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {
    @Autowired
    private ReplyDao replyDao;

    @Override
    public boolean addReply() {
        return false;
    }

    @Override
    public boolean delReply(int replyId) {
        return replyDao.delReply(replyId) > 0;
    }

    @Override
    public List<Reply> getAllReply(int postId, int page, int size) {
        List<Reply> res = replyDao.getAllReply(postId, (page-1) * size, size);
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
}
