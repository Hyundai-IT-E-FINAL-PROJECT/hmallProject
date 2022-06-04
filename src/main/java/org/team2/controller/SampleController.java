package org.team2.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.UserVO;

import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j
@RequestMapping("/")
public class SampleController {

    @RequestMapping("")
    public ModelAndView main(){
        log.info("main controller");

        ModelAndView mav = new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("main");
        mav.addObject("cssFileList", styleFileList);
        mav.addObject("className", "wrap hyundai-homeshoping");
        mav.setViewName("main.main");

        return mav;
    }
}