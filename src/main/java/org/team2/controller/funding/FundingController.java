package org.team2.controller.funding;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/fund")
public class FundingController {

    @GetMapping( "main")
    public ModelAndView openOrderCompletePage(){
        log.info("fundingMain 접속");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("funding.fundingMain");
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("search");
        styleFileList.add("display");
        styleFileList.add("prd-list");

        mav.addObject("cssFileList", styleFileList);
        mav.addObject("className", "wrap display-3depth");
        return mav;
    }
}
