package com.example.stock.service;

import com.example.stock.entity.Order;
import com.example.stock.entity.Product;
import com.example.stock.repository.OrderRepository;
import com.example.stock.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class OrderService {

    @Autowired
    private ProductRepository productRepo;

    @Autowired
    private OrderRepository orderRepo;

    public Order generateBill(Map<Integer, Integer> cart) {

        double total = 0;

        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
            Product p = productRepo.findById(entry.getKey()).get();

            int qty = entry.getValue();

            p.setQuantity(p.getQuantity() - qty);
            productRepo.save(p);

            total += p.getPrice() * qty;
        }

        double gst = total * 0.18;

        Order order = new Order();
        order.setTotalPrice(total);
        order.setTotalPriceWithGst(total + gst);

        return orderRepo.save(order);
    }
}
