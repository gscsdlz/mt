package com.mt.web;

import com.mt.entity.Account;
import com.mt.entity.Order;
import com.mt.entity.Reply;
import com.mt.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/user")

public class AccountController {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private AccountService accountService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private PostService postService;

    @Autowired
    private ReplyService replyService;

    @RequestMapping("/me")
    private String center(Model model) {
        int accountId = Integer.parseInt(request.getSession().getAttribute("id").toString());
        Account a = accountService.getAccountById(accountId);

        model.addAttribute("account", a);
        return "me";
    }

    @RequestMapping("/order")
    private String order(Model model) {
        int accountId = Integer.parseInt(request.getSession().getAttribute("id").toString());
        int page = 1;
        int size = 15;
        List<Order> orders = orderService.getOrderByUser(accountId, page, size);

        model.addAttribute("data", orders);
        return "me_order";
    }

    @RequestMapping("/info")
    private String info(Model model) {

        int uid = Integer.parseInt(request.getSession().getAttribute("id").toString());
        Account a = accountService.getAccountById(uid);

        model.addAttribute("account", a);
        return "me_info";
    }

    @RequestMapping("/sec")
    private String sec(Model model) {

        int uid = Integer.parseInt(request.getSession().getAttribute("id").toString());
        Account a = accountService.getAccountById(uid);

        model.addAttribute("account", a);
        return "me_sec";
    }

    @RequestMapping("/post")
    private String post(Model model) {
        int uid = Integer.parseInt(request.getSession().getAttribute("id").toString());

        List<Reply> meReply = replyService.getMeReply(uid, 1, 30);
        List<Reply> replyMe = replyService.getReplyMe(uid, 1, 30);
        Set<Integer> ids = new HashSet<>();

        if (meReply.size() > 0) {
            for (Reply r : meReply) {
                ids.add(r.getPostId());
            }
        }
        if (replyMe.size() > 0) {
            for (Reply r : replyMe) {
                ids.add(r.getPostId());
            }
        }
        Map<Integer, String> postMap = postService.getMultiTitle(ids);

        model.addAttribute("my_post", postService.getAllPostByUser(uid, 1, 30));
        model.addAttribute("me_reply", meReply);
        model.addAttribute("reply_me", replyMe);
        model.addAttribute("postMap", postMap);
        return "me_post";
    }
}
