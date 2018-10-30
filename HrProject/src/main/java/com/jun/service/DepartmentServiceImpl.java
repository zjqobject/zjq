package com.jun.service;

import com.jun.dao.DepartmentDao;
import com.jun.model.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentDao departmentDao;
    public int addDepartment(Department department) {
        return departmentDao.addDepartment(department);
    }

    public List<Department> getDepartmentAll() {
        return departmentDao.getDepartmentAll();
    }

    public Department getDepartment(Department department) {
        return departmentDao.getDepartment(department);
    }

    public Department getDepartmentByid(Department department) {
        return departmentDao.getDepartmentByid(department);
    }

    public int updateDepartment(Department department) {
        return departmentDao.updateDepartment(department);
    }

    public int deleteDepartment(Department department) {
        return departmentDao.deleteDepartment(department);
    }

}
