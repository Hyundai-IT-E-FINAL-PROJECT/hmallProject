package org.team2.controller.user;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.team2.domain.UserVO;
import org.team2.service.UserService;

@Log4j
@RequestMapping("/user/*")
@Controller
//@WebAppConfiguration
//@ContextConfiguration("file:src/main/webapp/WEB-INF/security-context.xml")
public class UserController {

//    @Setter(onMethod_ = @Autowired)
//    private PasswordEncoder pwencoder;

    private UserService userService;

    public UserController (UserService userService){
        this.userService = userService;
    }

    @GetMapping("/all")
    public void doAll(){
        log.info("제발 성공 !!!");
    }

    @GetMapping("/member")
    public void doMember(){
        log.info("logined Member");
    }

    @GetMapping("/admin")
    public void doAdmin(){
        log.info("logined Admin");
    }


    @GetMapping("/signup")
    public void insertSignup(){
       log.info("signup");
    }

    @PostMapping(value = "/insertUser", produces = "text/plain;charset=UTF-8")
    public String insertSignup(@ModelAttribute UserVO userVO, Model model){
        log.info("데이터 잘 넘어옴 !");
        log.info(userVO.toString());
        //log.info("잘된다!");
        try {
            log.info(userVO.getNo());
            userService.insertSignup(userVO);
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            log.info("에러다 !!");
            model.addAttribute("msg","입력에러");
            model.addAttribute("url", "javascript:history.back();");
        }
        return "customLogin";
    }

}
