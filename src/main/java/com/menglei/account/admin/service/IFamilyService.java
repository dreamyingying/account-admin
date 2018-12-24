package com.menglei.account.admin.service;

import com.menglei.account.entity.Family;

/**
  * @className IFamilyService
  * @Description TODO
  * @author Menglei（lei.meng@cmgplex.com)
  * @date 2018/12/24 15:50
  * @version 1.0
  **/
public interface IFamilyService {

    Boolean add(Family family);

    Boolean update(Family family);

    Family getById(Long id);
}