package org.team2.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.UserVO;

@Controller
@Log4j
@RequestMapping("/")
public class SampleController {

    @RequestMapping("")
<<<<<<< HEAD
    public ModelAndView main(){
=======
    public String main(@AuthenticationPrincipal UserVO userVO){
        int i = userVO.getNo();
        log.info(i);
>>>>>>> 1d8fd91 ([FEAT]: 개인정보 수정)
        log.info("main controller");

        ModelAndView mv = new ModelAndView();
        mv.setViewName("main.main");
        mv.addObject("className", "wrap hyundai-homeshoping");

        return mv;
    }
}