package org.team2.controller.user;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.AddressVO;
import org.team2.domain.UserVO;
import org.team2.service.AddressService;
import org.team2.service.UserService;

import javax.mail.internet.MimeMessage;
import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Random;

@Log4j
@RequestMapping("/user")
@Controller
public class UserController {
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
            log.info("컨트롤러 :"+ userVO.getNo());
            userService.insertSignup(userVO);
            log.info("컨트롤러 :"+ userVO.getNo());
            addressService.insertAddress(addressVO, userVO);
            userService.insertFirstCoupon(userVO.getNo());
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            log.info("에러다 !!");
            model.addAttribute("msg","입력에러");
            model.addAttribute("url", "javascript:history.back();");
        }
        return "user.customLogin";
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
    public String mailCheck(@RequestParam("total_email") String total_email, Principal principal){
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

    @GetMapping("openAddressListPup")
    public ModelAndView openOrderListPup(Principal principal) throws Exception {
        ModelAndView mav = new ModelAndView();
        log.info("openAddressListPup  접속");

        List<AddressVO> userAddressList=userService.readAddress(Long.valueOf(principal.getName()));
        log.info(userAddressList);
        mav.addObject("userAddressList",userAddressList);
        mav.setViewName("layerPup/openAddressListPup.empty");
        return mav;
    }



    @ResponseBody
    @RequestMapping(value="getAddressInfo", produces = MediaType.APPLICATION_JSON_VALUE)
    public AddressVO getAddressInfo(@RequestParam Long user_address_seq) throws Exception {

        log.info("getAddressInfo Controller 접속");
        AddressVO addressVO =userService.selectAddress(user_address_seq);
        return addressVO;
    }

    @GetMapping("/find_pw")
    public String find_user_pw(){
        return "user.find_pw";
    }


    //이메일 검사
    @ResponseBody
    @PostMapping("/find_email")
    public String find_pw(@RequestParam("user_email") String email) throws Exception{
        log.info("이메일 찾기 진입 !");
        log.info(email);
        String result = String.valueOf(userService.emailCheck(email));
        log.info(result);
        return result;
    }

    @GetMapping("/find_pw_with_email")
    public String find_pw_with_email(){
        return "user.find_pw_with_email";
    }

    @RequestMapping(value = "/find_pw_email_check")
    public ModelAndView find_pw_email_check(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws  Exception{
        String email = (String)request.getParameter("user_email");
        String name = (String)request.getParameter("user_name");
        log.info(email);
        log.info(name);
        UserVO vo = userService.find_pw(email);

        if(vo != null){
            Random r = new Random();
            int num = r.nextInt(999999);

            if(vo.getUser_name().equals(name)){
                session.setAttribute("email",vo.getUser_email());

                String setfrom ="test@gmail.com";
                String tomail = email;
                String title = "비밀번호변경 인증 이메일 입니다.";
                String content  = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
                        +" 비밀번호 찾기(변경) 인증번호는 " + num + "입니다." + System.getProperty("line.separator");

                try {
                    MimeMessage message = mailSender.createMimeMessage();
                    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

                    messageHelper.setFrom(setfrom);
                    messageHelper.setTo(tomail);
                    messageHelper.setSubject(title);
                    messageHelper.setText(content);

                    mailSender.send(message);
                }catch (Exception e){
                    System.out.println(e.getMessage());
                }

                ModelAndView mav = new ModelAndView();
                mav.setViewName("user.pw_auth");
                mav.addObject("num", num);
                return mav;
            }else {
                ModelAndView mav = new ModelAndView();
                mav.setViewName("");
                return mav;
            }
        }else{
            ModelAndView mav = new ModelAndView();
            mav.setViewName("");
            return  mav;
        }
    }

    @RequestMapping(value = "/pw_set.me", method = RequestMethod.POST)
    public ModelAndView pw_set(@RequestParam(value = "checking_email") String checking_email, @RequestParam(value = "num") String num, UserVO userVO ) throws Exception{
        log.info("셋미 도착 ");
        ModelAndView mav = new ModelAndView();
//        UserVO vo = new UserVO();
        try {
            if(checking_email.equals(num)){
                mav.addObject("email",userVO.getUser_email());
                mav.setViewName("user.pw_new");
            }else{

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return mav;
    }

    //비밀번호 찾기 후 비밀번호 변경
    @RequestMapping(value = "/newPassWord")
    public String newPassWord(UserVO userVO) throws Exception{
        log.info(userVO.getUser_pw());
        log.info(userVO.getUser_email());
        int result = userService.newPassword(userVO);
        log.info(result);
        if(result == 1){
            return "user.customLogin";
        }else{
            log.info("error");
            return "user.pw_new";
        }
    }

    //약관동의
    @GetMapping("/user_agree")
    public String user_agree(){
        log.info("약관동의");
        return "user.user_agree";
    }

    @ResponseBody
    @PostMapping("addNewAddress")
    public String insertNewAddress(AddressVO addressVO, Principal principal) throws Exception {
        log.info("add new address");
        addressVO.setUser_seq(Integer.parseInt(principal.getName()));
        log.info(addressVO);
        try{
            addressService.insertNewAddress(addressVO);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "";

    }

    @ResponseBody
    @RequestMapping("email_dup")
    public int email_dup(@RequestParam("total_email") String total_email) throws Exception{
        log.info(total_email);
        int result = userService.email_dup(total_email);
        return result;
    }
}
