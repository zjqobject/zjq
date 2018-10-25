package com.jun.Controller;


import com.jun.model.Recruit;
import com.jun.model.Resume;
import com.jun.model.Vistor;
import com.jun.service.RecruitService;
import com.jun.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ResumeController {
    @Autowired
    private ResumeService resumeService;
    @Autowired
    private RecruitService recruitService;
    @RequestMapping("/addResumes")
    public String addResumes(Resume resume, Model model,HttpSession session)throws Exception{
        Vistor vistor= (Vistor) session.getAttribute("vst") ;
        resume.setR_vid(vistor.getV_id());
        resume.setR_read(0);
        int a=resumeService.addResme(resume);
        if (a==0){
            model.addAttribute("message","添加失败");
        }
        else{
            model.addAttribute("message","添加成功");
        }
        return "redirect:/showResumeAll";
    }
    @RequestMapping("/showResumeAll")
    public String showResume(Model model, HttpSession session, HttpServletRequest request)throws Exception{

        Vistor vistor= (Vistor) session.getAttribute("vst");
        int re_id=Integer.parseInt( request.getParameter("re_id"));
        Resume resume1= new Resume();
        resume1.setR_vid(vistor.getV_id());
        Recruit recruit= new Recruit();
        recruit.setRe_id(re_id);
        Recruit recruit1=recruitService.getRecruitByre_id(recruit);
        session.setAttribute("recruit",recruit1);
        List<Resume> resumeList=resumeService.getResumeByvid(resume1);
        model.addAttribute("resumeList",resumeList);
        return "main";
    }
    @RequestMapping("/showResumeDetail")
    public String showResume(Model model, int r_id , HttpServletRequest request)throws Exception{

        Resume resume1= new Resume();
        resume1.setR_id(r_id);
        Resume resume=resumeService.getResumeByid(resume1);
        model.addAttribute("resume",resume);
        return "main";
    }
}
