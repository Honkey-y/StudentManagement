package com.yang.controller;

import com.yang.dao.StudentDAO;
import com.yang.entity.Student;
import com.yang.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("student")
public class StudentController {

    private StudentService studentService;
    @Autowired
    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    @RequestMapping("findOne")
    @ResponseBody//将控制器方法的返回值转为json，并响应给对应请求
    public Student findOne(String id){
        /*System.out.println("需要修改学生的信息：" + studentService.findOne(id));*/
        return studentService.findOne(id);
    }

    /**
     * 修改
     * @param student
     * @return
     */
    @RequestMapping("update")
    @ResponseBody//将控制器方法的返回值转为json，并响应给对应请求
    public Map<String,Object> update(Student student){
        Map<String,Object> map = new HashMap<>();
        System.out.println(student);
        try {
            studentService.update(student);
            map.put("status",true);
            map.put("msg","修改学生信息成功！");
            map.put("stunum",student.getStunum());
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status",false);
            map.put("msg","修改学生信息途中出错！");
        }
        return map;
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody//将控制器方法的返回值转为json，并响应给对应请求
    public Map<String,Object> delete(String id){
        Map<String,Object> map = new HashMap<>();
        System.out.println("id：" + id);
        //给map添加状态
        try {
            studentService.delete(id);
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
     *添加
     * @RequestMapping收集到前端数据
     */
    @RequestMapping("save")
    @ResponseBody//将控制器方法的返回值转为json，并响应给对应请求
    public Map<String,Object> save(Student student){
        Map<String,Object> map = new HashMap<>();
        System.out.println("学生信息：" + student);
        //给map添加状态
        try {
            studentService.save(student);
            //成功后
            map.put("status",true);
            map.put("msg","成功保存学生信息");
            map.put("name",student.getSname());
        } catch (Exception e) {
            //失败后
            e.printStackTrace();
            map.put("status",false);
            map.put("msg","保存学生信息途中出错！");
        }
        return map;
    }

    /**
     * 查询
     * @param model
     * @return
     */
    @RequestMapping("findAll")
    public String findAll(Model model){
        //接收学生list集合
        List<Student> students = studentService.findAll();
        //将学生信息添加到会话中
        model.addAttribute("students",students);
        System.out.println("对学生表查询成功！！！！！");
        //向到网页上展示
        return "back/student/StuList";
    }

}
