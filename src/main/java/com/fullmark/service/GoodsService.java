package com.fullmark.service;

import com.fullmark.pojo.Goods;

import java.util.List;

public interface GoodsService {
    public List<Goods> showGoodsList();

    boolean isGoodsEnough(int gid, int number);

    void reduceNumber(int gid, int number);

    void editGoods(int gid, String gname, String gdesc, int gnumber);

    void addNew(String gname, String gdesc, int gnumber);
}
