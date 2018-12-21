package com.menglei.account.admin.service.impl;

import com.menglei.account.admin.common.JsonResult;
import com.menglei.account.admin.common.Md5Utils;
import com.menglei.account.admin.common.SMSUtils;
import com.menglei.account.admin.rpc.api.ApiRpc;
import com.menglei.account.admin.service.IUserService;
import com.menglei.account.entity.BizData4PageAdmin;
import com.menglei.account.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.concurrent.TimeUnit;

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

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    @Override
    public BizData4PageAdmin<User> getUserList(Integer pageNumber,Integer pageSize) {
        JsonResult<BizData4PageAdmin<User>> jr = this.apiRpc.getUserList(pageNumber,pageSize);
        return jr.getData();
    }

    @Override
    public User getUserById(Long id) {
        return this.apiRpc.getUserById(id).getData();
    }

    @Override
    public Boolean addUser(User user) {
        return this.apiRpc.addUser(user).getData();
    }

    @Override
    public Boolean updateUser(User user) {
        return this.apiRpc.updateUser(user).getData();
    }

    @Override
    public Boolean delUser(User user) {
        return this.apiRpc.delUser(user).getData();
    }

    @Override
    public JsonResult<User> login(String userName, String password, HttpServletRequest request) {
        JsonResult<User> jr = this.apiRpc.login(userName, Md5Utils.md5(password));
        User user = jr.getData();
        if ("8203".equals(jr.getCode()) || null == user){
            jr.setCode("8203");
            jr.setMessage("账号或密码错误！");
        }else {
            request.getSession().setAttribute("user",user);
            jr.setData(null);
        }
        return jr;
    }

    @Override
    public List<User> getUserListByProperty(String property, Object value) {
        return this.apiRpc.getUserListByProperty(property,value).getData();
    }

    @Override
    public void sendMessage(String tel) {
        int code = (int) ((Math.random() * 9 + 1) * 100000);
        String coodeStr = Integer.toString(code);
        ValueOperations<String,String> ops = redisTemplate.opsForValue();
        String str = tel+"_REGISTER_CODE";
        ops.set(str,coodeStr);
        this.redisTemplate.expire(str,600,TimeUnit.SECONDS);
        SMSUtils.sendMessage(tel,coodeStr);
    }
}
