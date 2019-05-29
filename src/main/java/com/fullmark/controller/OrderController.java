package com.fullmark.controller;


import com.fullmark.pojo.Order;
import com.fullmark.pojo.User;
import com.fullmark.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping("myOrder")
    public String myOrder(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        Integer id = user.getId();
        System.out.println("当前登录的用户ID是："+id);
        List<Order> orders=orderService.showMyOrder(id);
        model.addAttribute("orders", orders);
        return "order/myOrder";
    }
}