package com.yang.service;

import com.yang.dao.UserDao;
import com.yang.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;
import org.springframework.util.ObjectUtils;

import java.nio.charset.StandardCharsets;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    private UserDao userDao;

    @Autowired
    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public void register(User user) {
        //查询注册用户是否用户名重复
        User userDB = userDao.findUsername(user.getUsername());
        if (!ObjectUtils.isEmpty(userDB)) throw new RuntimeException("用户已存在！");
        //密码加密
        String passwordDigest = DigestUtils.md5DigestAsHex(user.getPassword().getBytes(StandardCharsets.UTF_8));
        user.setPassword(passwordDigest);
        userDao.register(user);
    }

    @Override
    public User login(String username, String password) {
        //拿到管理员信息
        User user = userDao.findUsername(username);
        //isEmpty判断是否为空
        if (ObjectUtils.isEmpty(user)) throw new RuntimeException("用户名错误,请重新输入!");
        //md5加密方法
        String newPassword = DigestUtils.md5DigestAsHex(password.getBytes(StandardCharsets.UTF_8));
        //equalsIgnoreCase比较字符串，不分大小写
        if (!newPassword.equalsIgnoreCase(user.getPassword())) throw new RuntimeException("密码错误，请重新输入！");
        return user;
    }

    @Override
    public Long findTotals(){
        return userDao.findTotals();
    }

    @Override
    public List<User> findAll(Integer pageNum, Integer pageSize) {
        //定义展示多少数据
        pageSize=7;
        //1页是从0开始的数据,2页是从7开始的数据
        Integer start = (pageNum - 1) * pageSize;
        System.out.println("从"+start+"条开始查询");
        //findAll(页码，7);
        List<User> users = userDao.findAll(start,pageSize);
        return users;
    }

    @Override
    public void delete(Integer id) {
        userDao.delete(id);
    }

    @Override
    public void update(User user) {
        //如果密码没有更改则正常修改，若是密码更改则加密后再更新
        User oldUser = userDao.findOne(user.getUid());
        System.out.println("旧的密码：" + oldUser.getPassword());
        System.out.println("新的密码：" + user.getPassword());
        if (user.getPassword().equals(oldUser.getPassword())){
            userDao.update(user);
        }else {
            System.out.println("修改为新的密码");
            String passwordDigest = DigestUtils.md5DigestAsHex(user.getPassword().getBytes(StandardCharsets.UTF_8));
            user.setPassword(passwordDigest);
            userDao.update(user);
        }

    }

    @Override
    public User findOne(Integer id) {
        return userDao.findOne(id);
    }

}
