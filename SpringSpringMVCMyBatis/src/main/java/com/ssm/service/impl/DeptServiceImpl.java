package com.ssm.service.impl;

import com.ssm.domain.Dept;
import com.ssm.dao.DeptDao;
import com.ssm.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2016/12/21.
 */
@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptDao deptDao;

    @Override
    public List<Dept> findDeptsByCondition(Dept dept) {
        return deptDao.selectByCondition(dept);
    }

    @Override
    public Dept findDeptById(int id) {
        return null;
    }

    @Override
    public boolean exit() {
        return false;
    }

    //测试Spring对MyBatis注解声明式事务的支持（OK）
    @Transactional
    @Override
    public boolean add(Dept dept) {
        Dept dept1 = new Dept();
        dept1.setDeptno(1);
        dept1.setDname("11");
        dept1.setLoc("11");
        deptDao.insert(dept1);

//        System.out.println(3/0);

        Dept dept2 = new Dept();
        dept2.setDeptno(2);
        dept2.setDname("22");
        dept2.setLoc("22");
        deptDao.insert(dept2);

        return false;
    }

    @Override
    public boolean update(int id, Dept dept) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }
}
