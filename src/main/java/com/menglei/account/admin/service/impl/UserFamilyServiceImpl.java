package com.menglei.account.admin.service.impl;

import com.menglei.account.admin.rpc.api.ApiRpc;
import com.menglei.account.admin.service.IUserFamilyService;
import com.menglei.account.entity.UserFamily;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
  * @className UserFamilyServiceImpl
  * @Description TODO
  * @date 2018/12/24 15:54
  * @author Menglei（lei.meng@cmgplex.com)
  * @version 1.0
  **/
@Service("userFamilyService")
public class UserFamilyServiceImpl implements IUserFamilyService {

    @Autowired
    private ApiRpc apiRpc;

    @Override
    public Boolean add(UserFamily userFamily) {
        return this.apiRpc.addUserFamily(userFamily).getData();
    }

    @Override
    public UserFamily getByUserId(Long userId) {
        return this.apiRpc.getUserFamilyByUserId(userId).getData();
    }

    @Override
    public List<UserFamily> getByFamilyId(Long familyId) {
        return this.apiRpc.getUserFamilyByFamilyId(familyId).getData();
    }
}
