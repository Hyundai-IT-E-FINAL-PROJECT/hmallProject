package org.team2.controller.mypage;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.DepositVO;
import org.team2.domain.UserVO;
import org.team2.service.CouponService;
import org.team2.service.MypageService;
import org.team2.service.UserService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.*;

@Controller
@Log4j
public class MypageController {


    @Setter(onMethod_ = @Autowired)
    private MypageService mypageService;

    @Setter(onMethod_ = @Autowired)
    private UserService userService;

    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder pwencoder;

    @Setter(onMethod_ = @Autowired)
    private CouponService couponService;

    @RequestMapping("/mypage")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView mypage(Principal principal, Authentication authentication ) throws Exception {

        ModelAndView mav = new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");

        long no = Long.parseLong(principal.getName());

        try {
            Map map = mypageService.recentOrders(no);
            int couponCount=couponService.couponCount(Long.valueOf(principal.getName()));

            mav.addObject("couponCount", couponCount);
            mav.addObject("list", map.get("resultList"));
            mav.addObject("className", "wrap mp-main");
            mav.addObject("cssFileList", styleFileList);
            mav.setViewName("mypage.mypageMain");

            return mav;
        }
        catch (Exception e) {

            mav.addObject("msg", e.getMessage());
            mav.setViewName("accessError");
            return mav;
        }
    }

    @RequestMapping("level")
    public ModelAndView level() {
        log.info("level test");

        ModelAndView mav = new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");
        mav.addObject("className", "wrap wing-none mp-membership");
        mav.addObject("cssFileList", styleFileList);
        mav.setViewName("mypage.mypageLevel");

        return mav;
    }

    @GetMapping("mypageOrderDetail/{odno}")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView orderDetail(@PathVariable  long odno, Principal principal) throws Exception {
        log.info("detail test");
        ModelAndView mav = new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");
        long no = Long.parseLong(principal.getName());
        try {
            Map map = mypageService.detailOrders(no, odno);
            log.info(map.get("resultList"));
            mav.addObject("list", map.get("resultList"));
            mav.addObject("className", "wrap order-list-page");
            mav.addObject("cssFileList", styleFileList);
            mav.setViewName("mypage.mypageOrderDetail");
        }
        catch (Exception e) {
            mav.addObject("msg", e.getMessage());
            mav.setViewName("accessError");
        }
        return mav;
    }

    // 마이페이지 주문/배송조회 페이지 기간 별로 상품 나타내기, 상품명 검색 기능 컨트롤러
   @RequestMapping("mypageOrder")
   @PreAuthorize("isAuthenticated()")
    public ModelAndView oreder(Principal principal, Authentication authentication, HttpServletRequest req) throws Exception {
        ModelAndView mav = new ModelAndView();

        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");

       if (authentication.getAuthorities().size() == 2) {
           String ordStrtDt = req.getParameter("ordStrtDt");
           String ordEndDt = req.getParameter("ordEndDt");
           String seType =  req.getParameter("seType");
           String itemNm =  req.getParameter("itemNm");

           Map mapOrder;
           try {
               mapOrder = mypageService.adminPeriodOrders(ordStrtDt, ordEndDt, seType, itemNm);

               mav.addObject("list", mapOrder.get("resultList"));
               mav.addObject("seType", seType);
               mav.addObject("className", "wrap mp-order");
               mav.addObject("cssFileList", styleFileList);
               mav.setViewName("mypage.mypageOrderAdmin");
           }
           catch (Exception e) {
               mav.addObject("msg", e.getMessage());
               mav.setViewName("accessError");
           }
       } else {
           long no = Long.parseLong(principal.getName());
           String ordStrtDt = req.getParameter("ordStrtDt");
           String ordEndDt = req.getParameter("ordEndDt");
           String seType =  req.getParameter("seType");
           String itemNm =  req.getParameter("itemNm");
           Map mapStatus = mypageService.orderStatus(no);

           log.info(mapStatus.get("resultList"));
           Map mapOrder;
           try {
               mapOrder = mypageService.periodOrders(no, ordStrtDt, ordEndDt, seType, itemNm);

               mav.addObject("list", mapOrder.get("resultList"));
               mav.addObject("status", mapStatus.get("resultList"));
               mav.addObject("seType", seType);
               mav.addObject("className", "wrap mp-order");
               mav.addObject("cssFileList", styleFileList);
               mav.setViewName("mypage.mypageOrder");
           }
           catch (Exception e) {
               mav.addObject("msg", e.getMessage());
               mav.setViewName("accessError");
           }
       }
        return mav;
    }


