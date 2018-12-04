package com.menglei.account.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

    /**
      * Description 首页
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 16:07 2018/12/4
      **/
    @RequestMapping(value = "/")
    public String index(){
        log.info("进入首页！");
        return "index";
    }
}