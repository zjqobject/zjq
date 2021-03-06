package com.jun.Controller;

import com.jun.model.Vistor;
import com.jun.service.VistorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
public class VistorController {
    @Autowired
    private VistorService vistorService;
    @RequestMapping("/login")
    public String login(Vistor vistor, RedirectAttributes arr, HttpSession session)throws Exception{
            Vistor vistor1 = vistorService.getVistor(vistor);
            if (null != vistor1) {
                if(vistor1.getV_name().equals("root")){
                    return "redirect:/showInterviewAll";
                }
                else {
                    arr.addAttribute("currentPage", 1);
                    session.setAttribute("vst", vistor1);
                    return "redirect:/showRecruit";
                }
            }

            return "../../index";

    }
    @RequestMapping("/volidataname")
    public void volidataname(@RequestParam("v_name") String v_name, HttpServletResponse response )throws Exception{
        Vistor vistor=new Vistor();
        vistor.setV_name(v_name);
        System.out.println(v_name);
        Vistor vistor1 = vistorService.getVistor(vistor);
        System.out.println(vistor1);
        PrintWriter writer=response.getWriter();
        if (null==vistor1||vistor1.getV_name()==""){
            System.out.println("1");
            writer.print("true");
        }
        else {
            System.out.println("2");
            writer.print("false");
        }
    }

    @RequestMapping("/register")
    public String register(Vistor vistor, Model model)throws Exception{
        System.out.println(vistor);
        int a=vistorService.addVistor(vistor);
        if (a==0){
            model.addAttribute("message","注册失败");
        }
        else{
            model.addAttribute("message","注册成功");
        }
        return "../../register";
    }
}
