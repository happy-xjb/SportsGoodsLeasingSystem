package com.fullmark.service;

import com.fullmark.pojo.Order;

import java.util.Date;
import java.util.List;

public interface OrderService {
    void addRecord(int uid, int gid, int number, Date date);

    List<Order> showMyOrder(Integer id);
}
