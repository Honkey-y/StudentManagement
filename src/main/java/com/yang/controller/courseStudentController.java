package com.yang.controller;

import com.yang.dao.CourseStudentMapper;
import com.yang.entity.Student;

import com.yang.entity.cAnds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("courseStudent")
public class courseStudentController {

    @Autowired
    private CourseStudentMapper courseStudentMapper;

    /**
     * 查找某个学生选修的课程
     * @param sid
     * @return
     */
    @RequestMapping("findStudentCourse")
    @ResponseBody
    public Map<String,Object> findStudentCourse(String sid){
        System.out.println("个人学号为："+sid);
        Map<String,Object> map = new HashMap<>();
        try {
            List<Map<String,Object>> studentCourse = courseStudentMapper.findStudentCourse(sid);
            System.out.println("选课情况为：" + studentCourse);

            map.put("status",true);
            map.put("studentCourse",studentCourse);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status",false);
        }
        return map;
    }


    //添加某个学生的选修课程
    @RequestMapping("addStudentCourse")
    @ResponseBody
    public Map<String,Object> addStudentCourse(String sid, Integer cid){
        Map<String,Object> map = new HashMap<>();
        try {
            List<cAnds> cAndsList = courseStudentMapper.findOneStudentCourse(sid);
            System.out.println(cAndsList);
            courseStudentMapper.addStudentCourse(sid,cid);
            map.put("status",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status",false);
        }
        return map;
    }
}
