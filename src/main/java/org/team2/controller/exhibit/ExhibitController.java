package org.team2.controller.exhibit;

import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.ExhibitVO;
import org.team2.service.ExhibitService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Setter;

@Log4j
@Controller
@RequestMapping("/exhibition")
public class ExhibitController {

    @Setter(onMethod_ = @Autowired)
    private ExhibitService exhibitService;

    @ResponseBody
    @RequestMapping("euro_exhibit")
    public ModelAndView euro_exhibit(@RequestParam("exhibit_num") String exhibit_num) throws Exception{
        log.info("euro_exhibit 컨트롤러 도착");
        log.info(exhibit_num);
        ModelAndView mav =  new ModelAndView();
        List<Map<Integer,Object>> list = exhibitService.euro_exhibit(exhibit_num);
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("display");
        log.info(list.get(0).toString());
        log.info(list.get(1).toString());
        mav.addObject("list",list);
        mav.addObject("cssFileList", styleFileList);
        mav.addObject("className","wrap display-exhibition exhibition-marketing");
        mav.setViewName("exhibition.euro_exhibit");
        return mav;
    }
    @ResponseBody
    @RequestMapping("sort_exhibit")
    public ResponseEntity<List<Map<String, Object>>> sort_exhibit(@RequestParam("exhibit_num") String exhibit_num, @RequestParam("sort_value") String sort_value) throws Exception{
        log.info("정렬 컨트롤러 도착");
        log.info(exhibit_num);
        log.info(sort_value);
        List<Map<String,Object>> list = exhibitService.sort_exhibit(exhibit_num, sort_value);
        log.info(list.toString());
        return ResponseEntity.ok().body(list);
    }

    @ResponseBody
    @RequestMapping("cosmetics")
    public ModelAndView cosmetics(ExhibitVO exhibitVO) throws Exception{
        log.info("미백순수 기획전 컨트롤러 도착");
        log.info(exhibitVO.getExhibit_num());
        ModelAndView mav = new ModelAndView();
        List<Map<Integer,Object>> list = exhibitService.cosmetics(String.valueOf(exhibitVO.getExhibit_num()));
        log.info(list.get(0).toString());
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("display");
        mav.addObject("list",list);
        mav.addObject("cssFileList", styleFileList);
        mav.addObject("className","exhibition-wrap");
        mav.setViewName("exhibition.cosmetics");
        return mav;
    }

    @ResponseBody
    @RequestMapping("hit")
    public ModelAndView hit_product(ExhibitVO exhibitVO) throws Exception{
        log.info("캐리어 기획전 컨트롤러 도착");
        ModelAndView mav = new ModelAndView();
        log.info(exhibitVO.getExhibit_num());
        List<String> styleFileList = new ArrayList<>();
        List<Map<Integer,Object>> list = exhibitService.hit_product(String.valueOf(exhibitVO.getExhibit_num()));
        styleFileList.add("display");
        mav.addObject("list",list);
        mav.addObject("cssFileList", styleFileList);
        mav.addObject("className","wrap display-exhibition exhibition-marketing");
        mav.setViewName("exhibition.hit");
        return mav;
    }

}
