package com.fullmark.test;

import com.fullmark.dao.GoodsMapper;
import com.fullmark.dao.UserMapper;
import com.fullmark.pojo.Goods;
import com.fullmark.pojo.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class daoTest {
    public static void main(String[] args) {
        Date date = new Date();
        System.out.println(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date));
    }
}
