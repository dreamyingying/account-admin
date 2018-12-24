package com.menglei.account.admin.controller;

import com.menglei.account.admin.common.JsonResult;
import com.menglei.account.admin.service.IUserFamilyService;
import com.menglei.account.entity.UserFamily;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
  * @className UserFamilyController
  * @Description TODO
  * @date 2018/12/24 16:37
  * @author Menglei（lei.meng@cmgplex.com)
  * @version 1.0
  **/
@Controller
@RequestMapping("/admin/userFamily")
public class UserFamilyController {
    private static final Logger log = LoggerFactory.getLogger(UserFamilyController.class);

    @Autowired
    private IUserFamilyService userFamilyService;

    @GetMapping(value = "/checkFamily/{userId}")
    public JsonResult<Boolean> checkFamily(@PathVariable(value = "userId")Long userId){
        log.info("**开始执行** UserFamilyController.checkFamily【userId={}】",userId);
        JsonResult<Boolean> jr = new JsonResult<>();
        try {
            UserFamily userFamily = this.userFamilyService.getByUserId(userId);
            if (null == userFamily){
                jr.setData(false);
                jr.setCode("8203");
                jr.setMessage("此用户还未加入家庭");
            }else {
                jr.setMessage("此用户已经拥有家庭");
                jr.setCode("8200");
                jr.setData(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            log.info("**结束** 执行UserFamilyController.checkFamily【userId={}】",userId);
        }
        return jr;
    }
}
