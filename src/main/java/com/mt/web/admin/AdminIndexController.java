package com.mt.web.admin;

import com.mt.entity.Reply;
import com.mt.service.*;
import com.mt.utils.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@Controller
@RequestMapping("/admin")
public class AdminIndexController {

    @Autowired
    private StoreService storeService;

    @Autowired
    private ItemService itemService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private PostService postService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private AccountService accountService;

    @RequestMapping("/index")
    private String index(Model model) {
        Map<String, Integer> staticMap = new HashMap<>();

        staticMap.put("all_reply", replyService.countAllReply());
        staticMap.put("all_post", postService.countPost());
        staticMap.put("all_order", orderService.countOrder());
        staticMap.put("order_done", staticMap.get("all_order") - orderService.countUnOrder());
        staticMap.put("all_store", storeService.countStore());
        staticMap.put("all_item", itemService.countItem());

        int ts = DateTime.currTs();
        String lastMonth = DateTime.toDate(ts - 86400 * 30);
        List<String> accountDate = accountService.groupByMonth(lastMonth);
        List<String> orderDate = orderService.groupByMonth(lastMonth);

        model.addAttribute("info", staticMap);
        model.addAttribute("menu", "index");
        model.addAttribute("account_data", mergeDate(accountDate));
        model.addAttribute("order_data", mergeDate(orderDate));
        return "admin/index";
    }

    private Map<String, Integer> mergeDate(List<String> data) {
        Map<String, Integer> res = new TreeMap<>();
        int ts = DateTime.currTs();
        for (int i = 0; i <= 30; i++) {
            res.put(DateTime.toDate(ts - 86400 * i), 0);
        }
        for (String str : data) {
            String key = str.substring(0, 10);
            res.put(key, res.get(key) + 1);
        }
        return res;
    }

}
