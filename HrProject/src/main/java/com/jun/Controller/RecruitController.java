package com.jun.Controller;

import com.jun.model.Position;
import com.jun.model.Recruit;
import com.jun.service.InterViewService;
import com.jun.service.PositionService;
import com.jun.service.RecruitService;
import com.jun.util.DoPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

@Controller
public class RecruitController {
    @Autowired
    private RecruitService recruitService;
    @Autowired
    private PositionService positionService;
    @RequestMapping("/addRecruit")
    public String addRecruit(Model model ,Recruit recruit)throws Exception{
       int a= recruitService.addRecruit(recruit);
       if(a==1){
        model.addAttribute("addREMSG","添加成功");}
        else {
            model.addAttribute("addREMSG","添加成功");
       }
        return "../../addRecruit";
    }
    @RequestMapping("/getRecruit")
    public void getRecruit(HttpServletResponse response,  Recruit recruit)throws Exception{
        Recruit recruit1=recruitService.getRecruitByre_poid(recruit);
        PrintWriter writer = response.getWriter();
        if (null == recruit1) {
            System.out.println("1");
            writer.print("true");
        } else {
            System.out.println("2");
            writer.print("false");
        }
    }
    @RequestMapping("/showRecruit")
    public String showRecruit(Model model , int currentPage )throws Exception{
        List<Recruit> recruitList = recruitService.getRecruitAll();
        HashMap<String,Object> map= new HashMap<String, Object>();
        int pagesize=2;
        map.put("open",(currentPage-1)*pagesize+1);
        map.put("end",currentPage*pagesize);
        System.out.println(map);
        List<Recruit> recruitList1=recruitService.getRecruitListAll(map);
        for(int i=0;i<recruitList1.size();i++){
            int em_poid=recruitList1.get(i).getRe_poid();
            Position position =new Position();
            position.setPo_id(em_poid);
            Position position1=positionService.getaddPositionBypoid(position);
            recruitList1.get(i).setRe_position(position1.getPo_name());
        }
        int totalRows=recruitList.size();
        int totalpages= DoPage.getTotalPages(totalRows);
        System.out.println(recruitList.size());
        System.out.println(recruitList1.size());
        model.addAttribute("recruitList",recruitList1);
        model.addAttribute("totalPages",totalpages);
        return "main";
    }
  /*  @RequestMapping("/showRecruitDetail")
    public String showRecruitDetail(Model model , int re_id )throws Exception{
        List<Recruit> recruitList = recruitService.getRecruitAll();
        HashMap<String,Object> map= new HashMap<String, Object>();
        int pagesize=2;
        map.put("open",(currentPage-1)*pagesize+1);
        map.put("end",currentPage*pagesize);
        System.out.println(map);
        List<Recruit> recruitList1=recruitService.getRecruitListAll(map);
        int totalRows=recruitList.size();
        int totalpages= DoPage.getTotalPages(totalRows);
        System.out.println(recruitList.size());
        System.out.println(recruitList1.size());
        model.addAttribute("recruitList",recruitList1);
        model.addAttribute("totalPages",totalpages);
        return "main";
    }*/
}
