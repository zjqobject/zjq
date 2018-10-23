package com.jun.Controller;

import com.jun.model.Interview;
import com.jun.model.Recruit;
import com.jun.model.Resume;
import com.jun.model.Vistor;
import com.jun.service.InterViewService;
import com.jun.service.InterViewServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class InterViewController {
    @Autowired
    private InterViewService interViewService;
    @RequestMapping("/addInterview")
    public String addInterview(Model model, RedirectAttributes arr, HttpSession session)throws Exception{
        Interview interview= new Interview();
        Vistor vistor=(Vistor)session.getAttribute("vst");
        interview.setIv_vname(vistor.getV_name());
      Recruit recruit =(Recruit) session.getAttribute("recruit");
        interview.setIv_rename(recruit.getRe_position());
        Interview interview1=interViewService.getInterView(interview);
        if(interview1==null) {
            int a = interViewService.addInterView(interview);
            return "redirect:/showInterview";
        }else{
            model.addAttribute("nullmessage","简历已投递");
            arr.addAttribute("currentPage", 1);
            return"redirect:/showRecruit";
        }
    }
    @RequestMapping("/showInterview")
    public String showInterview(Model model, HttpSession session, HttpServletRequest request)throws Exception{
        Interview interview= new Interview();
        Vistor vistor=(Vistor)session.getAttribute("vst");
        interview.setIv_vname(vistor.getV_name());
        List<Interview> interviewList=interViewService.getInterViewByiv_vname(interview);
        model.addAttribute("interviewList",interviewList);
        return "interview";
    }

}
