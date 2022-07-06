package com.yang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("scourse")
public class GradesController {

    @RequestMapping("findScourse")
    public Map<String,Object> findScourse(){
        Map<String,Object> map = new HashMap<>();
        return map;
    }

}