    @RequestMapping("mypageReturn")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView returnOrder(Principal principal, HttpServletRequest req) throws Exception {
        ModelAndView mav = new ModelAndView();

        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");

        long no = Long.parseLong(principal.getName());
        String ordStrtDt = req.getParameter("ordStrtDt");
        String ordEndDt = req.getParameter("ordEndDt");
        String seType =  req.getParameter("seType");
        String itemNm =  req.getParameter("itemNm");
        Map mapStatus = mypageService.orderStatus(no);

        log.info(mapStatus.get("resultList"));
        Map mapOrder;

        List<Map<String, Object>> list;
        try {
            list = mypageService.cancelperiodOrders(principal.getName(), ordStrtDt, ordEndDt, seType, itemNm);

            mav.addObject("list", list);
            mav.addObject("status", mapStatus.get("resultList"));
            mav.addObject("seType", seType);
            mav.addObject("className", "wrap mp-order");
            mav.addObject("cssFileList", styleFileList);
            mav.setViewName("mypage.mypageReturn");
        }
        catch (Exception e) {
            mav.addObject("msg", e.getMessage());
            mav.setViewName("accessError");
        }
        return mav;
    }

    // 마이페이지 쿠폰페이지 로그인 된 유저가 보유한 쿠폰 내역 조회
    @RequestMapping("mypageCoupon")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView coupon(Principal principal) throws Exception {

        log.info("coupon test");
        ModelAndView mav = new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");
        long no = Long.parseLong(principal.getName());

        try {
            Map map = mypageService.couponList(no);
            mav.addObject("list", map.get("resultList"));
            mav.addObject("className", "wrap mp-coupon");
            mav.addObject("cssFileList", styleFileList);
            mav.setViewName("mypage.mypageCoupon");
        }
        catch (Exception e) {
            mav.addObject("msg", e.getMessage());
            mav.setViewName("accessError");
        }
        return mav;
    }

