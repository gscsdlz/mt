package com.mt.web;

import com.mt.dto.NormalResponse;
import com.mt.entity.Post;
import com.mt.service.PostService;
import com.mt.service.ReplyService;
import com.mt.utils.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
