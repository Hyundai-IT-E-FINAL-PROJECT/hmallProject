package org.team2.controller.reply;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.*;
import org.team2.service.OrderService;
import org.team2.service.ProductService;
import org.team2.service.ReplyService;

@Controller
@Log4j
@RequestMapping("/reply/*")
public class ReplyController {

    @Setter(onMethod_ = @Autowired)
    private ReplyService replyService;

    @Setter(onMethod_ = @Autowired)
    private ProductService productService;

    @Setter(onMethod_ = @Autowired)
    private OrderService orderService;

    @GetMapping(value = "/{product_seq}/{order_seq}")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView getReplyForm(@PathVariable("product_seq") Long product_seq, @PathVariable("order_seq") Long order_seq){
        log.info("product controller reply form start!!");
        ProductVO productVO = productService.getOne(product_seq);

        ModelAndView mav = new ModelAndView();
        mav.addObject("productVO", productVO);
        mav.addObject("order_seq", order_seq);
        mav.setViewName("reply.replyForm");

        return mav;
    }
    @PostMapping(value = "/")
    public ResponseEntity insertReply(@RequestBody ReplyOptionVO replyOptionVO) {
        log.info(replyOptionVO);
        replyService.insertReply(replyOptionVO.getProduct_seq(), replyOptionVO.getUser_seq(), replyOptionVO.getReply_package().replace("\"", "'"), replyOptionVO.getReply_post().replace("\"", "'"), replyOptionVO.getReply_satis().replace("\"", "'"), replyOptionVO.getStar());
        orderService.setReply(replyOptionVO.getOrder_seq());
        return new ResponseEntity(HttpStatus.OK);
    }


}
