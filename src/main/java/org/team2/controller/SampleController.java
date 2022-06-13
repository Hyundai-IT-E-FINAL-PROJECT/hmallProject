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

import java.util.ArrayList;
import java.util.List;

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

        FundVO best1Product=fundingService.best1FundProduct();
        FundVO deadlineProduct=fundingService.deadlineProduct();
        log.info(best1Product);
        log.info(deadlineProduct);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("main.main");
        mv.addObject("cssFileList", styleFileList);
        mv.addObject("best1Product", best1Product);
        mv.addObject("deadlineProduct", deadlineProduct);
        mv.addObject("className", "wrap hyundai-homeshoping");
        return mv;
    }
}