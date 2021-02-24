package com.zhl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
    @RequestMapping("/hello")
    public String handle01(Integer i){
        System.out.println(10/i);
        return "success";
    }
}
