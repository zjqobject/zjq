package com.jun.service;

import com.jun.model.Department;

import java.util.List;

public interface DepartmentService {
    int addDepartment(Department department) ;
    List<Department> getDepartmentAll();
    Department getDepartment(Department department);
    Department getDepartmentByid(Department department);
    int updateDepartment(Department department);
    int deleteDepartment(Department department);
}
