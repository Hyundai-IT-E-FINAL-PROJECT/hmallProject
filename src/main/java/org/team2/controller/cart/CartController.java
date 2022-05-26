package org.team2.controller.cart;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/cart")
public class CartController {

    @PreAuthorize("isAuthenticated()")  //로그인 안되어있을 때 로그인 창으로 넘어감
    @RequestMapping("")
    public ModelAndView cart(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("cart.basktList");
        return mav;
    }

}
