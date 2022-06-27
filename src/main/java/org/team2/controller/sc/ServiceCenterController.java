package org.team2.controller.sc;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.NoticeVO;
import org.team2.domain.QaVO;
import org.team2.domain.QnAVO;
import org.team2.service.NoticeService;
import org.team2.service.QnAService;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/customer")
public class ServiceCenterController {

    private QnAService qnaService;
    private NoticeService noticeService;

    @GetMapping("")
    public ModelAndView main() throws Exception {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("customer.servicePage");
        //css파일 적용
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("customer");
        List<NoticeVO> noticeList=noticeService.read();
        log.info(noticeList);
        mav.addObject("noticeList", noticeList);
        mav.addObject("cssFileList", styleFileList);
        return mav;
    }

    @GetMapping("faqList")
    public String faqList(){
        return "customer.faqList";
    }

    @GetMapping("noticeList")
    public ModelAndView noticeList() throws Exception {
        log.info("notice list controller connect...,");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("customer.noticeList");

        List<NoticeVO> noticeList=noticeService.read();
        log.info(noticeList);
        mav.addObject("noticeList", noticeList);
        return mav;
    }

    @GetMapping("inquiryPage")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView inquiryPage() throws Exception {
        ModelAndView mav=new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("customer");
        styleFileList.add("mypage");


        log.info("1:1 문의하기 게시판 이동");
        List<Map<String, String>> qnaList=qnaService.getQnAList();
        log.info(qnaList);
        mav.addObject("qnaList", qnaList);
        mav.addObject("cssFileList", styleFileList);
        mav.addObject("className","wrap consult-main");
        mav.setViewName("customer.inquiryPage");
        return mav;
    }

    @GetMapping("myInquiryPage")
    @PreAuthorize("isAuthenticated()")
    public ModelAndView myInquiryPage(Principal principal) throws Exception {
        ModelAndView mav=new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("customer");
        styleFileList.add("mypage");


        log.info("My 1:1 문의하기 게시판 이동");
        List<Map<String, String>> myQnaList=qnaService.getMyQnAList(Long.valueOf(principal.getName()));
        log.info(myQnaList);
        mav.addObject("myQnaList", myQnaList);
        mav.addObject("cssFileList", styleFileList);
        mav.addObject("className","wrap consult-main");
        mav.setViewName("customer.myInquiryPage");
        return mav;
    }

    @GetMapping("writeInquiryPage")
    public ModelAndView writeInquiryPage(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("customer.writeInquiryPage");

        return mav;
    }

    @PostMapping("registerQnA")
    public ModelAndView registerQnA(QnAVO vo, Principal principal) throws Exception {
        ModelAndView mav=new ModelAndView();
        log.info("매핑 이동 확인");
        log.info(vo.toString());
        Long user_seq= Long.valueOf(principal.getName());
        try{
            vo.setUser_seq(user_seq);
            qnaService.registerQnA(vo);
            mav.setViewName("customer.inquiryPage");
        }catch (Exception e){
            e.printStackTrace();
        }
        return mav;
    }

    @ResponseBody
    @PostMapping("addReply")
    public ModelAndView addReply(@RequestBody QaVO vo){
        ModelAndView mav=new ModelAndView();
        log.info("매핑 이동 확인");
        log.info(vo.toString());
        try{
            qnaService.addReply(vo);
            mav.setViewName("customer.inquiryPage");
        }catch (Exception e){
            e.printStackTrace();
        }
        return mav;
    }
}