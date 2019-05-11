package com.mt.dao;

import com.mt.entity.Reply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyDao {
    List<Reply> getAllReply(@Param("post_id") int postId, @Param("offset") int offset, @Param("limit") int limit);

    int delReply(@Param("id") int id);

    int addReply(
            @Param("post_id") int postId,
            @Param("content") String content,
            @Param("reply_id") int replyId,
            @Param("account_id") int accountId);

    int countAllReply();

    int updateContent(@Param("content") String content, @Param("id") int id);

    List<Reply> getMeReply(@Param("account_id") int accountId, @Param("offset") int offset, @Param("limit") int limit);

    List<Reply> getReplyMe(@Param("account_id") int accountId, @Param("offset") int offset, @Param("limit") int limit);

}
