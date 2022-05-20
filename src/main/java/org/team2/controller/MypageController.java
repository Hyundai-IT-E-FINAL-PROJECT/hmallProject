package org.team2.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Log4j
@RequestMapping("/mypage")
public class MypageController {

    @RequestMapping("")
    public ModelAndView mypage(){
        log.info("tiles test");

        ModelAndView mav = new ModelAndView();
//        mav.addObject("title", "Spring Test");
//        mav.addObject("content", "Hello World!!");
        mav.setViewName("mypage.mypageMain");

        return mav;
    }
}
