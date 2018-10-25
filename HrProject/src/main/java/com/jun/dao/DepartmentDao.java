package com.jun.dao;

import com.jun.model.Department;

import java.util.List;

public interface DepartmentDao {
    int addDepartment(Department department) ;
    List<Department> getDepartmentAll();
    Department getDepartment(Department department);
}
