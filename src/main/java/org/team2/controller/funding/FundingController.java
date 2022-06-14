package org.team2.controller.funding;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import oracle.ucp.proxy.annotation.Post;
import org.json.JSONArray;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.*;
import org.team2.domain.FundReplyVO;
import org.team2.domain.FundVO;
import org.team2.domain.RewardVO;
import org.team2.service.AwsS3Biz;
import org.team2.service.FundingService;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@Log4j
@NoArgsConstructor
@AllArgsConstructor
@RequestMapping("/fund")
public class FundingController {

    @Setter(onMethod_ = @Autowired)
    private FundingService fundingService;

    @Setter(onMethod_ = @Autowired)
    private AwsS3Biz s3Service;

    @Value("${aws.accesskey}")
    private String accessKey;

    private static final Logger logger = LoggerFactory.getLogger(FundingController.class);


    @GetMapping( "main")
    public ModelAndView openOrderCompletePage(@ModelAttribute FundVO fundVO) throws Exception{
        log.info("fundingMain 접속");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("funding.fundingMain");
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("search");
        styleFileList.add("display");
        styleFileList.add("prd-list");
        styleFileList.add("product");
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
        //내가 참여한 펀딩 불러오기
        List<Map<String, Object>> participateFund=fundingService.participatedFund(Long.valueOf(principal.getName()));
        log.info(participateFund);

        log.info("user's :"+userFundProject);
        log.info("admin's :"+adminAllProjdct);
        mav.addObject("userFundProject",userFundProject);
        mav.addObject("adminAllProjdct",adminAllProjdct);
        mav.addObject("participateFund",participateFund);
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
//
//        log.info("----------파일 정보----------");
////        log.info(attachFileVO.getFileName());
////        log.info(attachFileVO.getUuid());
////        log.info(attachFileVO.getUploadPath());
//        log.info("----------파일 정보----------");
        try {
            fundingService.insertFunding(fundVO);
            rewardVO.setFund_product_seq(fundVO.getFund_product_seq());
//            attachFileVO.setFund_product_seq(fundVO.getFund_product_seq());
//            fundingService.insertFile(attachFileVO);
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
    @PostMapping("fundingProcess")
    public void fundingProcess(@ModelAttribute RewardVO rewardVO,
                                @ModelAttribute FundParticipantsVO fundParticipantsVO,
                                Principal principal){
        log.info("fundingProcess...");
        fundParticipantsVO.setUser_seq(Long.valueOf(principal.getName()));

        try {
            fundingService.fundingProcess(rewardVO,fundParticipantsVO);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

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

    @ResponseBody
    @RequestMapping("deleteReply")
    public ResponseEntity<String> deleteReply(@RequestParam("delete_seq") int delete_seq) throws Exception{
        ResponseEntity<String> entity = null;

        log.info("댓글 삭제 컨트롤러 도착 !");
        log.info(delete_seq);
        try {
            fundingService.deleteReply(delete_seq);
            entity = new ResponseEntity<String>("1", HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            entity = new ResponseEntity<String>("0", HttpStatus.OK);
        }
        return entity;
    }

    @ResponseBody
    @RequestMapping("insertInfo")
    public ResponseEntity<List<Map<String, Object>>> insertInfo(@RequestParam("fund_board_seq_info") int fund_board_seq_info,
                                                                 @RequestParam("user_seq_info") int user_seq_info,
                                                                 @RequestParam("fund_reply_content_info") String fund_reply_content_info,
                                                                 @ModelAttribute FundNoticeVO fundNoticeVO) throws Exception{

        log.info("펀딩 상품 공지 삽입 컨트롤러 도착 !");
        log.info(fund_board_seq_info+" "+user_seq_info+" "+fund_reply_content_info);
        fundNoticeVO.setUser_seq(user_seq_info);
        fundNoticeVO.setFund_product_seq(fund_board_seq_info);
        fundNoticeVO.setFund_notice_content(fund_reply_content_info);
        fundingService.insertNotice(fundNoticeVO);
        List<Map<String,Object>> info_list = fundingService.selectInfo(fundNoticeVO);
        log.info(info_list.toString());
        return ResponseEntity.ok().body(info_list);
    }

    @ResponseBody
    @RequestMapping("selectInfo")
    public ResponseEntity<List<Map<String, Object>>> selectInfo(@RequestParam("fund_board_seq_info") int fund_board_seq_info,
                                                                 @RequestParam("user_seq_info") int user_seq_info,
                                                                 @ModelAttribute FundNoticeVO fundNoticeVO) throws Exception{

        log.info("공지 출력 컨트롤러 도착 !");
        log.info(fund_board_seq_info+" "+user_seq_info);
        fundNoticeVO.setUser_seq(user_seq_info);
        fundNoticeVO.setFund_product_seq(fund_board_seq_info);
//        삽입 되어있는 댓글 리스트 불러오기
        List<Map<String,Object>> info_list = fundingService.selectInfo(fundNoticeVO);
        log.info(info_list.toString());
        log.info("select 성공");
        return ResponseEntity.ok().body(info_list);
    }

    @ResponseBody
    @RequestMapping("deleteInfo")
    public ResponseEntity<String> deleteInfo(@RequestParam("delete_seq") int delete_seq) throws Exception{
        ResponseEntity<String> entity = null;

        log.info("댓글 삭제 컨트롤러 도착 !");
        log.info(delete_seq);
        try {
            fundingService.deleteInfo(delete_seq);
            entity = new ResponseEntity<String>("1", HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            entity = new ResponseEntity<String>("0", HttpStatus.OK);
        }
        return entity;
    }
    
    @ResponseBody
    @RequestMapping("selectDate")
    public ResponseEntity<List<Map<String, Object>>> selectDate(@RequestParam("product_seq") int product_seq ) throws Exception{
        log.info("날짜 가져오기 컨트롤러 도착 !");
        log.info("상품 시퀀스 : "+product_seq);
        List<Map<String,Object>> date_list = fundingService.selectDate(product_seq);
        log.info(date_list.toString());
        return ResponseEntity.ok().body(date_list);
    }

    private boolean checkImageType(File file) {
        try {
            String contentType = Files.probeContentType(file.toPath());
            return contentType.startsWith("image");
        }catch(IOException e){
            e.printStackTrace();
        }
        return false;
    }


    private String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);

        return str.replace("-",File.separator);
    }

    @GetMapping("display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName){
        log.info("fileName: "+fileName);
        File file = new File("C:\\upload"+fileName);
        log.info("file: "+file);

        ResponseEntity<byte[]> result = null;

        try {
            HttpHeaders header = new HttpHeaders();
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
        }catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }


    @PostMapping(value = "uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String uploadAjaxPost(MultipartFile file, HttpServletRequest request) throws Exception{

        String originalFileName = file.getOriginalFilename();

        // ========= 파일명 중복 방지 처리 ========= //
        String uuidFileName = getUuidFileName(originalFileName);


        String res = s3Service.uploadObject(file, uuidFileName);
        log.info(res);
//        return "https://hmallbucket.s3.ap-northeast-2.amazonaws.com/+mainImage/"+uuidFileName;
        return uuidFileName;
    }


    private static String getUuidFileName(String originalFileName) {
        return UUID.randomUUID().toString() + "_" + originalFileName;
    }



}
