package org.team2.controller.mypage;

import lombok.extern.log4j.Log4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Log4j
@RequestMapping("/mypage")
public class MypageController {

/*
    private MypageService mypageService;

    public MypageController(MypageService mypageService) {
        this.mypageService = mypageService;
    }
*/

    @RequestMapping("")
    public ModelAndView mypage() {
        log.info("tiles test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypageMain");

        return mav;
    }

    @RequestMapping("level")
    public ModelAndView level() {
        log.info("level test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypageLevel");

        return mav;
    }

    @RequestMapping("mypageOrder")
    public ModelAndView oreder() {
        log.info("order test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypageOrder");

        return mav;
    }

    @RequestMapping("mypageCoupon")
    public ModelAndView coupon() {
        log.info("coupon test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypageCoupon");

        return mav;
    }

    @RequestMapping("mypagePoint")
    public ModelAndView point() {
        log.info("point test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypagePoint");

        return mav;
    }

    @RequestMapping("passwordCheck/{type}")
    public String pwcheck(@PathVariable String type, Model model) {
        log.info("check test");
        model.addAttribute("type", type);
        return "mypage.passwordCheck";
    }

    @RequestMapping("pwcheck")
    public String pwcheck(Authentication auth, @RequestParam("pwd")String id, @RequestParam("pwd")String pw, @RequestParam String type) {
        log.info("이동 test");
        log.info(type);

//        String userpwd=mypageService.test(ui_id).getUi_pwd();


        return "redirect:" + type;
    }

    @RequestMapping("mypageUpdate")
    public ModelAndView update() {
        log.info("update test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypageUpdate");

        return mav;
    }


    @RequestMapping("mypageDelivery")
    public ModelAndView delivery() {
        log.info("delivery test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypageDelivery");

        return mav;
    }

    @RequestMapping("mypageLeave")
    public ModelAndView drop() {
        log.info("update test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypageLeave");

        return mav;
    }
}
