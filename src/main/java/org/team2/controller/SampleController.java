package org.team2.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.UserVO;

import java.util.ArrayList;
import java.util.List;

import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j
@RequestMapping("/")
public class SampleController {

    @RequestMapping("")
    public ModelAndView main(){
        log.info("main controller");
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("main");

        ModelAndView mv = new ModelAndView();
        mv.setViewName("main.main");
        mv.addObject("cssFileList", styleFileList);
        mv.addObject("className", "wrap hyundai-homeshoping");

        return mv;
    }
}