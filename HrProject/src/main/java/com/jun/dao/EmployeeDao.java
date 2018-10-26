package com.jun.dao;

import com.jun.model.Employee;

public interface EmployeeDao {
    int addEmployee(Employee employee);
    Employee getEmployee(Employee employee);
}
