package com.fullmark.controller;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.servlet.KaptchaServlet;
import com.google.code.kaptcha.util.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Properties;

@Controller
public class BaseController {
    @Autowired
    private DefaultKaptcha captchaProducer;


    @RequestMapping("test")
    public String testImage(){
        return "verifyCode";
    }

    @RequestMapping("kaptcha")
    public void imagertn(HttpSession session, HttpServletResponse response) throws IOException {
//        DefaultKaptcha yzm = new DefaultKaptcha();
//        Properties properties = new Properties();
//        properties.
//        Config config = new Config(properties);
        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");
        String text = captchaProducer.createText();
        System.out.println("当前是"+text);
        BufferedImage image = captchaProducer.createImage(text);
        session.removeAttribute("myCode");
        session.setAttribute("myCode", text);
        Object myCode = session.getAttribute("myCode");
        System.out.println("当前session里是"+myCode);
        ServletOutputStream outputStream = response.getOutputStream();
        ImageIO.write(image,"jpg",outputStream);
    }

    @RequestMapping("checkKaptcha")
    @ResponseBody
    public String checkKaptcha(String kaptcha,HttpSession session){
        String myCode = (String) session.getAttribute("myCode");
        if(myCode.equals(kaptcha)){
            return "true";
        }
        return "false";
    }
}
