package com.yang.dao;

import com.yang.entity.Course;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface CourseMapper {

    @Select("select * from course")
    List<Course> findAll();

    @Insert("insert into course(cname,choose,credits) values(#{cname},#{choose},#{credits})")
    void save(Course student);

    @Delete("delete from course where cid = #{cid}")
    void delete(String id);

    @Select("select * from course where cid = #{id}")
    Course findOne(Integer id);

    @Update("update course set cname = #{cname},choose = #{choose},credits = #{credits} where cid=#{cid}")
    void update(Course course);
}
