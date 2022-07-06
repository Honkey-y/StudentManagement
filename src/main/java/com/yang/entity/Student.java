package com.yang.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data               //get set方法
@NoArgsConstructor  //无参构造
@ToString           //tostring方法
@AllArgsConstructor //有参构造
public class Student {
    private String sid;
    private String stunum;
    private String stupassword;
    private String sname;
    private Boolean gender;
    @JsonFormat(pattern = "yyyy/MM/dd")
    private Date birthday;
    private String scourse;
}
