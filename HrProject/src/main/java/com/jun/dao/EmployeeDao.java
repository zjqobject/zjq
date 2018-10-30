package com.jun.dao;

import com.jun.model.Employee;

import java.util.List;

public interface EmployeeDao {
    int addEmployee(Employee employee);
    Employee getEmployee(Employee employee);
    List<Employee> getEmployeeAll();
}
