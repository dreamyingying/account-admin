package com.menglei.account.admin.rpc.api;

import com.menglei.account.admin.common.JsonResult;
import com.menglei.account.admin.common.enums.RetCodeEnum;
import com.menglei.account.entity.BizData4PageAdmin;
import com.menglei.account.entity.Family;
import com.menglei.account.entity.User;
import com.menglei.account.entity.UserFamily;
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

    @Override
    public JsonResult<Boolean> addUserFamily(UserFamily userFamily) {
        JsonResult<Boolean> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.addUserFamily) failed ,args:【userFamily={}】。ret=", userFamily,ret);
        return ret;
    }

    @Override
    public JsonResult<UserFamily> getUserFamilyByUserId(Long userId) {
        JsonResult<UserFamily> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.getUserFamilyByUserId) failed ,args:【userId={}】。ret=", userId,ret);
        return ret;
    }

    @Override
    public JsonResult<List<UserFamily>> getUserFamilyByFamilyId(Long familyId) {
        JsonResult<List<UserFamily>> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.getUserFamilyByFamilyId) failed ,args:【familyId={}】。ret=", familyId,ret);
        return ret;
    }

    @Override
    public JsonResult<Boolean> addFamily(Family family) {
        JsonResult<Boolean> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.addFamily) failed ,args:【family={}】。ret=", family,ret);
        return ret;
    }

    @Override
    public JsonResult<Boolean> updateFamily(Family family) {
        JsonResult<Boolean> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.updateFamily) failed ,args:【family={}】。ret=", family,ret);
        return ret;
    }

    @Override
    public JsonResult<Family> getFamilyById(Long id) {
        JsonResult<Family> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.getFamilyById) failed ,args:【id={}】。ret=", id,ret);
        return ret;
    }

    @Override
    public JsonResult<List<Family>> findAllFamily() {
        JsonResult<List<Family>> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.findAllFamily) failed 。ret=", ret);
        return ret;
    }

    @Override
    public JsonResult<Family> getFamilyByPassword(Long id, String password) {
        JsonResult<Family> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.getFamilyByPassword) failed ,args:【id={},password={}】。ret=", id,password,ret);
        return ret;
    }

    @Override
    public JsonResult<Family> getFamilyByName(String name) {
        JsonResult<Family> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.getFamilyByName) failed ,args:【name={}】。ret=", name,ret);
        return ret;
    }
}
