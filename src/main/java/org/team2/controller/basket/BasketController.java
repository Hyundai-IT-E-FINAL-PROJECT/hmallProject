package org.team2.controller.basket;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.BasketVO;
import org.team2.domain.CategoryVO;
import org.team2.domain.ProductVO;
import org.team2.domain.UserVO;
import org.team2.service.BasketService;
import org.team2.service.CategoryService;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/basket/*")
public class BasketController {

    @Setter(onMethod_ = @Autowired)
    private BasketService basketService;

//    @PreAuthorize("isAuthenticated()")  //로그인 안되어있을 때 로그인 창으로 넘어감
    @RequestMapping("/basketList")
    public ModelAndView order(@AuthenticationPrincipal UserVO userVO){
        List<BasketVO> allByUserSeq = basketService.getAllByUserSeq(21L);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("basket.basktList");
        mav.addObject("basketVOList", allByUserSeq);
        mav.addObject("className", "wrap cartwrap");
        return mav;
    }
}
