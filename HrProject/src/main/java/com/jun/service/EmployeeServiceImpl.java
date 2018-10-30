package com.jun.service;

import com.jun.dao.EmployeeDao;
import com.jun.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
  @Autowired
  private EmployeeDao employeeDao;
    public int addEmployee(Employee employee) {
        return employeeDao.addEmployee(employee) ;
    }

    public Employee getEmployee(Employee employee) {
        return employeeDao.getEmployee(employee);
    }

    public List<Employee> getEmployeeAll() {
        return employeeDao.getEmployeeAll();
    }
}
