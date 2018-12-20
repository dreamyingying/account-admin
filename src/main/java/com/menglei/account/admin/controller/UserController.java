package com.menglei.account.admin.controller;

import com.menglei.account.admin.common.JsonResult;
import com.menglei.account.admin.service.IUserService;
import com.menglei.account.entity.BizData4PageAdmin;
import com.menglei.account.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

/**
  * @className UserController
  * @Description TODO
  * @date 2018/12/18 12:10
  * @author Menglei（lei.meng@cmgplex.com)
  * @version 1.0
  **/
@Controller
@RequestMapping("/admin/user")
public class UserController {
    private Logger log = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/index")
    public String toUserIndex(){
        return "/account/user/userIndex";
    }

    @RequestMapping(value = "/toAdd")
    public String toUserAdd(){
        return "/account/user/userAdd";
    }

    @RequestMapping(value = "/toUpdate/{id}")
    public String toUserUpdate(@PathVariable(value = "id") Long id, ModelMap map){
        map.put("user",this.userService.getUserById(id));
        return "/account/user/userUpdate";
    }

    @GetMapping(value = "/userList")
    @ResponseBody
    public BizData4PageAdmin<User> getUserList(Integer pageNumber,Integer pageSize){
        return this.userService.getUserList(pageNumber, pageSize);
    }

    @PostMapping(value = "/update")
    @ResponseBody
    public JsonResult<Boolean> updateUser(User user){
        JsonResult<Boolean> jr = new JsonResult<>();
        try {
            Boolean b = this.userService.updateUser(user);
            if (null ==b){
                jr.setMessage("操作失败");
                return jr;
            }
            jr.setData(b);
            if (b){
                jr.setCode("8200");
                jr.setMessage("操作成功");
            }else {
                jr.setCode("8299");
                jr.setMessage("操作失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jr;
    }

    @PostMapping(value = "/del/{id}")
    @ResponseBody
    public JsonResult<Boolean> updateUser(@PathVariable(value = "id")Long id){
        JsonResult<Boolean> jr = new JsonResult<>();
        User user = new User();
        user.setId(id);
        try {
            Boolean b = this.userService.delUser(user);
            if (null ==b){
                jr.setMessage("删除失败");
                return jr;
            }
            jr.setData(b);
            if (b){
                jr.setCode("8200");
                jr.setMessage("删除成功");
            }else {
                jr.setCode("8299");
                jr.setMessage("删除失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jr;
    }

    @PostMapping(value = "/add")
    @ResponseBody
    public JsonResult<Boolean> addUser(User user){
        JsonResult<Boolean> jr = new JsonResult<>();
        try {
            Boolean b = this.userService.addUser(user);
            if (null ==b){
                jr.setMessage("操作失败");
                return jr;
            }
            jr.setData(b);
            if (b){
                jr.setCode("8200");
                jr.setMessage("操作成功");
            }else {
                jr.setCode("8299");
                jr.setMessage("操作失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jr;
    }
}
