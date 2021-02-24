package com.zhl.MyAllException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * 集中处理所有异常
 *
 * 1. 加入到ioc容器中
 *      @ControllerAdvice:专门处理异常的类
 */
@ControllerAdvice
public class AllException {
    @ExceptionHandler(value = Exception.class)
    public ModelAndView helloException(Exception exception){
        System.out.println("helloException"+exception);
        ModelAndView view = new ModelAndView("error");
        view.addObject("ex",exception);
        return view;
    }
}
