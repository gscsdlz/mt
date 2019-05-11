package com.mt.web;

import com.mt.entity.Post;
import com.mt.entity.Reply;
import com.mt.service.PostService;
import com.mt.service.ReplyService;
import com.mt.utils.DateTime;
import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/post")
public class PostController {

    @Autowired
    private PostService postService;

    @Autowired
    private ReplyService replyService;

    @RequestMapping("/index")
    private String index(Model model) {

        String today = DateTime.dateNow().substring(0, 10);

        List<Post> dateP = postService.getHotPostByDate();
        List<Post> replyP = postService.getHotPostByReply();
        List<Post> todayP = postService.getPostByDate(today);
        model.addAttribute("dateP", dateP);
        model.addAttribute("replyP", replyP);
        model.addAttribute("todayP", todayP);
        return "post";
    }

    @RequestMapping("/show")
    private String show(@RequestParam Map<String, Object> params, Model model) {
        ParamUtils p = new ParamUtils(params);
        int id = p.getInteger("id");
        int page = p.getInteger("page", 1);
        int size = p.getInteger("size", 10);
        Post post = postService.getPostById(id);
        List<Reply> replyList = replyService.getAllReply(id, page, size);

        model.addAttribute("post", post);
        model.addAttribute("replyList", replyList);
        model.addAttribute("page", page);
        model.addAttribute("total", 1);
        return "reply";
    }
}