    // 마이페이지 포인트페이지 로그인 된 유저가 보유한 포인트와 사용내역 조회
    @RequestMapping("mypagePoint")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView point(Principal principal,
                              HttpServletRequest req) throws Exception {

        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");

        String strtDt = req.getParameter("strtDt");
        String endDt = req.getParameter("endDt");
        String searchType =  req.getParameter("searchType");
        ModelAndView mav = new ModelAndView();

        List<Map<String,Object>> list = mypageService.pointList(principal.getName(), strtDt, endDt, searchType);
        log.info(list);
        mav.addObject("className", "wrap mp-point");
        mav.addObject("list", list);
        mav.addObject("searchType", searchType);
        mav.addObject("cssFileList", styleFileList);

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
    @PreAuthorize("isAuthenticated()")
    public ModelAndView update(Principal principal) throws Exception {
        log.info("update test");

        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");

        ModelAndView mav = new ModelAndView();
        UserVO userVO = userService.readPoint(Long.valueOf(principal.getName()));

        mav.addObject("userVO", userVO);
        mav.addObject("cssFileList", styleFileList);
        mav.setViewName("mypage.mypageUpdate");

        return mav;
    }


    @RequestMapping("mypageDelivery")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView delivery(Principal principal) throws Exception {
        log.info("delivery test");

        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");

        ModelAndView mav = new ModelAndView();

        long no = Long.parseLong(principal.getName());
        Map map = mypageService.deliveryList(no);

        log.info(map.get("resultList"));

        mav.addObject("list", map.get("resultList"));
        mav.addObject("cssFileList", styleFileList);
        mav.setViewName("mypage.mypageDelivery");

        return mav;
    }
    @ResponseBody
    @GetMapping("deliveryList")
    public ResponseEntity<Object> deliveryList(Principal principal) throws Exception {

        ResponseEntity<Object> entity = null;

        long no = Long.parseLong(principal.getName());

        Map map = mypageService.deliveryList(no);

        log.info(map.get("resultList").getClass().getSimpleName());

        entity = new ResponseEntity<>(map.get("resultList"), HttpStatus.OK);

        return entity;
    }

    @ResponseBody
    @GetMapping("deleteDelivery")
    public ResponseEntity<Object> deleteDelivery(@RequestParam("adno") long adno) throws Exception {

        ResponseEntity<Object> entity = null;

        int result = mypageService.deleteDelivery(adno);

        try {
            if (result == 1) entity = new ResponseEntity<>("delSuccess", HttpStatus.OK);
        }
        catch (Exception e) {
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    @ResponseBody
    @GetMapping("baseDelivery")
    public ResponseEntity<Object> baseDelivery(@RequestParam("adno") long adno) throws Exception {

        ResponseEntity<Object> entity = null;
        mypageService.baseDelivery(adno);

        try {
            entity = new ResponseEntity<>("baseSuccess", HttpStatus.OK);
        }
        catch (Exception e) {
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }


    @RequestMapping("mypageLeave")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView drop(Principal principal) {
        log.info("update test");

        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");

        ModelAndView mav = new ModelAndView();

        mav.addObject("cssFileList", styleFileList);
        mav.setViewName("mypage.mypageLeave");
        return mav;
    }

    // 마이페이지 예치금페이지 로그인 된 유저가 보유한 예치금과 사용내역 조회
    @RequestMapping("mypageDeposit")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView deposit(Principal principal,
                                HttpServletRequest req) throws Exception{
        log.info("deposit test");

        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");

        String strtDt = req.getParameter("strtDt");
        String endDt = req.getParameter("endDt");
        String searchType =  req.getParameter("searchType");

        ModelAndView mav = new ModelAndView();

        List<DepositVO> depositVO  = mypageService.depositList(principal.getName(), strtDt, endDt, searchType);
        log.info(depositVO);
        mav.addObject("depositVO", depositVO);
        mav.addObject("cssFileList", styleFileList);
        mav.addObject("searchType", searchType);
        mav.setViewName("mypage.mypageDeposit");

        return mav;
    }

    // 주문 취소 페이지
    @GetMapping("mypageOrderCancel")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView cancel(@RequestParam("order_seq") long order_seq, Principal principal) throws Exception {
        log.info("ordercancel test");
        log.info(order_seq);

        ModelAndView mav = new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");

        Map map = mypageService.detailOrders(Long.parseLong(principal.getName()), order_seq);
        log.info(map.get("resultList"));
        mav.addObject("list", map.get("resultList"));
        mav.addObject("className", "wrap mp-order-cancel");


        mav.addObject("cssFileList", styleFileList);
        mav.setViewName("mypage.mypageOrderCancel");

        return mav;
    }

    // 마이페이지 회원 정보 수정 비밀번호 모달창 수정시 이동하는 컨트롤러
    @ResponseBody
    @PostMapping("myPage_pwUpdate")
    public ResponseEntity<String> myPage_pwUpate(@RequestParam("oldPassword") String oldPassword,
                                                 @RequestParam("newPassword") String newPassword,
                                                 @RequestParam("userPassword") String userPassword,
                                                 @RequestParam("userid") String userid) throws Exception {
        log.info("비번 변경 도착");
        log.info("비밀번호 변경 파라미터 확인 : " + oldPassword + " " + newPassword);

        ResponseEntity<String> entity = null;

        boolean result = pwencoder.matches(oldPassword, userPassword);
        try {
            if (result) {
                String password = pwencoder.encode(newPassword);
                int udresult = userService.myPage_pwUpate(password, userid);
                if(udresult == 1) entity = new ResponseEntity<String>("success", HttpStatus.OK);
            } else {
                entity = new ResponseEntity<String>("discode", HttpStatus.OK);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    // 마이페이지 회원 정보 수정 닉네임 모달창 등록시 이동하는 컨트롤러
    @ResponseBody
    @PostMapping("myPage_newNickname")
    public ResponseEntity<String> myPage_newNickname(@RequestParam("user_nickname") String user_nickname, @RequestParam("user_id") String user_id,
                                   UserVO userVO) throws Exception{
        ResponseEntity<String> entity = null;
        userVO.setUser_nickname(user_nickname);

        log.info("닉네임 변경 도착");
        log.info(user_nickname);
        log.info(user_id);
        try {
            userService.myPage_newNickname(userVO);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        log.info(entity);
        return entity;
    }

    // 마이페이지 회원 정보 수정한 것을 다시 보여주기 위해 user정보를 조회하는 컨트롤러
    @RequestMapping(value = "getUserInfo")
    public ResponseEntity<List<UserVO>> list(Principal principal) throws Exception{
        log.info("getUserInfo Mapping 완료");

        ResponseEntity<List<UserVO>> entity = null;

        entity = new ResponseEntity<List<UserVO>>(userService.getUserinfo(Long.parseLong(principal.getName())),HttpStatus.OK);
        log.info(entity);
        return entity;
    }

    // 마이페이지 회원정보 수정 닉네임 모달창에서 중복확인 컨트롤러
    @ResponseBody
    @GetMapping("mypageNknmChk")
    public ResponseEntity<String> niknameCheck(@RequestParam("tmpNknm") String tmpNknm) throws Exception {
        ResponseEntity<String> entity = null;

        int count = mypageService.niknameCheck(tmpNknm);

        if(count == 0) {
            entity = new ResponseEntity<String>("00", HttpStatus.OK);
        }
        else {
            entity = new ResponseEntity<String>("01", HttpStatus.OK);
        }

        return entity;
    }

    // 마이페이지 회원정보 수정 생일 모달창에서 수정시 이동하는 컨트롤러
    @ResponseBody
    @PostMapping("myPage_newBirthday")
    public ResponseEntity<String> myPage_newBirthday(@RequestParam("birthday") String birthday, @RequestParam("user_id") String user_id,
                                                     UserVO userVO) throws Exception{

        ResponseEntity<String> entity = null;

        log.info("생년월일 변경 도착");
        log.info(birthday);
        log.info(user_id);

        try {
            userService.myPage_newBirthday(birthday, user_id);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        }catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    // 마이페이지 회원정보 수정 성별, 이메일, 문자 체크여부 수정하는 컨트롤러
    @ResponseBody
    @PostMapping("checkUpdate")
    public ResponseEntity<String> checkUpdate (@RequestParam("emaailval") String emaailval,
                                               @RequestParam("smsval") String smsval,
                                               @RequestParam("genderval") String genderval,
                                               @RequestParam("userid") String userid,
                                               Principal principal, UserVO userVO) throws Exception {
        ResponseEntity<String> entity = null;

        userVO.setUser_email_receive(emaailval);
        userVO.setUser_sms_receive(smsval);
        userVO.setUser_gender(genderval);

        try {
            mypageService.checkUpdate(emaailval, smsval, genderval, userid);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        }
        catch (Exception e) {
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    @RequestMapping(value = "drop_user", method = RequestMethod.POST)
    public String DropUser(UserVO userVO, HttpServletResponse response) throws Exception{
        log.info("회원정보 삭제 컨트롤러 도착");
        log.info(userVO.getNo());
        mypageService.DropUser(userVO.getNo());
        Cookie kc = new Cookie("JSESSIONID",null);
        kc.setMaxAge(0);
        response.addCookie(kc);
        return "redirect:/";
    }

    // 마이페이지 배송지등록 페이지 추가 버튼 팝업창 컨트롤러
    @GetMapping("openDeliveryAppendPup")
    public ModelAndView openOrderListPup(Principal principal) throws Exception {
        ModelAndView mav = new ModelAndView();
        log.info("openDeliveryAppendPup  접속");

        mav.setViewName("layerPup/openDeliveryAppendPup.empty");
        return mav;
    }
}
