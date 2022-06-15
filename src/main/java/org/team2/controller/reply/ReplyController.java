package org.team2.controller.reply;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.*;
import org.team2.service.CategoryService;
import org.team2.service.ImageService;
import org.team2.service.ProductService;
import org.team2.service.ReplyService;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Log4j
@RequestMapping("/reply/*")
public class ReplyController {

    @Setter(onMethod_ = @Autowired)
    private ReplyService replyService;

    @Setter(onMethod_ = @Autowired)
    private ProductService productService;

    @GetMapping(value = "/{product_seq}")
    public ModelAndView getReplyForm(@PathVariable("product_seq") Long product_seq){
        log.info("product controller reply form start!!");
        ProductVO productVO = productService.getOne(product_seq);


        ModelAndView mav = new ModelAndView();
        mav.addObject("productVO", productVO);
        mav.setViewName("reply.replyForm");


        return mav;
    }
    @PostMapping(value = "/")
    public ResponseEntity insertReply(@RequestParam("user_seq") Long user_seq, @RequestParam("product_seq") Long product_seq, @RequestParam("star") Long star, @RequestParam("review1") Long review1, @RequestParam("review2") Long review2, @RequestParam("review3") Long review3) {

        return new ResponseEntity(HttpStatus.OK);
    }
}
