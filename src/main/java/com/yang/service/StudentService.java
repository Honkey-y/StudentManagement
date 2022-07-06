package com.yang.service;

import com.yang.entity.Student;

import java.util.List;

public interface StudentService {

    List<Student> findAll();

    void save(Student student);

    void delete(String id);

    Student findOne(String id);

    void update(Student student);
}
