package org.team2.controller.sc;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.QaVO;
import org.team2.domain.QnAVO;
import org.team2.service.QnAService;

import java.util.List;
import java.util.Map;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/customer")
public class ServiceCenterController {

    private QnAService qnaService;

    @GetMapping("")
    public String cart() {
//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("customer.servicePage");
        return "customer.servicePage";
    }

    @GetMapping("faqList")
    public String faqList(){
        return "customer.faqList";
    }

    @GetMapping("noticeList")
    public String noticeList(){
        return "customer.noticeList";
    }

    @GetMapping("inquiryPage")
    public ModelAndView inquiryPage() throws Exception {
        ModelAndView mav=new ModelAndView();

        log.info("1:1 문의하기 게시판 이동");
        List<Map<String, String>> qnaList=qnaService.getQnAList();
        log.info(qnaList);
        mav.addObject("qnaList", qnaList);
        mav.setViewName("customer.inquiryPage");
        return mav;
    }

    @GetMapping("writeInquiryPage")
    public ModelAndView writeInquiryPage(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("customer.writeInquiryPage");

        return mav;
    }

    @PostMapping("registerQnA")
    public ModelAndView registerQnA(QnAVO vo) throws Exception {
        ModelAndView mav=new ModelAndView();
        log.info("매핑 이동 확인");
        log.info(vo.toString());
        try{
            vo.setUser_seq(41L);
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
            //qnaService.addReply(vo);
            mav.setViewName("customer.inquiryPage");
        }catch (Exception e){
            e.printStackTrace();
        }
        return mav;
    }
}