package com.yang.controller;

import com.yang.entity.User;
import com.yang.service.UserService;
import com.yang.utils.VerifyCodeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * 注册与登录实现
 */
@Controller
@RequestMapping("login")
public class LoginController {

    private UserService userService;
    @Autowired
    public LoginController(UserService userService) {
        this.userService = userService;
    }

    /**
     * 管理员登录
     * @param session
     * @param username
     * @param password
     * @param code
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping("logins")
    public String login(HttpSession session,String username,String password,String code) throws UnsupportedEncodingException {
        try {
            //拿到验证码
            String sessioncode = session.getAttribute("code").toString();
            //进行验证码判断是否输入正确
            if (!sessioncode.equalsIgnoreCase(code)) throw new RuntimeException("验证码错误，请重新输入");
            //登录判断
            User user = userService.login(username,password);
            System.out.println(username + "登录成功");
            //将登录成功的用户信息存入到session会话中
            session.setAttribute("user",user);
        } catch (Exception e) {
            e.printStackTrace();
            //拿到具体错误信息
            String errorMsg = e.getMessage();
            System.out.println("错误信息:" + errorMsg);
            session.setAttribute("errorMsg",errorMsg);
            return "redirect:/back/login.jsp";
        }
        return "back/index";
    }
    
    /**
     * 管理员注册
     * @param user
     * @return
     */
    @RequestMapping("register")
    @ResponseBody
    public Map<String,Object> register(User user){
        Map<String,Object> map = new HashMap<>();
        System.out.println(user);
        try {
            userService.register(user);
            System.out.println("注册用户成功！");
            map.put("status",true);
            map.put("msg","恭喜您 " + user.getRealname() + " 注册成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status",false);
            map.put("msg","此用户名已存在");
        }
        return map;
    }

    /**
     * 验证码生成
     * @param session
     * @param response
     * @throws IOException
     */
    @RequestMapping("usercode")
    public void generateVerifyCode(HttpSession session, HttpServletResponse response) throws IOException {
        //生成4位随机数
        String code = VerifyCodeUtils.generateVerifyCode(4);
        //放入session会话中
        session.setAttribute("code",code);
        //将生成的随机数生成图片，用response响应图片
        response.setContentType("image/png");
        ServletOutputStream os = response.getOutputStream();
        //转换为图片
        VerifyCodeUtils.outputImage(120,40,os,code);
    }

}
