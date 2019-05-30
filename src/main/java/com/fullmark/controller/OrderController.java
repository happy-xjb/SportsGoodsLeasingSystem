package com.fullmark.controller;


import com.fullmark.pojo.Order;
import com.fullmark.pojo.User;
import com.fullmark.pojo.myOrder;
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
        List<myOrder> orders=orderService.showMyOrder(id);
        model.addAttribute("orders", orders);
        return "order/myOrder";
    }
    @RequestMapping("orderHistory")
    public String orderHistory(Model model,HttpSession session){
        User user = (User) session.getAttribute("user");
        Integer id = user.getId();
        List<myOrder> orders = orderService.showHistory(id);
        model.addAttribute("orders", orders);
        return "order/orderHistory";

    }
}
