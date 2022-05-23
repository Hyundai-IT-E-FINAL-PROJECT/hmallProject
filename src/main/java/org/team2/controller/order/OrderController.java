package org.team2.controller.order;
import com.google.gson.Gson;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.OrderVO;
import org.team2.service.OrderService;

import java.sql.SQLException;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/order")
public class OrderController {

    private OrderService orderService;

    @PreAuthorize("isAuthenticated()")  //로그인 안되어있을 때 로그인 창으로 넘어감
    @RequestMapping("")
    public ModelAndView order(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("order.basktList");
        return mav;
    }

    @GetMapping( "od")
    public ModelAndView openOrderPage(){
        log.info("orderPage 접속");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("order.orderPage");
        return mav;
    }

    @GetMapping( "orderComplete")
    public ModelAndView openOrderCompletePage(){
        log.info("orderPage 접속");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("order.orderComplete");
        return mav;
    }

//    @ResponseBody //error 뜨는 것 방지 ? 하지만 뜸
//    @PostMapping("orderComplete")
//    public ModelAndView sendOrderData(@RequestBody OrderVO vo) throws Exception {
//        log.info("데이터 이동 확인");
//        ModelAndView mv=new ModelAndView();
//        //mv.setViewName("order.orderComplete");
//        try{
//            //orderService.insert(vo);
//            //log.info(vo.toString()+ "삽입 성공");
//            mv.addObject("orderVO", vo);
//            return mv;
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return mv;
//
//    }

//    @ResponseBody
//    @PostMapping("orderComplete")
//    public ResponseEntity<String> sendOrderData(@RequestBody OrderVO vo) throws Exception {
//
//        //orderService.insert(vo);
//        //log.info("데이터 삽입 성공");
//
//        String jsonStr=new Gson().toJson(vo);
//        log.info(jsonStr);
//        HttpHeaders resHeader=new HttpHeaders();
//
//        resHeader.add("Content-Type", "application/json; charset=UTF-8");
//
//        return new ResponseEntity<>(jsonStr, resHeader, HttpStatus.OK);
//
//
//    }

        @PostMapping("orderComplete")
        public String sendOrderData(@ModelAttribute("vo") OrderVO vo, Model model) throws Exception {
            log.info("데이터 이동 확인");
            log.info(vo.toString());
            try{
                orderService.insert(vo);
            }catch (Exception e){
                e.printStackTrace();
            }
            return "order.orderComplete";
        }
}
