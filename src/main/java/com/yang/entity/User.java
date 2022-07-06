package com.yang.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString           //tostring方法
@NoArgsConstructor  //无参构造
@Data               //set get方法
@AllArgsConstructor //有参构造
public class User {
    private Integer uid;
    private String  username;
    private String  password;
    private String  realname;
    //职位
    private String  posts;
}
