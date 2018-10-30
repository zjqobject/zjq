package com.jun.service;

import com.jun.model.Employee;

import java.util.List;

public interface EmployeeService {
    int addEmployee(Employee employee);
    Employee getEmployee(Employee employee);
    List<Employee> getEmployeeAll();
}
