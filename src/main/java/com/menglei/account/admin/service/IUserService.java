package com.menglei.account.admin.service;

import com.menglei.account.admin.common.JsonResult;
import com.menglei.account.entity.BizData4PageAdmin;
import com.menglei.account.entity.User;

import javax.servlet.http.HttpServletRequest;
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
      * Description 获取所有用户信息
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 14:27 2018/12/14
      * @param
      * @return BizData4PageAdmin
      **/
    BizData4PageAdmin<User> getUserList(Integer pageNumber, Integer pageSize);

    /**
      * Description 通过id获取用户信息
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 15:13 2018/12/18
      * @param
      * @return user
      **/
    User getUserById(Long id);

    /**
      * Description 添加用户
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 15:14 2018/12/18
      * @param
      * @return boolean
      **/
    Boolean addUser(User user);

    /**
      * Description 修改用户信息
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 15:15 2018/12/18
      * @param
      * @return boolean
      **/
    Boolean updateUser(User user);

    /**
      * Description 删除用户
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 15:15 2018/12/18
      * @param
      * @return boolean
      **/
    Boolean delUser(User user);

    /**
      * Description 用户登陆
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 11:09 2018/12/20
      * @param
      * @return
      **/
    JsonResult<User> login(String userName, String password, HttpServletRequest request);

    /**
      * Description 单条件获取所有用户
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 11:10 2018/12/20
      * @param
      * @return
      **/
    List<User> getUserListByProperty(String property, Object value);


    /**
      * Description 发送短信验证码
      * @author Menglei（lei.meng@cmgplex.com)
      * @date 17:33 2018/12/21
      * @param
      * @return
      **/
    void sendMessage(String tel);
}