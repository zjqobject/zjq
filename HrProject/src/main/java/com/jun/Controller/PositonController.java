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

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class PositonController {
    @Autowired
    private PositionService positionService;
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private EmployeeService employeeService;
    @RequestMapping("/addPosition")
    public String addPosition(Position position, Model model ){
        positionService.addPosition(position);
        List<Department> departmentList=departmentService.getDepartmentAll();
        model.addAttribute("departmentList",departmentList);
        model.addAttribute("addPoMSg","添加成功");
        return  "../../addDepartAndPosition";
    }
    @RequestMapping("/getPositionByname")
    public void getPositionByname(Position position, HttpServletResponse response) throws IOException {
        Position position1 = positionService.getaddPositionByname(position);
        PrintWriter writer = response.getWriter();
        if (null == position1 || position1.getPo_name() == "") {
            System.out.println("1");
            writer.print("true");
        } else {
            System.out.println("2");
            writer.print("false");
        }
    }
    @RequestMapping("/getPostionAll")
    public String  getPositionAll( Model model) throws IOException {
        List<Position> positionList = positionService.getPositionAll();
       model.addAttribute("positionList",positionList);
       return "../../addRecruit";
    }

    @RequestMapping("/updatePosition1")
    public String  updatePosition(Model model, int em_id , HttpSession session) throws IOException {
        List<Position> positionList = positionService.getPositionAll();
        List<Department> departmentList=departmentService.getDepartmentAll();
        session.setAttribute("em_id",em_id);
        model.addAttribute("positionList",positionList);
        model.addAttribute("departmentList", departmentList);
        return "../../updatePosition";
    }
    @RequestMapping("/updatePosition2")
    public String  updatePosition2(Model model, int em_id , HttpSession session) throws IOException {
        List<Position> positionList = positionService.getPositionAll();
        List<Department> departmentList=departmentService.getDepartmentAll();
        session.setAttribute("em_id",em_id);
        model.addAttribute("positionList",positionList);
        model.addAttribute("departmentList", departmentList);
        return "../../updatePosition";
    }
}
