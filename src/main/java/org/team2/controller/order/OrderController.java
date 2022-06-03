package org.team2.controller.order;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.ucp.proxy.annotation.Post;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.CouponVO;
import org.team2.domain.OrderVO;
import org.team2.domain.UserVO;
import org.team2.service.CouponService;
import org.team2.service.OrderService;
import org.team2.service.UserService;

import java.security.Principal;
import java.util.List;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/order")
public class OrderController {

    private OrderService orderService;
    private CouponService couponService;
    private UserService userService;

//    @PreAuthorize("isAuthenticated()")  //로그인 안되어있을 때 로그인 창으로 넘어감
//    @RequestMapping("")
//    public ModelAndView order(){
//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("order.basktList");
//        return mav;
//    }


    @ResponseBody
    @RequestMapping(value = "od", method = RequestMethod.GET)
    public ModelAndView sendOrderData(Principal principal) throws Exception {
//    public ModelAndView sendOrderData(@RequestParam("user_seq") Long user_seq) throws Exception {
        ModelAndView mav = new ModelAndView();
        //예치금, 적립금도 불러오기
        Long user_seq=Long.valueOf(principal.getName());
        mav.addObject("className","wrap order-main");
        log.info("데이터 이동");
        List<CouponVO> couponList=couponService.getCouponList(user_seq);
        UserVO user=userService.readPoint(user_seq);
        mav.addObject("user_seq", user_seq);
        mav.addObject("couponList", couponList);
        mav.addObject("userPoint", user.getUser_point());
        mav.addObject("depositPoint",user.getUser_deposit());
        mav.setViewName("order.orderPage");
        return mav;
    }

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

        @ResponseBody
        @PostMapping("couponInfo")
        public String getCouponInfo(@RequestParam("couponSeq") String couponSeq) throws Exception{
            log.info("쿠폰 데이터 가져오는 중");
            log.info(couponSeq);

            String discount="";

            CouponVO vo=couponService.couponDiscount(Long.valueOf(couponSeq));

            if(vo.getCoupon_cost()==0){
                discount= String.valueOf(vo.getCoupon_ratio());
                log.info(discount);
                return discount;
            }else{
                discount= String.valueOf(vo.getCoupon_cost());
                log.info(discount);
                return discount;
            }
        }

}
