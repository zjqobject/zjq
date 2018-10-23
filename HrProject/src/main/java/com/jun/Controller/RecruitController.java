package com.jun.Controller;

import com.jun.model.Recruit;
import com.jun.service.InterViewService;
import com.jun.service.RecruitService;
import com.jun.util.DoPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;

@Controller
public class RecruitController {
    @Autowired
    private RecruitService recruitService;
    @RequestMapping("/showRecruit")
    public String showRecruit(Model model , int currentPage )throws Exception{
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
