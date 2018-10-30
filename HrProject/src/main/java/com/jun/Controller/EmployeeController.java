package com.jun.Controller;

import com.jun.model.*;
import com.jun.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class EmployeeController {
    @Autowired
    private InterViewService interViewService;
    @Autowired
    private ResumeService resumeService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private PositionService positionService;
    @Autowired
    private RecruitService recruitService;
    @Autowired
    private DepartmentService departmentService;
    @RequestMapping("/addEmployee")
    public  String addEmployee(int iv_id, HttpSession session)throws Exception{
        Interview interview1=new Interview();
        interview1.setIv_id(iv_id);
        Interview interview=interViewService.getInterViewByid(interview1);
        int iv_reid= interview.getIv_reid();
        int iv_rid=interview.getIv_rid();
        Resume resume1= new Resume();
        Recruit recruit=new Recruit();
        recruit.setRe_id(iv_reid);
        resume1.setR_id(iv_rid);
        Resume resume= resumeService.getResumeByid(resume1);
        Recruit recruit1=recruitService.getRecruitByre_id(recruit);
        String re_phone=resume.getR_phone();
        Employee employee=new Employee();
        employee.setEm_acount(re_phone);
        Employee employee1=  employeeService.getEmployee(employee);
        if(employee1==null) {
            Date now = new Date();
            interview.setIv_date(now);
            interview.setIv_offerid(1);
            interViewService.updateInterViewofferid(interview);
            employee.setEm_pass("12345");
            employee.setEm_indate(now);
            employee.setEm_sex(resume.getR_sex());
            employee.setEm_phone(resume.getR_phone());
            employee.setEm_poid(recruit1.getRe_poid());
            employee.setEm_salary(4000);
            employee.setEm_status(0);
            employeeService.addEmployee(employee);
            return "redirect:/showInterviewAll";
        }else {
            session.setAttribute("addemErr","账户已存在");
            return "redirect:/showInterviewAll";
        }
    }
    @RequestMapping("/getEmployeeAll")
    public  String getEmployee(Model model)throws Exception{
        List<Employee> employeeAll=employeeService.getEmployeeAll();
        if(employeeAll!=null) {
            for (int i = 0; i < employeeAll.size(); i++) {
                int po_id = employeeAll.get(i).getEm_poid();
                Position position = new Position();
                position.setPo_id(po_id);
                System.out.println(position.getPo_id());
                Position position1 = positionService.getaddPositionBypoid(position);
                int de_id = position1.getPo_deid();
                Department department = new Department();
                department.setDe_id(de_id);
                Department department1 = departmentService.getDepartmentByid(department);
                employeeAll.get(i).setEm_position(position1.getPo_name());
                employeeAll.get(i).setEm_department(department1.getDe_name());
            }
        }
        model.addAttribute("employeeList",employeeAll);
        return "manager";
    }
    @RequestMapping("/getAll")
    public  String getAll(Model model)throws Exception{
        List<Employee> employeeList=employeeService.getEmployeeAll();
        List<Position> positionList=positionService.getPositionAll();
        List<Department> departmentList=departmentService.getDepartmentAll();
        model.addAttribute("employeeList",employeeList);
        model.addAttribute("positionList",positionList);
        model.addAttribute("departmentList",departmentList);
        return "manager";
    }


}
