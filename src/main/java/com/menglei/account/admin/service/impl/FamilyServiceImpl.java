package com.menglei.account.admin.service.impl;

import com.menglei.account.admin.rpc.api.ApiRpc;
import com.menglei.account.admin.service.IFamilyService;
import com.menglei.account.entity.Family;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
  * @className FamilyServiceImpl
  * @Description TODO
  * @date 2018/12/24 15:57
  * @author Menglei（lei.meng@cmgplex.com)
  * @version 1.0
  **/
@Service("familyService")
public class FamilyServiceImpl implements IFamilyService {

    @Autowired
    private ApiRpc apiRpc;

    @Override
    public Boolean add(Family family) {
        return this.apiRpc.addFamily(family).getData();
    }

    @Override
    public Boolean update(Family family) {
        return this.apiRpc.updateFamily(family).getData();
    }

    @Override
    public Family getById(Long id) {
        return this.apiRpc.getFamilyById(id).getData();
    }

    @Override
    public List<Family> findAll() {
        return this.apiRpc.findAllFamily().getData();
    }

    @Override
    public Family getByPassword(Long id, String password) {
        return this.apiRpc.getFamilyByPassword(id,password).getData();
    }

    @Override
    public Family getByName(String name) {
        return this.apiRpc.getFamilyByName(name).getData();
    }
}
