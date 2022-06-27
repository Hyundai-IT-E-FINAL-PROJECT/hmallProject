package org.team2.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletResponse;

@Controller
public class MyAdvice {

//    private Logger logger = LoggerFactory.getLogger(MyAdvice.class);
//
//    @ExceptionHandler
//    public String handleException(Exception ex, Model model) {
//        model.addAttribute("code", "ERROR_404");
//        return "error.error404";
//    }
    @GetMapping("/error404")
    public String Error404(HttpServletResponse res, Model model) {
        model.addAttribute("code", "ERROR_404");
        return "error/error404.empty";
    }

    @GetMapping("/error505")
    public String Error500(HttpServletResponse res, Model model) {
        model.addAttribute("code", "ERROR_500");
        return "error/error505";
    }
}