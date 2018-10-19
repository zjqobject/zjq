package com.jun.Controller;

import com.jun.model.Vistor;
import com.jun.service.VistorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class VistorController {
    @Autowired
    private VistorService vistorService;
    @RequestMapping("/login")
    public String login(Vistor vistor, RedirectAttributes arr, HttpSession session)throws Exception{
        Vistor vistor1 = vistorService.getVistor(vistor);
        if (null!=vistor1){
            arr.addAttribute("currentPage",1);
            session.setAttribute("vst",vistor1);
            return "redirect:/showresume";
        }
        return "../../index";
    }
    @RequestMapping("/register")
    public String register(String v_name,String v_pass, Model model)throws Exception{
        System.out.println("1:"+v_name+v_pass);
//        Vistor vistor=new  V
        int a=vistorService.addVistor(v_name,v_pass);
        if (a==0){
            model.addAttribute("message","注册成功");
        }
        else{
            model.addAttribute("message","注册成功");
        }
        return "../../register";
    }
}