package com.menglei.account.admin.rpc.api;

import com.menglei.account.admin.common.JsonResult;
import com.menglei.account.entity.User;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    JsonResult<List<User>> getUsers();
}