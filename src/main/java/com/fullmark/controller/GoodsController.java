package com.fullmark.controller;

import com.fullmark.pojo.Goods;
import com.fullmark.service.GoodsService;
import com.fullmark.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("goods")
public class GoodsController {
    @Autowired
    private GoodsService goodsService;

    @Autowired
    private OrderService ordersService;


    @RequestMapping("index")
    public String index(Model model){
        List<Goods> goods = goodsService.showGoodsList();
        model.addAttribute("list", goods);
        return "goods/userIndex";
    }

    @Transactional
    @RequestMapping("leastThis")
    @ResponseBody
    public String  leastThis(int uid,int gid,int number){
        //判断商品数量
        boolean flag=goodsService.isGoodsEnough(gid,number);

        if(flag){
            //如果商品数量充足，商品数量减少，历史记录更新，返回success
            //1.商品数量减少
            goodsService.reduceNumber(gid,number);
            //2.历史记录更新
            Date date = new Date();
            ordersService.addRecord(uid,gid,number,date);
            //3.返回success
            return "success";
        }
        return "fail";
    }
}
