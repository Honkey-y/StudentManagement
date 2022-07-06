package com.yang.dao;

import com.yang.entity.Student;

import com.yang.entity.cAnds;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface CourseStudentMapper {
    @Select("SELECT student.sname,course.cname,course.choose,course.credits,grades.grades FROM student,course,grades \n" +
            "WHERE student.`sid` = #{sid} AND student.`sid` = grades.`sid` AND course.`cid` = grades.`cid`")
    List<Map<String,Object>> findStudentCourse(String sid);

    @Insert("insert into grades(sid,cid) values(#{sid},#{cid})")
    void addStudentCourse(String sid, Integer cid);

    @Select("select cid from grades where sid = #{sid}")
    List<cAnds> findOneStudentCourse(String sid);
}
