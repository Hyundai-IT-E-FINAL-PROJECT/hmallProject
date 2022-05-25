package org.team2.controller.product;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.team2.domain.CategoryVO;
import org.team2.domain.ProductVO;
import org.team2.service.ProductService;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/product/*")
public class ProductController {

    @Setter(onMethod_ = @Autowired)
    private ProductService productService;


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
    public void detail(){
        log.info("sample detail start!!");
    }
}
