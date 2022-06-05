package org.team2.controller.exhibit;

import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.ExhibitVO;
import org.team2.service.ExhibitService;

import java.util.ArrayList;
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
    @PostMapping("euro_exhibit")
    public ModelAndView euro_exhibit(ExhibitVO exhibitVO) throws Exception{
        log.info("euro_exhibit 컨트롤러 도착");
        log.info(exhibitVO.getExhibit_num());
        ModelAndView mav =  new ModelAndView();
        List<Map<Integer,Object>> list = exhibitService.euro_exhibit(String.valueOf(exhibitVO.getExhibit_num()));
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
    @RequestMapping("lowCost_exhibit")
    public void lowCost_exhibit(@RequestParam("exhibit_num") String exhibit_num) throws Exception{
        log.info("낮은 가격순 컨트롤러 도착");
        log.info(exhibit_num);
    }

    @ResponseBody
    @RequestMapping("cosmetics")
    public ModelAndView cosmetics(ExhibitVO exhibitVO) throws Exception{
        log.info("미백순수 기획전 컨트롤러 도착");
        log.info(exhibitVO.getExhibit_num());
        ModelAndView mav = new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("display");
        mav.addObject("cssFileList", styleFileList);
        mav.addObject("className","exhibition-wrap");
        mav.setViewName("exhibition.cosmetics");
        return mav;
    }

}
