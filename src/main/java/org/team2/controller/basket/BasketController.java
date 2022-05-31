package org.team2.controller.basket;

import lombok.extern.log4j.Log4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Log4j
@RequestMapping("/basket/*")
public class BasketController {
    @PreAuthorize("isAuthenticated()")  //로그인 안되어있을 때 로그인 창으로 넘어감
    @RequestMapping("/basketList")
    public ModelAndView order(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("basket.basktList");
        return mav;
    }
}
