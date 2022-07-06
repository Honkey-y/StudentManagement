package com.yang.service;

import com.yang.entity.User;

import java.util.List;

public interface UserService {
    void register(User user);

    User login(String username, String password);

    List<User> findAll(Integer pageNum, Integer pageSize);

    //查询总用户数
    Long findTotals();

    void delete(Integer id);

    void update(User user);

    User findOne(Integer id);
}
