package com.fullmark.service;

import org.springframework.stereotype.Service;

import java.util.Date;


public interface OrderService {
    void addRecord(int uid, int gid, int number, Date date);
}
