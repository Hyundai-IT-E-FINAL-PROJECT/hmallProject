package org.team2.controller.user;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j
@RequestMapping("/user/*")
@Controller
public class UserController {

    @GetMapping("/all")
    public void doAll(){
        log.info("제발 성공 !!!");
    }

    @GetMapping("/member")
    public void doMember(){
        log.info("logined Member");
    }

    @GetMapping("/admin")
    public void doAdmin(){
        log.info("logined Admin");
    }
}
