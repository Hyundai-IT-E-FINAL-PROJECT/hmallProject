package org.team2.controller.mypage;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.service.MypageService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@Log4j
public class MypageController {


    @Setter(onMethod_ = @Autowired)
    private MypageService mypageService;

    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder pwencoder;

    @GetMapping("/mypage/{no}")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView mypage(@PathVariable long no) throws Exception {
        log.info("tiles test");
        ModelAndView mav = new ModelAndView();
        log.info(no);
        try {
            List<Map<String,Object>> list = mypageService.recentOrders(no);
            mav.addObject("list", list);
            log.info(list);
            mav.setViewName("mypage.mypageMain");
            return mav;
        }
        catch (Exception e) {
            mav.addObject("msg", "마이페이지 에러");
            mav.setViewName("accessError");
            return mav;
        }

    }

    @RequestMapping("level")
    public ModelAndView level() {
        log.info("level test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypageLevel");

        return mav;
    }

    @RequestMapping("mypageOrderDetail")
    public ModelAndView orderDetail() {
        log.info("detail test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypageOrderDetail");

        return mav;
    }

    // 마이페이지 주문/배송조회 페이지 기간 별로 상품 나타내기, 상품명 검색 기능 컨트롤러
   @RequestMapping("mypageOrder/{no}")
    public ModelAndView oreder(@PathVariable long no, HttpServletRequest req) {
        ModelAndView mav = new ModelAndView();

        String ordStrtDt = req.getParameter("ordStrtDt");
        String ordEndDt = req.getParameter("ordEndDt");
        String seType =  req.getParameter("seType");
        String itemNm =  req.getParameter("itemNm");

        try {
            List<Map<String,Object>> list = mypageService.periodOrders(no, ordStrtDt, ordEndDt, seType, itemNm);
            mav.addObject("list", list);
            mav.addObject("seType", seType);
            log.info(list);
            mav.setViewName("mypage.mypageOrder");
        }
        catch (Exception e) {
            mav.addObject("msg", "마이페이지 에러");
            mav.setViewName("accessError");
        }
        return mav;
    }


    @RequestMapping("mypageCoupon")
    public ModelAndView coupon() {
        log.info("coupon test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypageCoupon");

        return mav;
    }

    @RequestMapping("mypagePoint")
    public ModelAndView point() {
        log.info("point test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypagePoint");

        return mav;
    }

    // 마이페이지 나의 정보(회원정보 변경, 배송지 관리, 회원 탈퇴) 페이지를 들어가기전 비밀번호를 재확인 기능 컨트롤러
    @ResponseBody
    @PostMapping("pwdcheck")
    public ResponseEntity<String> pwcheck(@RequestParam Map<String, Object> param) throws Exception {
        ResponseEntity<String> entity = null;

        String userPwd = (String)param.get("userPwd");
        String inputPwd = (String)param.get("inputPwd");
        log.info(param.get("userPwd"));
        log.info(param.get("inputPwd"));

        try {
            boolean result = pwencoder.matches(inputPwd, userPwd);
            log.info(result);
            if (result) entity = new ResponseEntity<String>("1", HttpStatus.OK);
            else entity = new ResponseEntity<String>("0", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    @RequestMapping("mypageUpdate")
    public ModelAndView update() {
        log.info("update test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypageUpdate");

        return mav;
    }


    @RequestMapping("mypageDelivery")
    public ModelAndView delivery() {
        log.info("delivery test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypageDelivery");

        return mav;
    }

    @RequestMapping("mypageLeave")
    public ModelAndView drop() {
        log.info("update test");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage.mypageLeave");

        return mav;
    }
}
