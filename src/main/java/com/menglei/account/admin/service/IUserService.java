package com.menglei.account.admin.service;

import com.menglei.account.entity.User;

import java.util.List;

/**
  * @className IUserService
  * Description IUserService
  * @author Menglei（lei.meng@cmgplex.com)
  * @date 2018/12/14 14:27
  * @version 1.0
  **/
public interface IUserService {

    /**
      * Description 【测试】获取所有用户信息
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 14:27 2018/12/14
      * @param
      * @return
      **/
    List<User> getUsers();
}