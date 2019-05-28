package com.fullmark.service.impl;

import com.fullmark.dao.GoodsMapper;
import com.fullmark.pojo.Goods;
import com.fullmark.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsMapper goodsMapper;


    @Override
    public List<Goods> showGoodsList() {
        return goodsMapper.selectAll();
    }

    @Override
    public boolean isGoodsEnough(int gid, int number) {
        Goods goods = goodsMapper.selectByPrimaryKey(gid);
        return goods.getNumber()>=number?true:false;
    }

    @Override
    public void reduceNumber(int gid, int number) {
        Goods goods = new Goods();
        goods.setId(gid);
        goods.setNumber(number);
        goodsMapper.updateReduceNumber(goods);
    }
}
