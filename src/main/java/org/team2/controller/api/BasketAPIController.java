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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.BasketVO;
import org.team2.domain.UserVO;
import org.team2.service.BasketService;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j
@RequestMapping("/api/basket/*")
public class BasketAPIController {

    @Setter(onMethod_ = @Autowired)
    private BasketService basketService;

    @PostMapping
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity insertBasket(Principal principal, @RequestParam("product_seq") Long product_seq, @RequestParam("basket_count") Long basket_count){
        Long user_seq = Long.valueOf(principal.getName());

        HttpHeaders resHeader = new HttpHeaders();
        resHeader.add("Content-Type", "application/json; charset=UTF-8");

        basketService.addBasket(user_seq, product_seq, basket_count);

        return new ResponseEntity(HttpStatus.OK);
    }
}
