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
import org.team2.domain.AddressVO;
import org.team2.domain.UserVO;
import org.team2.service.AddressService;
import org.team2.service.UserService;

import java.util.List;

@Log4j
@RequestMapping("/user")
@Controller
//@WebAppConfiguration
//@ContextConfiguration("file:src/main/webapp/WEB-INF/security-context.xml")
public class UserController {

//    @Setter(onMethod_ = @Autowired)
//    private PasswordEncoder pwencoder;

    @Setter(onMethod_ = @Autowired)
    private UserService userService;
    @Setter(onMethod_ = @Autowired)
    private AddressService addressService;

    public UserController (UserService userService, AddressService addressService){
        this.userService = userService;
        this.addressService = addressService;
    }
//    public UserController(AddressService addressService){
//        this.addressService = addressService;
//    }

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
    public String insertSignup(@ModelAttribute UserVO userVO, AddressVO addressVO, Model model){
        log.info("데이터 잘 넘어옴 !");
        log.info(userVO.toString());
        log.info(addressVO.toString());
        //log.info("잘된다!");
        try {
            log.info(userVO.getNo());
            userService.insertSignup(userVO);
            addressService.insertAddress(addressVO, userVO);
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            log.info("에러다 !!");
            model.addAttribute("msg","입력에러");
            model.addAttribute("url", "javascript:history.back();");
        }
        return "customLogin";
    }
    @ResponseBody
    @PostMapping ("/idCheck")
    public int idCheck(@RequestParam("id") String id) throws Exception{
        log.info("userIdCheck 진입");
        log.info(id);
        int cnt = 0;
        cnt = userService.idCheck(id);
        //int cnt = 0;
        return cnt;
    }
}
