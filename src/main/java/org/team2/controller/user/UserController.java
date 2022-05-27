package org.team2.controller.user;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.AddressVO;
import org.team2.domain.UserVO;
import org.team2.service.AddressService;
import org.team2.service.UserService;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import java.util.Date;
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

    @Setter(onMethod_ = @Autowired)
    private JavaMailSender mailSender;

    public UserController (UserService userService, AddressService addressService, JavaMailSender mailSender){
        this.userService = userService;
        this.addressService = addressService;
        this.mailSender = mailSender;
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

    @RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
    @ResponseBody
    public String mailCheck(@RequestParam("total_email") String total_email){
        int serti = (int)((Math.random() * (99999-10000+1)) + 10000);
        String from = "team2@naver.com";
        String to = total_email;
        String title = "회원가입시 필요한 인증번호 입니다.";
        String content = "[인증번호]" + serti +" 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
        String num = "";
        log.info(total_email);
        try {
            MimeMessage m = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(m, true, "UTF-8");

            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(title);
            mailHelper.setText(content, true);
            mailSender.send(m);
            num = Integer.toString(serti);
        }catch (Exception e){
            e.printStackTrace();
            num = "error";
        }

        return num;
    }
    @GetMapping("/finduser_info")
    public String find_user_info(){
        log.info("hi");
        return "user.finduser_info";
    }

    @PostMapping("/find_id")
    public ModelAndView find_id(UserVO userVO){

        ModelAndView mav = new ModelAndView();
        mav.setViewName("user.find_id");
        log.info("hi");
        log.info(userVO.getUser_name());
        log.info(userVO.getUser_email());
        try {
            UserVO vo = userService.find_id(userVO);
            mav.addObject("find", vo);
        }catch(Exception e){
            e.printStackTrace();
        }
        return mav;
    }
}
