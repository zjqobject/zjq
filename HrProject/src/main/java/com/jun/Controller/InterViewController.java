package com.jun.Controller;

import com.jun.model.*;
import com.jun.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class InterViewController {
    @Autowired
    private InterViewService interViewService;
    @Autowired
    private RecruitService recruitService;
    @Autowired
    private PositionService positionService;
    @Autowired
    private VistorService vistorService;
    @RequestMapping("/addInterview")
    public String addInterview(Model model, RedirectAttributes arr,int iv_rid, HttpSession session)throws Exception{
        Interview interview= new Interview();
        Vistor vistor=(Vistor)session.getAttribute("vst");
        interview.setIv_vid(vistor.getV_id());
        Recruit recruit =(Recruit) session.getAttribute("recruit");
        interview.setIv_reid(recruit.getRe_id());
        interview.setIv_rid(iv_rid);
        interview.setIv_receive(0);
        interview.setIv_offerid(0);
        interview.setIv_date(new Date());
        interview.setIv_offerDate(new Date());
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
        interview.setIv_vid(vistor.getV_id());
        List<Interview> interviewList=interViewService.getInterViewByiv_vid(interview);
        for(int i=0;i<interviewList.size();i++){
           Recruit recruit =new Recruit();
           Position position= new Position();
           int re_id= interviewList.get(i).getIv_reid();
           recruit.setRe_id(re_id);
           Recruit recruit1=recruitService.getRecruitByre_id(recruit);
           position.setPo_id(recruit1.getRe_poid());
           Position position1= positionService.getaddPositionBypoid(position);
           interviewList.get(i).setIv_vname(vistor.getV_name());
           interviewList.get(i).setIv_poname(position1.getPo_name());
        }
        model.addAttribute("interviewList",interviewList);
        return "main";
    }
    @RequestMapping("/updateInterViewReceive")
    public String updateInterViewReceive(int iv_id)throws Exception{
        Interview interview= new Interview();
        interview.setIv_id(iv_id);
        interview.setIv_receive(1);
       interViewService.updateInterViewReceive(interview);
        return "redirect:/showInterview";
    }
    @RequestMapping("/updateInterViewinvit")
    public String updateInterViewinvit(int iv_id)throws Exception{
        Interview interview= new Interview();
        interview.setIv_id(iv_id);
        interview.setIv_invit(1);
        Date now = new Date();
        interview.setIv_date(now);
        interViewService.updateInterViewinvit(interview);
        return "redirect:/showInterviewAll";
    }
    @RequestMapping("/showInterviewAll")
    public String showInterviewALL(Model model)throws Exception{
        List<Interview> interviewList=interViewService.getInterViewALL();
        for(int i=0;i<interviewList.size();i++){
            Recruit recruit =new Recruit();
            Position position= new Position();
            int re_id= interviewList.get(i).getIv_reid();
            int v_id= interviewList.get(i).getIv_vid();
            Vistor vistor=new Vistor();
            vistor.setV_id(v_id);
            Vistor vistor1= vistorService.getVistor(vistor);
            recruit.setRe_id(re_id);
            Recruit recruit1=recruitService.getRecruitByre_id(recruit);
            position.setPo_id(recruit1.getRe_poid());
            Position position1= positionService.getaddPositionBypoid(position);
            interviewList.get(i).setIv_vname(vistor1.getV_name());
            interviewList.get(i).setIv_poname(position1.getPo_name());
        }
        model.addAttribute("interviewList",interviewList);
        return "manager";
    }
    @RequestMapping("/getInvitmessage")
    public String getInvitmessage(Model model,int iv_id)throws Exception{
        Interview interview= new Interview();
        interview.setIv_id(iv_id);
        Interview interview1=interViewService.getInterViewByid(interview);
        Recruit recruit =new Recruit();
        Position position= new Position();
        int re_id= interview1.getIv_reid();
        int v_id= interview1.getIv_vid();
        Vistor vistor=new Vistor();
        vistor.setV_id(v_id);
        Vistor vistor1= vistorService.getVistor(vistor);
        recruit.setRe_id(re_id);
        Recruit recruit1=recruitService.getRecruitByre_id(recruit);
        position.setPo_id(recruit1.getRe_poid());
        Position position1= positionService.getaddPositionBypoid(position);
        interview1.setIv_vname(vistor1.getV_name());
        interview1.setIv_poname(position1.getPo_name());
        model.addAttribute("interviewMsg",interview1);
        return "main";
    }
    @RequestMapping("/getOfferDetail")
    public String getOfferDetail(Model model,int iv_id)throws Exception{
        Interview interview= new Interview();
        interview.setIv_id(iv_id);
        Interview interview1=interViewService.getInterViewByid(interview);
        Recruit recruit =new Recruit();
        Position position= new Position();
        int re_id= interview1.getIv_reid();
        int v_id= interview1.getIv_vid();
        Vistor vistor=new Vistor();
        vistor.setV_id(v_id);
        Vistor vistor1= vistorService.getVistor(vistor);
        recruit.setRe_id(re_id);
        Recruit recruit1=recruitService.getRecruitByre_id(recruit);
        position.setPo_id(recruit1.getRe_poid());
        Position position1= positionService.getaddPositionBypoid(position);
        interview1.setIv_vname(vistor1.getV_name());
        interview1.setIv_poname(position1.getPo_name());
        model.addAttribute("offerview",interview1);
        return "main";
    }

}
