package org.team2.controller.product;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.CategoryVO;
import org.team2.domain.ImageVO;
import org.team2.domain.ProductVO;
import org.team2.service.CategoryService;
import org.team2.service.ImageService;
import org.team2.service.ProductService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Log4j
@RequestMapping("/product/*")
public class ProductController {

    @Setter(onMethod_ = @Autowired)
    private ProductService productService;

    @Setter(onMethod_ = @Autowired)
    private ImageService imageService;

    @Setter(onMethod_ = @Autowired)
    private CategoryService categoryService;


    // restAPI
    @GetMapping(value = "/")
    public ResponseEntity<List<ProductVO>> getAll(){
        log.info("product getOne Controller");
        List<ProductVO> productVOS = productService.getAll();

        HttpHeaders resHeader = new HttpHeaders();
        resHeader.add("Content-Type", "application/json; charset=UTF-8");

        return new ResponseEntity<>(productVOS, resHeader, HttpStatus.OK);
    }
    @GetMapping(value = "/{seq}")
    public ResponseEntity<ProductVO> getOne(@PathVariable("seq") Long seq){
        ProductVO productVO = productService.getOne(seq);

        HttpHeaders resHeader = new HttpHeaders();
        resHeader.add("Content-Type", "application/json; charset=UTF-8");

        return new ResponseEntity<>(productVO, resHeader, HttpStatus.OK);
    }
    @GetMapping(value = "/main")
    public ResponseEntity<List<ProductVO>> getMain(){
        log.info("product main Controller");
        List<ProductVO> productVOS = productService.getMain();

        HttpHeaders resHeader = new HttpHeaders();
        resHeader.add("Content-Type", "application/json; charset=UTF-8");

        return new ResponseEntity<>(productVOS, resHeader, HttpStatus.OK);
    }
    @PostMapping(value = "/insert")
    public ResponseEntity<Integer> insert(@RequestBody ProductVO productVO) {
        log.info("product hum Controller");
        int insertResult = productService.insert(productVO);

        HttpHeaders resHeader = new HttpHeaders();
        resHeader.add("Content-Type", "application/json; charset=UTF-8");

        return new ResponseEntity<>(insertResult, resHeader, HttpStatus.OK);
    }
    @PutMapping(value = "/update")
    public ResponseEntity<Integer> update(@RequestBody ProductVO productVO) {
        log.info("product update Controller");
        int updateResult = productService.update(productVO);

        HttpHeaders resHeader = new HttpHeaders();
        resHeader.add("Content-Type", "application/json; charset=UTF-8");

        return new ResponseEntity<>(updateResult, resHeader, HttpStatus.OK);

    }
    @DeleteMapping(value = "/delete")
    public ResponseEntity<Integer> delete(@RequestParam ProductVO productVO) {
        int deleteResult = productService.delete(productVO);

        HttpHeaders resHeader = new HttpHeaders();
        resHeader.add("Content-Type", "application/json; charset=UTF-8");

        return new ResponseEntity<>(deleteResult, resHeader, HttpStatus.OK);
    }

    // frontAPI
    @RequestMapping("/detail")
    public ModelAndView detail(@RequestParam Long product_seq){
        log.info("product controller detail start!!");

        ProductVO productVO = productService.getOne(product_seq);
        List<ImageVO> allByProductSeq = imageService.getAllByProductSeq(product_seq);

        log.info(productVO.getProduct_name());

        ModelAndView mav = new ModelAndView();
        mav.addObject("productVO", productVO);
        mav.addObject("imageVOList",  allByProductSeq);

        mav.setViewName("product.detail");

        return mav;
    }
    @GetMapping("openOrderListPup")
    public ModelAndView openOrderListPup(){
        log.info("orderList Popup 접속");
        ModelAndView mav = new ModelAndView();

        List<Map<String, String>> userOrderList=productService.getUserOrder(41L);
        log.info(userOrderList);
        mav.addObject("userOrderList",userOrderList);
        mav.setViewName("layerPup/openOrderListPup.empty");
        return mav;
    }

    @ResponseBody
    @RequestMapping(value="getProductInfo", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<HashMap<String, String>> getProductInfo(@RequestParam Long order_seq){
        ResponseEntity<HashMap<String, String>> entity=null;
        HashMap<String, String> resultMap=new HashMap<>();

        log.info("getProductInfo Controller 접속");
        log.info(order_seq);
        Map<String, String> productInfo =productService.getProductInfo(order_seq);
//

//        //log.info(productInfo);
//        HashMap<String, String> info=new HashMap<>();
        resultMap.put("ORDER_SEQ",String.valueOf(productInfo.get("ORDER_SEQ")));
        resultMap.put("PRODUCT_CODE",String.valueOf(productInfo.get("PRODUCT_CODE")));

        entity=new ResponseEntity<HashMap<String ,String >>(resultMap, HttpStatus.OK);

        return entity;
    }

    @ResponseBody
    @PostMapping("getProduct")
    public ModelAndView getProduct(@RequestParam("product_seq") Long product_seq){
        log.info("getProduct 접속");
        ModelAndView mav = new ModelAndView();

        ProductVO vo=productService.getOne(product_seq);

        mav.addObject("ProductInfo",vo);
        log.info(vo);

        mav.setViewName("customer.writeInquiryPage");
        return mav;
    }

    @RequestMapping("/all")
    public ModelAndView all(@RequestParam("category_seq") Long category_seq){
        log.info("product controller all start!!");

        ModelAndView mav = new ModelAndView();
        List<String> styleFileList = new ArrayList<>();
        styleFileList.add("search");
        styleFileList.add("display");
        styleFileList.add("prd-list");


        List<ProductVO> allWithCouponByFirstCategory = productService.getAllWithCouponByFirstCategory(category_seq);
        CategoryVO categoryVO = categoryService.getOne(category_seq);
        List<CategoryVO> subCategoryList = categoryService.getSubCategoryList(category_seq);

        mav.setViewName("search.all");
        mav.addObject("productVOList", allWithCouponByFirstCategory);
        mav.addObject("categoryVO", categoryVO);
        mav.addObject("subCategoryList", subCategoryList);
        mav.addObject("className", "wrap display-3depth");
        mav.addObject("cssFileList", styleFileList);
        return mav;
    }
}
