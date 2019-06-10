package com.fullmark.controller;

import com.fullmark.pojo.Goods;
import com.fullmark.service.GoodsService;
import com.fullmark.service.OrderService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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

    @RequestMapping("adminIndex")
    public String adminIndex(Model model){
        List<Goods> goods = goodsService.showGoodsList();
        model.addAttribute("goodsList", goods);
        return "admin/index";
    }

    @RequestMapping("edit")
    @ResponseBody
    public String edit(int gid,String gname,String gdesc,int gnumber){
        goodsService.editGoods(gid,gname,gdesc,gnumber);
        return "success";
    }

    @RequestMapping("addNew")
    @ResponseBody
    public String addNew(String gname,String gdesc,int gnumber){
        goodsService.addNew(gname,gdesc,gnumber);
        return "success";
    }


    @RequestMapping("addNew1")
    @ResponseBody
    public String addNew1(HttpServletRequest request, String gname, String gdesc,  String gnumber, @RequestParam(required = false) MultipartFile gimage) throws IOException {
        System.out.println("接受到的名字为："+gname);
        System.out.println("接受到的数量为："+gnumber);
        if(gimage!=null){
            String filename = gimage.getOriginalFilename();
            //拿到文件名
            System.out.println("originalFilename是："+filename);
            //使用UUID给图片重命名，并去掉四个“-”
            String name = UUID.randomUUID().toString().replaceAll("-", "");
            //获取文件的扩展名
            String ext = FilenameUtils.getExtension(gimage.getOriginalFilename());
            //设置图片上传路径
            String url = request.getSession().getServletContext().getRealPath("/static/image");
            System.out.println(url);
            //以绝对路径保存重名命后的图片
            gimage.transferTo(new File(url+"/"+name + "." + ext));
            goodsService.addNew1(gname, gdesc, Integer.parseInt(gnumber), name+"."+ext);
        }else {
            goodsService.addNew(gname, gdesc, Integer.parseInt(gnumber));
        }


        return "success";
    }
}
