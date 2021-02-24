package com.zhl.MyAllException;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(reason = "用户登录被拒绝",value = HttpStatus.NOT_FOUND)
public class UserException extends RuntimeException{

}
