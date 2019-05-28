package com.fullmark.service.impl;

import com.fullmark.dao.OrderMapper;
import com.fullmark.pojo.Order;
import com.fullmark.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Override
    public void addRecord(int uid, int gid, int number, Date date) {
        Order order = new Order();
        order.setLeasingby(uid);
        order.setGoods(gid);
        order.setNumber(number);
        order.setCreatetime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date));
        order.setState(0);
        System.out.println(order);
        System.out.println("调用mapper");
        orderMapper.insertSelective(order);
    }
}
