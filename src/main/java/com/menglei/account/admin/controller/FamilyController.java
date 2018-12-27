package com.menglei.account.admin.controller;

import com.google.gson.JsonElement;
import com.menglei.account.admin.common.JsonResult;
import com.menglei.account.admin.service.IFamilyService;
import com.menglei.account.entity.Family;
import com.menglei.account.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

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

    @GetMapping(value = "/toCreateMyFamily")
    public String toCreateMyFamily(){
        return "/account/family/add";
    }

    @PostMapping(value = "/add")
    @ResponseBody
    public JsonResult<Boolean> add(Family family, HttpServletRequest request){
        log.info("**开始执行** FamilyController.add【family={}】",family);
        User user = (User)request.getSession().getAttribute("user");
        family.setUserId(user.getId());
        family.setCreator(user.getUserName());
        family.setUpdater(user.getUserName());
        JsonResult<Boolean> jr = new JsonResult<>();
        try {
            Boolean b = this.familyService.add(family);
            jr.setData(b);
            if (b){
                jr.setMessage("创建成功");
                jr.setCode("8200");
            }else {
                jr.setCode("8299");
                jr.setMessage("创建失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            log.info("**结束执行** FamilyController.add【family={}】",family);
        }
        return jr;
    }

    @GetMapping(value = "/toJoinMyFamily")
    public String toJoinMyFamily(ModelMap map){
        map.put("familyList",this.familyService.findAll());
        return "/account/family/joinMyFamily";
    }

    @GetMapping(value = "/checkFamily/{id}/{password}")
    @ResponseBody
    public JsonResult<Boolean> checkFamily(@PathVariable(value = "id")Long id,@PathVariable(value = "password")String password){
        log.info("**开始执行** FamilyController.checkFamily【id={}】",id);
        JsonResult<Boolean> jr = new JsonResult<>();
        try {
            Family family = this.familyService.getByPassword(id, password);
            if (null == family){
                jr.setData(false);
                jr.setMessage("密码错误");
                jr.setCode("8203");
            }else {
                jr.setCode("8200");
                jr.setMessage("密码正确");
                jr.setData(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            log.info("**开始执行** FamilyController.checkFamily【id={}】",id);
        }
        return jr;
    }

    @GetMapping(value = "/checkName/{name}")
    @ResponseBody
    public JsonResult<Boolean> getFamilyByName(@PathVariable(value = "name")String name){
        log.info("**开始执行** FamilyController.getFamilyByName【name={}】",name);
        JsonResult<Boolean> jr = new JsonResult<>();
        try {
            Family family = this.familyService.getByName(name);
            if (null == family){
                jr.setData(true);
                jr.setMessage("名称可用");
                jr.setCode("8200");
            }else {
                jr.setCode("8203");
                jr.setMessage("名称已存在");
                jr.setData(false);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            log.info("**结束执行** FamilyController.getFamilyByName【name={}】",name);
        }
        return jr;
    }
}
