package com.menglei.account.admin.rpc.api;

import com.menglei.account.admin.common.JsonResult;
import com.menglei.account.entity.BizData4PageAdmin;
import com.menglei.account.entity.User;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
  * @className BaseRpc
  * Description baseapi的远程调用
  * @author Menglei（lei.meng@cmgplex.com)
  * @date 2018/12/14 13:40
  * @version 1.0
  **/
@FeignClient(name = "api",url = "http://192.168.1.54:8889/",fallback = ApiRpcFallback.class)
@RequestMapping("/api")
public interface ApiRpc {

    @GetMapping(value = "/user/list")
    JsonResult<BizData4PageAdmin<User>> getUserList(@RequestParam(value = "pageNumber",required = false)Integer pageNumber,
                                                 @RequestParam(value = "pageSize",required = false)Integer pageSize);

    /**
      * Description 主键获取用户信息
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 11:01 2018/12/20
      * @param
      * @return
      **/
    @GetMapping(value = "/user/byId/{id}")
    JsonResult<User> getUserById(@PathVariable(value = "id")Long id);

    /**
      * Description 用户注册
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 11:02 2018/12/20
      * @param
      * @return
      **/
    @RequestMapping(value = "/user/add",method = RequestMethod.POST)
    JsonResult<Boolean> addUser(@RequestBody User user);

    /**
      * Description 修改用户信息
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 11:02 2018/12/20
      * @param
      * @return
      **/
    @RequestMapping(value = "/user/update",method = RequestMethod.POST)
    JsonResult<Boolean> updateUser(@RequestBody User user);

    /**
      * Description 删除用户
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 11:02 2018/12/20
      * @param
      * @return
      **/
    @RequestMapping(value = "/user/del",method = RequestMethod.POST)
    JsonResult<Boolean> delUser(@RequestBody User user);

    /**
      * Description 用户登陆
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 11:02 2018/12/20
      * @param
      * @return
      **/
    @GetMapping(value = "/user/login/{userName}/{password}")
    JsonResult<User> login(@PathVariable(value = "userName")String userName,
                           @PathVariable(value = "password")String password);

    /**
      * Description 单条件获取所有用户
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 11:03 2018/12/20
      * @param
      * @return
      **/
    @GetMapping(value = "/user/byProperty/{property}/{value}")
    JsonResult<List<User>> getUserListByProperty(@PathVariable(value = "property")String property,
                                                 @PathVariable(value = "value")Object value);
}