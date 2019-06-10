package com.fullmark.service.impl;

import com.fullmark.dao.GoodsMapper;
import com.fullmark.pojo.Goods;
import com.fullmark.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Transactional
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

    @Override
    public void editGoods(int gid, String gname, String gdesc, int gnumber) {
        Goods goods = new Goods();
        goods.setId(gid);
        goods.setName(gname);
        goods.setDescription(gdesc);
        goods.setNumber(gnumber);
        goodsMapper.updateByPrimaryKeySelective(goods);
    }

    @Override
    public void addNew(String gname, String gdesc, int gnumber) {
        Goods goods = new Goods();
        goods.setName(gname);
        goods.setDescription(gdesc);
        goods.setNumber(gnumber);
        goodsMapper.insertAddNew(goods);
    }

    @Override
    public void addNew1(String gname, String gdesc,  int gnumber, String gimage) {
        Goods goods = new Goods();
        goods.setName(gname);
        goods.setDescription(gdesc);
        goods.setNumber(gnumber);
        goods.setPicture(gimage);
        goodsMapper.insertAddNew1(goods);
    }
}
