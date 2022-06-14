package org.team2.controller.product;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.team2.domain.CategoryVO;
import org.team2.service.CategoryService;

import java.util.List;

@Log4j
@RequestMapping(value = "/category/*")
@CrossOrigin(maxAge = 3600)
@RestController
public class CategoryController {

    @Setter(onMethod_ = @Autowired)
    private CategoryService categoryService;

    @CrossOrigin(value = "http://localhost:8080/category/", methods = {RequestMethod.GET})
    @GetMapping(value = "/")
    public ResponseEntity<List<CategoryVO>> getAll(){
        List<CategoryVO> categoryVOS = categoryService.getAll();

        HttpHeaders resHeader = new HttpHeaders();
        resHeader.add("Content-Type", "application/json; charset=UTF-8");

        return new ResponseEntity<>(categoryVOS, resHeader, HttpStatus.OK);
    }

}
