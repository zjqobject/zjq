package com.jun.Controller;

import com.jun.model.Interview;
import com.jun.model.Recruit;
import com.jun.model.Resume;
import com.jun.model.Vistor;
import com.jun.service.InterViewService;
import com.jun.service.RecruitService;
import com.jun.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ResumeController {
    @Autowired
    private ResumeService resumeService;
    @Autowired
    private RecruitService recruitService;
    @Autowired
    private InterViewService interViewService;
    @RequestMapping("/addResumes")
    public String addResumes(Resume resume, Model model,HttpSession session)throws Exception{
        Vistor vistor= (Vistor) session.getAttribute("vst") ;
        resume.setR_vid(vistor.getV_id());
        resume.setR_read(0);
        int a=resumeService.addResme(resume);
        if (a==0){
            model.addAttribute("message","注册失败");
        }
        else{
            model.addAttribute("message","注册成功");
        }
        return "redirect:/showResume";
    }
    @RequestMapping("/showResume")
    public String showResume(Model model, HttpSession session, HttpServletRequest request)throws Exception{

        Vistor vistor= (Vistor) session.getAttribute("vst");
        int re_id=Integer.parseInt( request.getParameter("re_id"));
        Resume resume1= new Resume();
        resume1.setR_vid(vistor.getV_id());
        Recruit recruit= new Recruit();
        recruit.setRe_id(re_id);
        Recruit recruit1=recruitService.getRecruitByre_id(recruit);
        session.setAttribute("recruit",recruit1);
        Resume resume=resumeService.getResume(resume1);
        model.addAttribute("resume",resume);
        return "main";
    }
}
