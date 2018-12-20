package com.menglei.account.admin.rpc.api;

import com.menglei.account.admin.common.JsonResult;
import com.menglei.account.admin.common.enums.RetCodeEnum;
import com.menglei.account.entity.BizData4PageAdmin;
import com.menglei.account.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.List;

/**
  * @className ApiRpcFallback
  * Description apiRpc接口回调地址
  * @date 2018/12/14 13:46
  * @author Menglei（lei.meng@cmgplex.com)
  * @version 1.0
  **/
@Component
public class ApiRpcFallback implements ApiRpc{

    private static final Logger log = LoggerFactory.getLogger(ApiRpcFallback.class);

    @Override
    public JsonResult<BizData4PageAdmin<User>> getUserList(Integer pageNumber,Integer pageSize) {
        JsonResult<BizData4PageAdmin<User>> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.getUserList) failed ,args:【】。ret=", ret);
        return ret;
    }

    @Override
    public JsonResult<User> getUserById(Long id) {
        JsonResult<User> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.getUserById) failed ,args:【id={}】。ret=", id,ret);
        return ret;
    }

    @Override
    public JsonResult<Boolean> addUser(User user) {
        JsonResult<Boolean> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.addUser) failed ,args:【user={}】。ret=", user,ret);
        return ret;
    }

    @Override
    public JsonResult<Boolean> updateUser(User user) {
        JsonResult<Boolean> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.updateUser) failed ,args:【user={}】。ret=", user,ret);
        return ret;
    }

    @Override
    public JsonResult<Boolean> delUser(User user) {
        JsonResult<Boolean> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.delUser) failed ,args:【user={}】。ret=", user,ret);
        return ret;
    }

    @Override
    public JsonResult<User> login(String userName, String password) {
        JsonResult<User> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.login) failed ,args:【userName={},password={}】。ret=", userName,password,ret);
        return ret;
    }

    @Override
    public JsonResult<List<User>> getUserListByProperty(String property, Object value) {
        JsonResult<List<User>> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.getUserListByProperty) failed ,args:【property={},value={}】。ret=", property,value,ret);
        return ret;
    }
}
