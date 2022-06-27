package org.team2.controller;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.FundVO;
import org.team2.domain.UserVO;
import org.team2.service.FundingService;

import java.util.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j
@RequestMapping("/")
public class SampleController {

    @Setter(onMethod_ = @Autowired)
    private FundingService fundingService;

    @RequestMapping("")
    public ModelAndView main() throws Exception {
        log.info("main controller");
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("main");
        List<FundVO> bestFund = fundingService.best1FundProduct();
        log.info(bestFund.toString());
        List<FundVO> deadlineProduct=fundingService.deadlineProduct();
        log.info(deadlineProduct.toString());

        ModelAndView mv = new ModelAndView();
        mv.setViewName("main.main");
        mv.addObject("bestFund",bestFund);
        mv.addObject("deadlineProduct",deadlineProduct);
        mv.addObject("cssFileList", styleFileList);
        mv.addObject("className", "wrap hyundai-homeshoping");
        return mv;
    }
}