package org.team2.controller.mypage;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team2.domain.DepositVO;
import org.team2.domain.CustomUser;
import org.team2.domain.UserVO;
import org.team2.service.ExhibitService;
import org.team2.service.MypageService;
import org.team2.service.UserService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@Log4j
public class MypageController {


    @Setter(onMethod_ = @Autowired)
    private MypageService mypageService;

    @Setter(onMethod_ = @Autowired)
    private UserService userService;

    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder pwencoder;

    public Date date;
    @RequestMapping("/mypage")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView mypage(Principal principal, @AuthenticationPrincipal UserVO vo) throws Exception {

        log.info("tiles test");
        ModelAndView mav = new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");

        long no = Long.parseLong(principal.getName());

        try {
            Map map = mypageService.recentOrders(no);
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
    public ModelAndView oreder(Principal principal, HttpServletRequest req, @RequestParam("type") String type) {
        ModelAndView mav = new ModelAndView();

        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");

        long no = Long.parseLong(principal.getName());
        String ordStrtDt = req.getParameter("ordStrtDt");
        String ordEndDt = req.getParameter("ordEndDt");
        String seType =  req.getParameter("seType");
        String itemNm =  req.getParameter("itemNm");

        Map map;
        try {
            map = mypageService.periodOrders(no, ordStrtDt, ordEndDt, seType, itemNm);
//            if (type.equals("all"))  {
//
//            }
//            else{
//                list = mypageService.cancelperiodOrders(principal.getName(), ordStrtDt, ordEndDt, seType, itemNm, type);
//            }
            mav.addObject("list", map.get("resultList"));
            mav.addObject("seType", seType);
            mav.addObject("className", "wrap mp-order");
            mav.addObject("cssFileList", styleFileList);
            mav.addObject("type", type);
            mav.setViewName("mypage.mypageOrder");
        }
        catch (Exception e) {
            mav.addObject("msg", e.getMessage());
            mav.setViewName("accessError");
        }
        return mav;
    }


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
    public ModelAndView update() {
        log.info("update test");

        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");

        ModelAndView mav = new ModelAndView();
        mav.addObject("cssFileList", styleFileList);
        mav.setViewName("mypage.mypageUpdate");

        return mav;
    }


    @RequestMapping("mypageDelivery")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView delivery() {
        log.info("delivery test");

        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");

        ModelAndView mav = new ModelAndView();
        mav.addObject("cssFileList", styleFileList);
        mav.setViewName("mypage.mypageDelivery");

        return mav;
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

    @RequestMapping("mypageOrderCancel")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView cancel() {
        log.info("ordercancel test");

        ModelAndView mav = new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("mypage");

        mav.addObject("cssFileList", styleFileList);
        mav.setViewName("mypage.mypageOrderCancel");

        return mav;
    }

    @ResponseBody
    @PostMapping("myPage_pwUpdate")
    public ResponseEntity<String> myPage_pwUpate(@RequestParam("oldPassword") String oldPassword,
                                                 @RequestParam("newPassword") String newPassword,
                                                 @RequestParam("userPassword") String userPassword,
                                                 UserVO userVO, Principal principal) throws Exception {
        log.info("비번 변경 도착");
        log.info("비밀번호 변경 파라미터 확인 : " + oldPassword + " " + newPassword);

        ResponseEntity<String> entity = null;

        boolean result = pwencoder.matches(oldPassword, userPassword);
        try {
            if (result) {
                String password = pwencoder.encode(newPassword);
                log.info(userVO);
                //userService.myPage_pwUpate(userVO);
                entity = new ResponseEntity<String>("success", HttpStatus.OK);
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

    @RequestMapping(value = "getUserInfo/{no}")
    public ResponseEntity<List<UserVO>> list(@PathVariable("no") long no) throws Exception{
        log.info("getUserInfo Mapping 완료");
        log.info(no);
        ResponseEntity<List<UserVO>> entity = null;
        List<UserVO> list_2 = userService.getUserinfo(no);
        log.info(list_2);
        entity = new ResponseEntity<List<UserVO>>(userService.getUserinfo(no),HttpStatus.OK);
        log.info(entity);
        return entity;
    }

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

    @ResponseBody
    @PostMapping("myPage_newBirthday")
    public void myPage_newBirthday(@RequestParam("user_birth") @DateTimeFormat(pattern = "yyyy-MM-dd") Date user_birth, @RequestParam("user_id") String user_id,
                                   UserVO userVO) throws Exception{
        log.info("생년월일 변경 도착");
        log.info(user_birth);
        log.info(user_id);

        try {
            userService.myPage_newBirthday(user_birth, user_id);
        }catch (Exception e) {
            e.printStackTrace();
        }
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
}
