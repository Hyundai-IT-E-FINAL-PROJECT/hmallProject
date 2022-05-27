package org.team2.controller.sc;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.team2.service.OrderService;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/customer")
public class ServiceCenterController {

    private OrderService orderService;

    @GetMapping("")
    public String cart() {
//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("customer.servicePage");
        return "customer.servicePage";
    }

    @GetMapping("faqList")
    public String faqList(){
        return "customer.faqList";
    }

    @GetMapping("noticeList")
    public String noticeList(){
        return "customer.noticeList";
    }

    @GetMapping("inquiryPage")
    public ModelAndView inquiryPage(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("customer.inquiryPage");

        return mav;
    }

    @GetMapping("writeInquiryPage")
    public ModelAndView writeInquiryPage(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("customer.writeInquiryPage");

        return mav;
    }

}