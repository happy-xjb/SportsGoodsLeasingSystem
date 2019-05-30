package com.fullmark.controller;


import com.fullmark.pojo.User;
import com.fullmark.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("login")
    @ResponseBody
    public int login(String username,String password, HttpSession session){
        //先检查用户名是否存在
        if(userService.checkUserExists(username)==false)    return -1;

        //再尝试登录
        User user = userService.login(username, password);
        if(user==null){
            //用户名密码不正确，返回0
            return 0;
        }else{
            session.setAttribute("user", user); //放入session
            //用户返回1，管理员返回2
            return user.getIsadmin()==0 ? 1 : 2;
        }
    }

    @RequestMapping("userIndex")
    public String userIndex(){
        return "forward:/goods/index";
    }

    @RequestMapping("checkUserExists")
    @ResponseBody
    public int checkUserExists(String username){
        return userService.checkUserExists(username)==true?1:0;
    }

    @RequestMapping("register")
    public void register(String username,String password,String nickname,String leasingPassword,int isAdmin){
        userService.register(username,password,nickname,leasingPassword,isAdmin);
    }


    //管理员主页
    @RequestMapping("adminIndex")
    public String adminIndex(){
        return "admin/index";
    }

    //个人信息页面
    @RequestMapping("userInfo")
    public String userInfo(Model model,HttpSession session){
        User user = (User) session.getAttribute("user");
        User loginUser = userService.getLoginUser(user.getUsername());
        model.addAttribute("user1", loginUser);
        return "user/info";
    }

    //验证租赁密码
    @RequestMapping("checkLeasingPassword")
    @ResponseBody
    public String checkLeasingPassword(int uid,String leasingPassword){
        System.out.println("传入的租赁密码："+leasingPassword);
        User user = userService.verifyLeasingPassword(uid,leasingPassword);
        System.out.println("查询出的user是："+user);
        if(user==null)  return "false";
        return "true";
    }
}
