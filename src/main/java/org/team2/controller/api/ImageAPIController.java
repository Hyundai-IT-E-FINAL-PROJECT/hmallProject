package org.team2.controller.api;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.team2.domain.ImageVO;
import org.team2.domain.ProductVO;
import org.team2.service.CategoryService;
import org.team2.service.ImageService;
import org.team2.service.ProductService;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/api/image/*")
public class ImageAPIController {
    @Setter(onMethod_ = @Autowired)
    private ImageService imageService;

    // restAPI
    @GetMapping(value = "/")
    public ResponseEntity<List<ImageVO>> getImageListByProductSeq(@RequestParam("product_seq") Long product_seq){
        log.info("image getImageListByProductSeq Controller");
        List<ImageVO> allByProductSeq = imageService.getAllByProductSeq(product_seq);

        HttpHeaders resHeader = new HttpHeaders();
        resHeader.add("Content-Type", "application/json; charset=UTF-8");

        return new ResponseEntity<>(allByProductSeq, resHeader, HttpStatus.OK);
    }
}
