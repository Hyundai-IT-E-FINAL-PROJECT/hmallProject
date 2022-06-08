package org.team2.controller.order;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.*;
import org.team2.service.CouponService;
import org.team2.service.OrderService;
import org.team2.service.UserService;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/order")
public class OrderController {

    private OrderService orderService;
    private CouponService couponService;
    private UserService userService;


    @ResponseBody
    @RequestMapping(value = "od/{order_seq}", method = RequestMethod.GET)
    public ModelAndView sendOrderComplete(Principal principal, @PathVariable Long order_seq) throws Exception {
        ModelAndView mav = new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("order");

        List<Map<String, Object>> historyOrder=orderService.justanOrderSelect(order_seq);
        log.info(historyOrder);

        mav.addObject("historyOrder", historyOrder);
        mav.addObject("cssFileList", styleFileList);
        mav.setViewName("order.orderComplete");
        return mav;
    }

    @ResponseBody
    @PostMapping("od")
    public ModelAndView getOrderList(@ModelAttribute(value="basketList") BasketListVO basketListVO,Principal principal) throws Exception {
//    public ModelAndView sendOrderData(@RequestParam("user_seq") Long user_seq) throws Exception {
        ModelAndView mav = new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("order");

        AddressVO basicAddress=userService.selectBasicAddress(Long.valueOf(principal.getName()));
        //log.info(directBasket);
        log.info(basicAddress);

        //예치금, 적립금도 불러오기
        Long user_seq=Long.valueOf(principal.getName());
        mav.addObject("className","wrap order-main");
        log.info("데이터 이동");
        List<CouponVO> couponList=couponService.getCouponList(user_seq);
        UserVO user=userService.readPoint(user_seq);
        //mav.addObject("directBasket",directBasket);

        List<BasketVO> basketList=new ArrayList<>();
        for (int i=0; i<basketListVO.getBasketList().size(); i++){
            basketList.add(basketListVO.getBasketList().get(i));
        }
        log.info(basketList);
        mav.addObject("basketList", basketList);

        mav.addObject("user_seq", user_seq);
        mav.addObject("couponList", couponList);
        mav.addObject("basicAddress",basicAddress);
        mav.addObject("userPoint", user.getUser_point());
        mav.addObject("depositPoint",user.getUser_deposit());
        mav.addObject("cssFileList", styleFileList);
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



        @Transactional
        @ResponseBody
        @PostMapping("orderComplete")
        public String sendOrderData(@ModelAttribute OrderVO orderVO, @ModelAttribute ProductVO productVO,
                                    @ModelAttribute UserVO userVO, @ModelAttribute OpVO opVO,
                                    @ModelAttribute CuVO cuVO,
                                    @RequestParam(value="basket_list[]") List<String> basket_list,
                                    @RequestParam(value="product_list[]") List<String> product_list,
                                    Principal principal) throws Exception {
            log.info("order process...");
            orderVO.setUser_seq(Integer.parseInt(principal.getName()));

            long order_seq = 0;
            try {
                //tbl_order insert query
                orderService.insert(orderVO);
                order_seq = orderVO.getNo();

                for (int i = 0; i < basket_list.size(); ++i) {
                    //tbl_op insert query
                    opVO.setOrder_seq((int) order_seq);
                    opVO.setProduct_seq(Integer.parseInt(product_list.get(i)));
                    opVO.setOp_count(Long.valueOf(basket_list.get(i)));
                    orderService.insertOp(opVO);
                    //update product sell count
                    productVO.setSell_count(Long.valueOf(basket_list.get(i)));
                    orderService.productSellUpdate(productVO);

                }
                //update userPoint, deposit query
                userVO.setNo(Integer.parseInt(principal.getName()));
                orderService.userPointUpdate(userVO);
                //coupon delete
                if(cuVO.getCoupon_seq()!=null){ //coupon 선택 했을 시
                    cuVO.setUser_seq(Long.valueOf(principal.getName()));
                    orderService.deleteUseCoupon(cuVO);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
            return Integer.toString((int) order_seq); //return order_seq로 바꿔주기
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
