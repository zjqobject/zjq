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
import java.util.List;

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

            if(request.getParameter("re_id")!=null) {
                Recruit recruit = new Recruit();
                int re_id = Integer.parseInt(request.getParameter("re_id"));
                recruit.setRe_id(re_id);
                Recruit recruit1 = recruitService.getRecruitByre_id(recruit);
                session.setAttribute("recruit", recruit1);
                Resume resume1= new Resume();
                resume1.setR_vid(vistor.getV_id());
                List<Resume> resumeList=resumeService.getResumeByvid(resume1);
                model.addAttribute("resumeList",resumeList);
                return "main";
            }
            else{
        Resume resume1= new Resume();
        resume1.setR_vid(vistor.getV_id());
        List<Resume> resumeList=resumeService.getResumeByvid(resume1);
        model.addAttribute("resumeList1",resumeList);
        return "main";}
    }
    @RequestMapping("/showResumeDetail")
    public String showResume(Model model, int r_id , HttpServletRequest request)throws Exception{

        Resume resume1= new Resume();
        resume1.setR_id(r_id);
        Resume resume=resumeService.getResumeByid(resume1);
        model.addAttribute("resume",resume);
        return "main";
    }
    @RequestMapping("/showResumeDetail1")
    public String showResume1(Model model, int r_id , HttpServletRequest request)throws Exception{

        Resume resume1= new Resume();
        resume1.setR_id(r_id);
        Resume resume=resumeService.getResumeByid(resume1);
        model.addAttribute("resume",resume);
        return "ResumeDetail";
    }
    @RequestMapping("/deleteResumes")
    public String deletResumeByid( int r_id ,HttpSession session)throws Exception{
        Resume resume1= new Resume();
        resume1.setR_id(r_id);
        Interview interview= new Interview();
        interview.setIv_rid(r_id);
        List<Interview> interviewList=interViewService.getInterViewByiv_rid(interview);
     if(interviewList!=null){
         session.setAttribute("ReERR","已投递，无法删除");
     }
     else{
         resumeService.deleteResumeByid(resume1);
     }
        return "redirect:/showResumeAll";
    }
    @RequestMapping("/updateResume")
    public String updateResume(Resume resume , HttpSession session)throws Exception{

        Interview interview= new Interview();
        interview.setIv_rid(resume.getR_id());
        List<Interview> interviewList=interViewService.getInterViewByiv_rid(interview);
        if(interviewList!=null){
            session.setAttribute("ReERR","已投递，无法更新");
        }
        else{
            resumeService.updateResumeByid(resume);
        }
        return "redirect:/showResumeAll";
    }
}
