package com.yang.controller;

import com.yang.dao.CourseMapper;
import com.yang.entity.Course;
import com.yang.entity.Student;
import com.yang.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("course")
public class CourseController {

    @Autowired
    private CourseMapper courseMapper;

    /**
     * 根据id查询一个学生信息
     * @param id
     * @return
     */
    @RequestMapping("findOne")
    @ResponseBody//将控制器方法的返回值转为json，并响应给对应请求
    public Course findOne(Integer id){
        /*System.out.println("需要修改学生的信息：" + studentService.findOne(id));*/
        System.out.println("要修改的课程信息为："+courseMapper.findOne(id));
        return courseMapper.findOne(id);
    }

    /**
     *
     * @param course
     * @return修改课程
     */
    @RequestMapping("update")
    @ResponseBody//将控制器方法的返回值转为json，并响应给对应请求
    public Map<String,Object> update(Course course){
        Map<String,Object> map = new HashMap<>();
        System.out.println(course);
        try {
            courseMapper.update(course);
            map.put("status",true);
            map.put("msg","修改课程信息成功！");
            map.put("cid",course.getCid());
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status",false);
            map.put("msg","修改课程信息途中出错！");
        }
        return map;
    }

    /**
     * 删除课程
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
            courseMapper.delete(id);
            //成功后
            map.put("status",true);
            map.put("msg","成功删除课程");
        } catch (Exception e) {
            //失败后
            e.printStackTrace();
            map.put("status",false);
            map.put("msg","删除课程途中出错！");
        }
        return map;
    }


    /**
     *添加课程方法
     * @RequestMapping收集到前端数据
     */
    @RequestMapping("save")
    @ResponseBody//将控制器方法的返回值转为json，并响应给对应请求
    public Map<String,Object> save(Course course){
        Map<String,Object> map = new HashMap<>();
        System.out.println("课程信息：" + course);
        //给map添加状态
        try {
            courseMapper.save(course);
            //成功后
            map.put("status",true);
            map.put("msg","成功保存学生信息");
            map.put("name",course.getCname());
        } catch (Exception e) {
            //失败后
            e.printStackTrace();
            map.put("status",false);
            map.put("msg","保存学生信息途中出错！");
        }
        return map;
    }

    /**
     * 查询课程
     * @param model
     * @return
     */
    @RequestMapping("findAll")
    public String findAll(Model model){
        //接收课程list集合
        List<Course> courses = courseMapper.findAll();
        //将课程信息添加到会话中
        model.addAttribute("courses",courses);
        System.out.println("课程表查询成功,为："+courses);
        //向到网页上展示
        return "back/scourse/ScoList";
    }

    @RequestMapping("findAllCourse")
    @ResponseBody
    public Map<String,Object> findAllCourse(){
        Map<String,Object> map = new HashMap<>();
        //接收课程list集合
        List<Course> courses = courseMapper.findAll();
        System.out.println("所有课程查询成功："+courses);
        map.put("status",true);
        map.put("courses",courses);
        return map;
    }


}
