package com.fullmark.service.impl;

import com.fullmark.dao.OrderMapper;
import com.fullmark.pojo.Order;
import com.fullmark.pojo.myOrder;
import com.fullmark.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Transactional
@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;


    @Override
    public void addRecord(int uid, int gid, int number, Date date) throws RuntimeException {
        Order order = new Order();
        order.setLeasingby(uid);
        order.setGoods(gid);
        order.setNumber(number);
        order.setCreatetime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date));
        order.setState(0);
        orderMapper.insertSelective(order);
    }

    @Override
    public List<myOrder> showMyOrder(Integer uid) {
        Order order = new Order();
        order.setLeasingby(uid);
        order.setState(0);
        return orderMapper.selectByUsernameAndState(order);
    }
}
