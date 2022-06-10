package org.team2.controller.api;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.team2.domain.UserVO;
import org.team2.service.OrderService;

import java.security.Principal;

@Controller
@Log4j
@RequestMapping("/api/admin/*")
public class AdminAPIController {
    @Setter(onMethod_ = @Autowired)
    private OrderService orderService;

    @PostMapping
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity orderConfirm(@RequestParam("order_seq") Long order_seq) {

        HttpHeaders resHeader = new HttpHeaders();
        resHeader.add("Content-Type", "application/json; charset=UTF-8");

        orderService.confirmOrder(order_seq);

        return new ResponseEntity(HttpStatus.OK);
    }
}
