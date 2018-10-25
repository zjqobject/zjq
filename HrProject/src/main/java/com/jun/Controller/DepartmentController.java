package com.jun.Controller;

import com.jun.model.Department;
import com.jun.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/addDepartment")
    public String addDepartment(HttpSession session, Department department){
        departmentService.addDepartment(department);
        session.setAttribute("addDesuccess","添加成功");
        return  "redirect:/showDepartMent";

    }
    @RequestMapping("/showDepartMent")
    public String showDepartment(Model model){
        List<Department> departmentList=departmentService.getDepartmentAll();
        model.addAttribute("departmentList",departmentList);
        return "manager";

    }
    @RequestMapping("/getDepartment")
    public void getDepartment(Department department,HttpServletResponse response)throws Exception{
       Department department1= departmentService.getDepartment(department);

        PrintWriter writer=response.getWriter();
        if (null==department1||department1.getDe_name()==""){
            System.out.println("1");
            writer.print("true");
        }
        else {
            System.out.println("2");
            writer.print("false");
        }
    }
}
