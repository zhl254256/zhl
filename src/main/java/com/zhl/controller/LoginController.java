package com.zhl.controller;

import com.zhl.MyAllException.UserException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
    @RequestMapping("/login")
    public String toLogin(@RequestParam("username") String username){
        if(!username.equals("admin")){
            System.out.println("登陆失败");
            throw new UserException();
        } else {
            System.out.println("登录成功");
            return "success";
        }
    }
}
