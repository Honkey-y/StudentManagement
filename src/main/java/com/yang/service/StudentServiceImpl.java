package com.yang.service;

import com.yang.dao.StudentDAO;
import com.yang.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {

    private StudentDAO studentDAO;
    @Autowired
    public StudentServiceImpl(StudentDAO studentDAO) {
        this.studentDAO = studentDAO;
    }

    @Override
    public List<Student> findAll() {
        return studentDAO.findAll();
    }

    @Override
    public void save(Student student) {
        //生成主键
        student.setSid(UUID.randomUUID().toString());
        System.out.println(student.getSid());
        //添加默认密码
        student.setStupassword("123456");
        studentDAO.save(student);
    }

    @Override
    public void delete(String id) {
        studentDAO.delete(id);
    }

    @Override
    public Student findOne(String id) {
        return studentDAO.findOne(id);
    }

    @Override
    public void update(Student student) {
        studentDAO.update(student);
    }
}
