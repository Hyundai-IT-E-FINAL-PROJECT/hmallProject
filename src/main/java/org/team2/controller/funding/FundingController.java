package org.team2.controller.funding;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.FundVO;
import org.team2.domain.RewardVO;
import org.team2.service.FundingService;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/fund")
public class FundingController {

    @Setter(onMethod_ = @Autowired)
    private FundingService fundingService;

    @GetMapping( "main")
    public ModelAndView openOrderCompletePage(@ModelAttribute FundVO fundVO) throws Exception{
        log.info("fundingMain 접속");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("funding.fundingMain");
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("search");
        styleFileList.add("display");
        styleFileList.add("prd-list");
        List<Map<Integer,Object>> list = fundingService.readFundingProduct(fundVO);
        log.info(list.toString());
//        펀딩 리스트 불러오기
        mav.addObject("list",list);
        mav.addObject("cssFileList", styleFileList);
        mav.addObject("className", "wrap display-3depth");
        return mav;
    }

    @GetMapping("myFunding")
    public ModelAndView openMyFunding(Principal principal) throws Exception {
        log.info("myFunding 접속");
        ModelAndView mav = new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("search");
        styleFileList.add("display");
        styleFileList.add("prd-list");
        styleFileList.add("mypage");
        mav.setViewName("mypage.myFunding");
        
        
        //내 펀딩 프로젝트 가져오기
        List<FundVO> userFundProject=fundingService.getUserFund(Long.valueOf(principal.getName()));

        log.info(userFundProject);
        mav.addObject("userFundProject",userFundProject);
        mav.addObject("cssFileList", styleFileList);
        mav.addObject("className", "wrap display-3depth");
        return mav;
    }

    @ResponseBody
    @GetMapping("delete/{fund_product_seq}")
    public void deleteMyFunding(@PathVariable("fund_product_seq") String fund_product_seq){
        log.info("deleteMyFunding 접속");
        //내 펀딩 삭제하기
        try{
            fundingService.deleteUserFund(Long.valueOf(fund_product_seq));
        }catch (Exception e){
            e.printStackTrace();
        }

    }



    @ResponseBody
    @GetMapping("detail/{fund_product_seq}")
    public ModelAndView openFundingDetail(@ModelAttribute FundVO fundVO, @ModelAttribute RewardVO rewardVO,
                                          @PathVariable("fund_product_seq") int fund_product_seq ,Principal principal) throws Exception{
        log.info("fundingDetail 접속");
        log.info(fund_product_seq);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("funding.fundingDetail");
        List<String> styleFileList = new ArrayList<>();
        List<Map<Integer,Object>> list = fundingService.readFundigProductDetail(fund_product_seq);
        log.info(list.toString());
        styleFileList.add("search");
        styleFileList.add("display");
        styleFileList.add("prd-list");

        mav.addObject("list",list);
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
                           @RequestParam(value = "fund_reward_countList[]") List<String> fund_reward_countList,
                           Principal principal) throws Exception{
        log.info(principal.getName());
        log.info(rewardVO.toString());
        log.info(fundVO.toString());
        log.info(fund_reward_titleList.toString());
        log.info(fund_reward_countList.toString());
        fundVO.setNo(Integer.parseInt(principal.getName()));
        try {
            fundingService.insertFunding(fundVO);
            rewardVO.setFund_product_seq(fundVO.getFund_product_seq());
            log.info(fundVO.getFund_product_seq());
            log.info(rewardVO.getFund_product_seq());
            for(int a = 0 ; a < fund_reward_countList.size() ; a++){
                rewardVO.setFund_reward_title(fund_reward_titleList.get(a));
                rewardVO.setFund_reward_count(fund_reward_countList.get(a));
                fundingService.insertReward(rewardVO);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }


}
