package com.mt.web.admin;

import com.mt.entity.Post;
import com.mt.entity.Reply;
import com.mt.service.PostService;
import com.mt.service.ReplyService;
import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/post")
public class AdminPostController {
    @Autowired
    private PostService postService;

    @Autowired
    private ReplyService replyService;

    @RequestMapping("/index")
    private String getAllPost(@RequestParam Map<String, Object> param, Model model) {
        ParamUtils p = new ParamUtils(param);
        int page = p.getInteger("page", 1);
        int size = p.getInteger("size", 15);
        List<Post> res = postService.getAllPost(page, size);
        model.addAttribute("data", res);
        model.addAttribute("menu", "post");
        return "/admin/post_manage";
    }

    @RequestMapping("/reply")
    private String getAllReply(@RequestParam Map<String, Object> param, Model model) {
        ParamUtils p = new ParamUtils(param);
        int postId = p.getInteger("post_id");
        int page = p.getInteger("page", 1);
        int size = p.getInteger("size", 15);
        List<Reply> res = replyService.getAllReply(postId, page, size);
        Post post = postService.getPostById(postId);

        model.addAttribute("post", post);
        model.addAttribute("menu", "post");
        model.addAttribute("data", res);
        return "/admin/reply_manage";
    }
}
