package com.yang.dao;

import com.yang.entity.Student;
import org.apache.ibatis.annotations.Delete;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface StudentDAO {

    List<Student> findAll();

    void save(Student student);

    void delete(String id);

    Student findOne(String id);

    void update(Student student);
}
