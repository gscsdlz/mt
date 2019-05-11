package com.mt.service;

import com.mt.entity.Reply;

import java.util.List;

public interface ReplyService {
    boolean addReply(Reply r);

    boolean delReply(int replyId);

    List<Reply> getAllReply(int postId, int page, int size);

    int countAllReply();

    boolean updateContent(String content, int id);

    List<Reply> getMeReply(int accountId, int page, int size);

    List<Reply> getReplyMe(int accountId, int page, int size);
}
