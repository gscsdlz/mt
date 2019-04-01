package com.mt.web.admin;

import com.mt.dto.NormalResponse;
import com.mt.service.PostService;
import com.mt.service.ReplyService;
import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/admin/post_api", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json;charset=utf-8")
public class AdminPostApiController {
    @Autowired
    private PostService postService;

    @Autowired
    private ReplyService replyService;

    @RequestMapping("/del_post")
    private NormalResponse<String> delPost(@RequestParam Map<String, Object> param) {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        int postId = p.getInteger("post_id");
        if (!postService.delPost(postId)) {
            response.setInfo("");
        }
        return response;
    }

    @RequestMapping("/del_reply")
    private NormalResponse<String> delReply(@RequestParam Map<String, Object> param) {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        int id = p.getInteger("id");
        if (!replyService.delReply(id)) {
            response.setInfo("");
        }
        return response;
    }
}
