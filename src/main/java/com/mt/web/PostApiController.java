package com.mt.web;

import com.mt.dto.NormalResponse;
import com.mt.entity.Post;
import com.mt.entity.Reply;
import com.mt.enums.AccountType;
import com.mt.service.PostService;
import com.mt.service.ReplyService;
import com.mt.utils.DateTime;
import com.mt.utils.ParamUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.NotReadablePropertyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.tags.HtmlEscapeTag;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/post_api", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=utf-8")
public class PostApiController {

    @Autowired
    private PostService postService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/get_hot_date")
    private NormalResponse<List<Post>> getHotByDate() {
        NormalResponse<List<Post>> response = new NormalResponse<>();
        List<Post> res = postService.getHotPostByDate();
        response.setData(res);
        return response;
    }

    @RequestMapping("/get_hot_reply")
    private NormalResponse<List<Post>> getHotByReplyt() {
        NormalResponse<List<Post>> response = new NormalResponse<>();
        List<Post> res = postService.getHotPostByReply();
        response.setData(res);
        return response;
    }

    @RequestMapping("/static")
    private NormalResponse<Map<String, Integer>> getStatic() {
        NormalResponse<Map<String, Integer>> response = new NormalResponse<>();
        Map<String, Integer> info = new HashMap<>();

        String today = DateTime.dateNow().substring(0, 10);

        info.put("total_post", postService.countPost());
        info.put("today_post", postService.countPostByDate(today));
        info.put("all_reply", replyService.countAllReply());
        response.setData(info);
        return response;
    }

    @RequestMapping("/add_reply")
    private NormalResponse<String> addReply(@RequestParam Map<String, Object> param) {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        String content = p.getString("content");
        int postId = p.getInteger("postId");
        int accountId = Integer.parseInt(request.getSession().getAttribute("id").toString());


        Reply r = new Reply();
        r.setContent(content);
        r.setPostId(postId);
        r.setAccountId(accountId);
        r.setReplyId(0);
        if (!replyService.addReply(r)) {
            response.setInfo("添加失败");
        }
        return response;
    }

    @RequestMapping("/update_reply")
    private NormalResponse<String> updateReply(@RequestParam Map<String, Object> param) {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        String content = p.getString("content");
        int id = p.getInteger("id");

        if (!replyService.updateContent(content, id)) {
            response.setInfo("修改失败");
        }
        return response;
    }

    @RequestMapping("/append_reply")
    private NormalResponse<String> appendReply(@RequestParam Map<String, Object> param) {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        String content = p.getString("content");
        int postId = p.getInteger("postId");
        int replyId = p.getInteger("id");
        int accountId = Integer.parseInt(request.getSession().getAttribute("id").toString());

        Reply r = new Reply();
        r.setContent(content);
        r.setPostId(postId);
        r.setReplyId(replyId);
        r.setAccountId(accountId);
        if (!replyService.addReply(r)) {
            response.setInfo("添加失败");
        }
        return response;
    }

    @RequestMapping("/del_reply")
    private NormalResponse<String> delReply(@RequestParam Map<String, Object> param) {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        int id = p.getInteger("id");
        if (!replyService.delReply(id)) {
            response.setInfo("删除失败");
        }
        return response;
    }

    @RequestMapping("/del_post")
    private NormalResponse<String> delPost(@RequestParam Map<String, Object> param) {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        int id = p.getInteger("postId");
        int accountId = Integer.parseInt(request.getSession().getAttribute("id").toString());
        int pri = Integer.parseInt(request.getSession().getAttribute("pri").toString());

        Post post = postService.getPostById(id);
        if (post.getManagerId() == accountId || pri == AccountType.SUPER_ADMIN.ordinal()) {
            if (!postService.delPost(id)) {
                response.setInfo("删除失败");
            }
        } else {
            response.setInfo("只有发帖者和超级管理员可以删除整个帖子");
        }
        return response;
    }
}
