package com.menglei.account.admin.controller;

import com.menglei.account.admin.service.IFamilyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
  * @className FamilyController
  * @Description TODO
  * @date 2018/12/24 16:48
  * @author Menglei（lei.meng@cmgplex.com)
  * @version 1.0
  **/
@Controller
@RequestMapping("/admin/family")
public class FamilyController {
    private static final Logger log = LoggerFactory.getLogger(FamilyController.class);

    @Autowired
    private IFamilyService familyService;

    @GetMapping(value = "/toJoinFamily")
    public String toJoinFamily(){
       return "/account/family/joinFamily";
    }
}
