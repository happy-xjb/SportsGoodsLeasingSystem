package com.fullmark.test;

import com.fullmark.dao.GoodsMapper;
import com.fullmark.dao.UserMapper;
import com.fullmark.pojo.Goods;
import com.fullmark.pojo.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class daoTest {
    public static void main(String[] args) {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring.xml");
        GoodsMapper goodsMapper = (GoodsMapper) applicationContext.getBean("goodsMapper");
        List<Goods> goods = goodsMapper.selectAll();
        System.out.println(goods);
    }
}
