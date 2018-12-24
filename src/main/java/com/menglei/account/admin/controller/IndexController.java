package com.menglei.account.admin.controller;

import com.menglei.account.admin.common.SMSUtils;
import com.menglei.account.admin.service.IUserFamilyService;
import com.menglei.account.admin.service.IUserService;
import com.menglei.account.entity.User;
import com.menglei.account.entity.UserFamily;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
  * @className IndexController
  * @Description TODO
  * @date 2018/12/4 16:05
  * @author Menglei（lei.meng@cmgplex.com)
  * @version 1.0
  **/
@Controller
public class IndexController {
    private Logger log = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private IUserFamilyService userFamilyService;


    /**
      * Description 首页
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 16:07 2018/12/4
      **/
    @RequestMapping(value = "/")
    public String defaultPage(){
        return "redirect:/login";
    }

    @RequestMapping(value = "/admin/index")
    public String index(HttpServletRequest request, ModelMap map){
        User user = (User) request.getSession().getAttribute("user");
        map.put("user",user);
        UserFamily userFamily = this.userFamilyService.getByUserId(user.getId());
        if(null == userFamily){
        map.put("noFamily",true);
        }else {
            map.put("noFamily",false);
        }
        return "/account/index";
    }

    @RequestMapping(value = "/welcome")
    public String welcome(){
        log.info("进入welcome！");
        return "/account/welcome";
    }
}
