package com.yang.controller;


import com.yang.entity.User;
import com.yang.service.UserService;
import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {

    private UserService userService;
    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }


    /**
     * 修改用户信息 / 个人信息
     * @param user
     * @return
     */
    @RequestMapping("update")
    @ResponseBody//将控制器方法的返回值转为json，并响应给对应请求
    public Map<String,Object> update(User user,@Param("pd") Integer pd,@Param("pwd") String pwd, HttpSession session){
        Map<String,Object> map = new HashMap<>();
        System.out.println("判断是否为更改个人信息：" + pd);
        try {
            //判断修改管理员是修改 用户信息 还是 管理员密码
            if (pd!=null){
                System.out.println("成功进入更改个人信息");
                System.out.println("要修改的密码：" + pwd);
                //从session中拿到登录成功的user信息
                User users = (User) session.getAttribute("user");
                //将修改的新密码存入到user对象中
                users.setPassword(pwd);
                System.out.println("要修改用户的信息：" + users);
                userService.update(users);
                map.put("realname",users.getRealname());
            }else {
                System.out.println(user);
                userService.update(user);
                map.put("uid",user.getUid());
            }
            map.put("status",true);
            map.put("msg","修改用户信息成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status",false);
            map.put("msg","修改用户信息途中出错！");
        }
        return map;
    }


    @RequestMapping("findOne")
    @ResponseBody
    public User findOne(Integer id){
        System.out.println("要修改用户的id：" + id);
        //使用mapper文件直接进行注解数据库操作
        return userService.findOne(id);
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody//将控制器方法的返回值转为json，并响应给对应请求
    public Map<String,Object> delete(Integer id){
        Map<String,Object> map = new HashMap<>();
        System.out.println("id：" + id);
        //给map添加状态
        try {
            userService.delete(id);
            //成功后
            map.put("status",true);
            map.put("msg","成功删除学生");
        } catch (Exception e) {
            //失败后
            e.printStackTrace();
            map.put("status",false);
            map.put("msg","删除学生途中出错！");
        }
        return map;
    }

    /**
     * 添加用户
     * @param user
     * @return
     */
    @RequestMapping("save")
    @ResponseBody
    public Map<String,Object> save(User user){
        Map<String,Object> map = new HashMap<>();
        try {
            //既然是增加用户，那么直接使用做好的注册方法即可（插入操作）
            userService.register(user);
            map.put("status",true);
            map.put("msg","用户添加成功");
            map.put("name",user.getRealname());
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status",false);
        }
        return map;
    }


    /**
     * 查找并显示所有用户
     * @param model
     * @return
     */
    @RequestMapping("findAll")
    public String findAll(Model model, @RequestParam("pageNum") String StringPageNum, Integer pageSize, HttpSession session){
        //转为integer类型
        Integer pageNum = Integer.valueOf(StringPageNum);
        //当前页码
        session.setAttribute("pageNum",pageNum);
        System.out.println("页码：" + pageNum);
        //findAll(页码，一页展示的数据多少);
        //当前页数据
        List<User> users = userService.findAll(pageNum,pageSize);
        //总条数
        Long totals = userService.findTotals();
        System.out.println(totals);
        pageSize=7;
        //总页数
        Long totalPage = totals%pageSize==0?totals/pageSize:totals/pageSize+1;
        session.setAttribute("totalPage",totalPage);
        System.out.println("总页数："+totalPage);

        model.addAttribute("users",users);
        //网页展示
        return "back/user/UserList";
    }

}
