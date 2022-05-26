package org.team2.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Log4j
@RequestMapping("/")
public class SampleController {

    @RequestMapping("")
    public String main(){
        log.info("main controller");
        return "main.main";
    }
}