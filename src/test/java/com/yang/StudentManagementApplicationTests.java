package com.yang;

import com.yang.service.StudentService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class StudentManagementApplicationTests {

    private StudentService studentService;
    @Autowired
    public StudentManagementApplicationTests(StudentService studentService) {
        this.studentService = studentService;
    }

    //测试是否连接成功数据库
    @Test
    void student(){
        studentService.findAll().forEach(student -> System.out.println(student));
    }
}
