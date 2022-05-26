package org.team2.controller.sc;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.team2.service.OrderService;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/sc")
public class ServiceCenterController {

    private OrderService orderService;

    @RequestMapping("")
    public ModelAndView order() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("sc.servicePage");
        return mav;
    }

}