package com.ssm.service;

import com.ssm.domain.Emp;

/**
 * Created by Administrator on 2016/12/20.
 */
public interface EmpService {
    Emp login(String name, String pass);
}
