package com.mt.dao;

import com.mt.entity.Reply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyDao {
    List<Reply> getAllReply(@Param("post_id") int postId, @Param("offset") int offset, @Param("limit") int limit);

    int delReply(@Param("id") int id);

    int addReply();

}
