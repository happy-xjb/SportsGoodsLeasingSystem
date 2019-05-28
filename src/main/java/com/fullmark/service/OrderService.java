package com.fullmark.service;

import java.util.Date;

public interface OrderService {
    void addRecord(int uid, int gid, int number, Date date);
}
