package com.menglei.account.admin.controller;

import com.menglei.account.admin.common.JsonResult;
import com.menglei.account.admin.service.IUserService;
import com.menglei.account.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
  * @className LoginController
  * @Description TODO
  * @date 2018/12/19 14:27
  * @author Menglei（lei.meng@cmgplex.com)
  * @version 1.0
  **/
@Controller
public class LoginController {
    private Logger log = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private IUserService userService;

    /**
      * Description 跳转到登陆页面
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 11:23 2018/12/20
      * @param
      * @return
      **/
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String toLogin(){
        return "/account/login";
    }

    /**
      * Description 验证登陆信息
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 11:23 2018/12/20
      * @param
      * @return
      **/
    @PostMapping(value = "/login")
    public String login(@RequestParam(value = "userName") String userName,@RequestParam(value = "password") String password, HttpServletRequest request,ModelMap map){
        log.info("into login");
        try {
            JsonResult<User> jr = this.userService.login(userName, password, request);
            if ("8203".equals(jr.getCode())){
                map.put("message",jr.getMessage());
                return "/account/login";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            log.info("out login");
        }
        return "redirect:/admin/index";
    }

    @RequestMapping(value = "/toRegister")
    public String toRegister(){
        return "/account/register";
    }
}
