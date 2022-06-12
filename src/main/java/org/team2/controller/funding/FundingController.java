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
import org.team2.domain.FundReplyVO;
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
        List<FundVO> adminAllProjdct=fundingService.getAllFund();

        log.info("user's :"+userFundProject);
        log.info("admin's :"+adminAllProjdct);
        mav.addObject("userFundProject",userFundProject);
        mav.addObject("adminAllProjdct",adminAllProjdct);
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
    @GetMapping("update/{fund_product_seq}")
    public void updateFundStatus(@PathVariable("fund_product_seq") String fund_product_seq){
        log.info("updateFundStatus 접속");
        //대기중인 펀딩 수락하기
        try{
            fundingService.updateFundStatus(Long.valueOf(fund_product_seq));
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
                           @RequestParam(value = "fund_reward_costList[]") List<String> fund_reward_costList,
                           @RequestParam(value = "fund_reward_contentList[]") List<String> fund_reawrd_contentList,
                           @RequestParam(value = "fund_reward_countList[]") List<String> fund_reward_countList,
                           Principal principal) throws Exception{
        log.info("펀딩 상품 및 리워드 insert !!");
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
                rewardVO.setFund_reward_cost(Integer.parseInt(fund_reward_costList.get(a)));
                rewardVO.setFund_reward_content(fund_reawrd_contentList.get(a));
                rewardVO.setFund_reward_count(Integer.parseInt(fund_reward_countList.get(a)));
                fundingService.insertReward(rewardVO);
            }
        }catch (Exception e){
            e.printStackTrace(
            );
        }
    }

    @ResponseBody
    @RequestMapping("insertReply")
    public ResponseEntity<List<Map<String, Object>>> insertReply(@RequestParam("fund_board_seq") int fund_board_seq,
                           @RequestParam("user_seq") int user_seq,
                           @RequestParam("fund_reply_content_num") String fund_reply_content,
                           @ModelAttribute FundReplyVO fundReplyVO) throws Exception{

        log.info("댓글 삽입 컨트롤러 도착 !");
        log.info(fund_board_seq+" "+user_seq+" "+fund_reply_content);
        fundReplyVO.setUser_seq(user_seq);
        fundReplyVO.setFund_product_seq(fund_board_seq);
        fundReplyVO.setFund_reply_content(fund_reply_content);
        fundingService.insertReply(fundReplyVO);
        List<Map<String,Object>> reply_list = fundingService.selectReply(fundReplyVO);
        log.info(reply_list.toString());
        return ResponseEntity.ok().body(reply_list);
    }

    @ResponseBody
    @RequestMapping("selectReply")
    public ResponseEntity<List<Map<String, Object>>> selectReply(@RequestParam("board_num") int board_num,
                                                                 @RequestParam("user_num") int user_num,
                                                                 @ModelAttribute FundReplyVO fundReplyVO) throws Exception{

        log.info("댓글 출력 컨트롤러 도착 !");
        log.info(board_num+" "+user_num);
        fundReplyVO.setUser_seq(user_num);
        fundReplyVO.setFund_product_seq(board_num);
//        삽입 되어있는 댓글 리스트 불러오기
        List<Map<String,Object>> reply_list = fundingService.selectReply(fundReplyVO);
        log.info(reply_list.toString());
        log.info("select 성공");
        return ResponseEntity.ok().body(reply_list);
    }
}
