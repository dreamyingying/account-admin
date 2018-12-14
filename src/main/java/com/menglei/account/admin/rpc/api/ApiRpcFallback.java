package com.menglei.account.admin.rpc.api;

import com.menglei.account.admin.common.JsonResult;
import com.menglei.account.admin.common.enums.RetCodeEnum;
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
    public JsonResult<List<User>> getUsers() {
        JsonResult<List<User>> ret = new JsonResult<>(RetCodeEnum.BADGATEWAY);
        log.error("execute rpc(apiRpc.getUsers) failed ,args:【】。ret=", ret);
        return ret;
    }
}
