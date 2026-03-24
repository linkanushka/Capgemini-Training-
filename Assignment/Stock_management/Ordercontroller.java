package com.example.stock.controller;

import com.example.stock.entity.Order;
import com.example.stock.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private OrderService service;

    @PostMapping("/bill")
    public Order generate(@RequestBody Map<Integer, Integer> cart) {
        return service.generateBill(cart);
    }
}
