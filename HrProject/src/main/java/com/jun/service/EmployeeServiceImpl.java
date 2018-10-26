package com.jun.service;

import com.jun.dao.EmployeeDao;
import com.jun.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployeeService {
  @Autowired
  private EmployeeDao employeeDao;
    public int addEmployee(Employee employee) {
        return employeeDao.addEmployee(employee) ;
    }
}
