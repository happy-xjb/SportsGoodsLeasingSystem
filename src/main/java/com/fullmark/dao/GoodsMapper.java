package com.fullmark.dao;

import com.fullmark.pojo.Goods;

import java.util.List;

public interface GoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

    List<Goods> selectAll();

    void updateReduceNumber(Goods goods);

    void insertAddNew(Goods goods);

    void insertAddNew1(Goods goods);
}