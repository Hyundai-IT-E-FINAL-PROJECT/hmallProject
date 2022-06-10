package org.team2.controller.funding;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.FundVO;
import org.team2.domain.RewardVO;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/fund")
public class FundingController {

    @GetMapping( "main")
    public ModelAndView openOrderCompletePage(){
        log.info("fundingMain 접속");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("funding.fundingMain");
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("search");
        styleFileList.add("display");
        styleFileList.add("prd-list");

        mav.addObject("cssFileList", styleFileList);
        mav.addObject("className", "wrap display-3depth");
        return mav;
    }

    @GetMapping( "detail")
    public ModelAndView openFundingDetail(){
        log.info("fundingMain 접속");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("funding.fundingDetail");
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("search");
        styleFileList.add("display");
        styleFileList.add("prd-list");

        mav.addObject("cssFileList", styleFileList);
        mav.addObject("className", "wrap display-3depth");
        return mav;
    }

    @GetMapping("create")
    public ModelAndView openFundingCreate(){
        log.info("FundingCreate 접속");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("funding.fundingCreate");
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("search");
        styleFileList.add("display");
        styleFileList.add("prd-list");
        mav.addObject("cssFileList", styleFileList);
        mav.addObject("className","common_sub_layout");
        return mav;
    }
    @ResponseBody
    @PostMapping("insertFund")
    public void insertFund(@ModelAttribute FundVO fundVO, @ModelAttribute RewardVO rewardVO,
                           @RequestParam(value = "fund_reward_titleList[]") List<String> fund_reward_titleList,
                           Principal principal) throws Exception{
        log.info(principal.getName());
        log.info(rewardVO.toString());
        log.info(fundVO.toString());
        log.info(fund_reward_titleList.toString());
        log.info(fund_reward_titleList.size());
//        log.info(fund_reward_title);
//        log.info(fund_reward_count.toString());
    }
}
