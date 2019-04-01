package com.mt.service;

import com.mt.entity.Reply;

import java.util.List;

public interface ReplyService {
    boolean addReply();

    boolean delReply(int replyId);

    List<Reply> getAllReply(int postId, int page, int size);
}
