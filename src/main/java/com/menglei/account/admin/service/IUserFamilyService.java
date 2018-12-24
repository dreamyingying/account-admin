package com.menglei.account.admin.service;

import com.menglei.account.entity.UserFamily;

import java.util.List;

/**
  * @className IUserFamilyService
  * @Description TODO
  * @author Menglei（lei.meng@cmgplex.com)
  * @date 2018/12/24 15:53
  * @version 1.0
  **/
public interface IUserFamilyService {

    Boolean add(UserFamily userFamily);

    UserFamily getByUserId(Long userId);

    List<UserFamily> getByFamilyId(Long familyId);
}