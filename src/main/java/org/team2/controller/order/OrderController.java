package org.team2.controller.order;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.team2.domain.OrderVO;

//create:post, read:get, update:put, delete:delete

@RestController
public class OrderController {

    @GetMapping(value="/getOrderVO")
    public OrderVO getOrderVO(){
        return new OrderVO();
    }


}
