package com.yang.dao;

import com.yang.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface UserDao {
    //注册
    void register(User user);
    //根据用户名查询个人的所有信息
    User findUsername(String username);
    //查询所有用户（分页）
    List<User> findAll(@Param("start") Integer start,
                       @Param("pageSize") int pageSize);
    //查询总用户数
    Long findTotals();

    //增加
    void save(User user);

    void delete(Integer id);

    User findOne(Integer id);

    void update(User user);

    //分页方法
}
