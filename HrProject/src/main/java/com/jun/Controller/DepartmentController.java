package com.jun.Controller;

import com.jun.model.Department;
import com.jun.model.Employee;
import com.jun.model.Position;
import com.jun.service.DepartmentService;
import com.jun.service.EmployeeService;
import com.jun.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private PositionService positionService;
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/addDepartment")
    public String addDepartment(Model model, Department department){
        department.setDe_createdate(new Date());
        Department department1=departmentService.getDepartment(department);
        departmentService.addDepartment(department);
        List<Department> departmentList=departmentService.getDepartmentAll();
        model.addAttribute("departmentList",departmentList);
        model.addAttribute("addDesuccess","添加成功");
        return  "../../addDepartAndPosition";

    }
    @RequestMapping("/showDepartMent")
    public String showDepartment(Model model){
        List<Department> departmentList=departmentService.getDepartmentAll();
        model.addAttribute("departmentList",departmentList);
        return "../../addDepartAndPosition";

    }
    @RequestMapping("/getdepartmentAll")
    public String getdepartmentAll(Model model){
        List<Department> departmentList=departmentService.getDepartmentAll();
        model.addAttribute("departmentList",departmentList);
        return "manager";

    }

    @RequestMapping("/getDepartmentByid")
    public String getDepartmentByid(Model model,int de_id){
        Department department1=new Department();
        department1.setDe_id(de_id);
        Department department= departmentService.getDepartmentByid(department1);
        model.addAttribute("department",department);
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
    @RequestMapping("/updateDepartment")
    public String  updateDepartment(Department department,HttpSession session)throws Exception{
        int a= departmentService.updateDepartment(department);
        session.setAttribute("updateDepartMsg","更新成功");
        return "redirect:/getdepartmentAll";
    }
    @RequestMapping("/deleteDepartment")
    public String  deleteDepartment(Department department,HttpSession session)throws Exception{
        Position position=new Position();
        position.setPo_deid(department.getDe_id());
       List<Position> positionList=positionService.getPositionBypo_deid(position);
       List<Employee> employeeList=employeeService.getEmployeeAll();
       if(positionList==null ){
           departmentService.deleteDepartment(department);
           session.setAttribute("deleteDepartMsg","删除成功");
       }
        if(employeeList==null ){
            positionService.deletePosition(position);
            departmentService.deleteDepartment(department);
            session.setAttribute("deleteDepartMsg","删除成功");
        }
        else {
            boolean flag=true;
            for (int i = 0; i < positionList.size(); i++) {
                for (int j = 0; j < employeeList.size(); j++) {
                    if (employeeList.get(j).getEm_poid() == positionList.get(i).getPo_deid()) {
                        flag = false;
                        break;
                    }

                }

            }
            if(flag=true){
                positionService.deletePosition(position);
                departmentService.deleteDepartment(department);
                session.setAttribute("deleteDepartMsg","删除成功");
            }
            else {
                session.setAttribute("deleteDepartMsg","存在员工无法删除");
            }
        }
        return "redirect:/getEmployeeAll";

    }
}
