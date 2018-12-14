package com.menglei.account.admin.service.impl;

import com.menglei.account.admin.common.JsonResult;
import com.menglei.account.admin.rpc.api.ApiRpc;
import com.menglei.account.admin.service.IUserService;
import com.menglei.account.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
  * @className UserServiceImpl
  * Description 有关用户的实现类
  * @date 2018/12/14 14:28
  * @author Menglei（lei.meng@cmgplex.com)
  * @version 1.0
  **/
@Service("userService")
public class UserServiceImpl implements IUserService {

    @Autowired
    private ApiRpc apiRpc;

    @Override
    public List<User> getUsers() {
        JsonResult<List<User>> jr = this.apiRpc.getUsers();
        return jr.getData();
    }
}
