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
import org.team2.domain.CouponVO;
import org.team2.domain.OrderVO;
import org.team2.service.CouponService;
import org.team2.service.OrderService;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/order")
public class OrderController {

    private OrderService orderService;
    private CouponService couponService;

//@RequestParam("user_seq")Long user_seq
    @GetMapping("od")
    public ModelAndView sendOrderData() throws Exception {
        ModelAndView mav = new ModelAndView();
        log.info("데이터 이동");
        mav.setViewName("order.orderPage");
//      user_sequence를 받아와야 쿠폰 내역을 불러올 수 있음.
//      log.info("user_seq: "+user_seq);
        List<CouponVO> couponList=couponService.getCouponList(41L);
        log.info(couponList);
        mav.addObject("couponList", couponList);

        return mav;
    }
//
    //수정중
//    @PostMapping( "od")
//    public ModelAndView sendOrderData (@RequestParam Map<String, String>map) throws Exception {
//        log.info("orderPage 접속");
//        ModelAndView mav = new ModelAndView();
//
//        long user_seq= Long.parseLong(map.get("user_seq"));
//        log.info("사용자의 user_seq: "+user_seq);
//        // 사용자의 쿠폰 내역을 불러오기 위함
//        List<CouponVO> couponList=couponService.getCouponList(user_seq);
//        log.info(couponList);
//        mav.addObject("couponList", couponList);
//
//        mav.setViewName("order.orderPage");
//        return mav;
//    }

//    @GetMapping("od")
//    public String sendOrderData() throws Exception {
//        log.info("컨트롤러 이동 확인");
//
//
//
//        return "order.orderPage";
//    }

    @GetMapping( "orderComplete")
    public ModelAndView openOrderCompletePage(){
        log.info("orderPage 접속");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("order.orderComplete");
        return mav;
    }


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
