package com.jun.Controller;

import com.jun.model.Employee;
import com.jun.model.Interview;
import com.jun.model.Recruit;
import com.jun.model.Resume;
import com.jun.service.EmployeeService;
import com.jun.service.InterViewService;
import com.jun.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class EmployeeController {
    @Autowired
    private InterViewService interViewService;
    @Autowired
    private ResumeService resumeService;
    @Autowired
    private EmployeeService employeeService;
    @RequestMapping("/addEmployee")
    public  String addEmployee(int iv_id, HttpSession session)throws Exception{
        Interview interview1=new Interview();
        interview1.setIv_id(iv_id);
        Interview interview=interViewService.getInterViewByid(interview1);
        int iv_rid= interview.getIv_rid();
        Resume resume1= new Resume();
          resume1.setR_id(iv_rid);
        Resume resume= resumeService.getResumeByid(resume1);
        String re_phone=resume.getR_phone();
        Employee employee1=new Employee();
        employee1.setEm_acount(re_phone);
        if(employee1==null) {
            Date now = new Date();
            interview.setIv_date(now);
            interview.setIv_offerid(1);
            interViewService.updateInterViewofferid(interview);
            Employee employee = new Employee();
            employee.setEm_acount(resume.getR_phone());
            employee.setEm_pass("12345");
            employee.setEm_indate(now);
            employee.setEm_sex(resume.getR_sex());
            employee.setEm_phone(resume.getR_phone());
            employee.setEm_position(interview.getIv_rename());
            employee.setEm_salary(4000);
            employee.setEm_status(0);
            employeeService.addEmployee(employee);
            return "redirect:/showInterviewAll";
        }else {
            session.setAttribute("addemErr","账户已存在");
            return "redirect:/showInterviewAll";
        }
    }


}
