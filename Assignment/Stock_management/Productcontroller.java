package com.example.stock.controller;

import com.example.stock.entity.Product;
import com.example.stock.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductRepository repo;

    @PostMapping
    public Product add(@RequestBody Product p) {
        return repo.save(p);
    }

    @GetMapping
    public List<Product> getAll() {
        return repo.findAll();
    }

    @GetMapping("/search")
    public List<Product> search(@RequestParam String name) {
        return repo.findByNameContaining(name);
    }

    @PutMapping("/{id}")
    public Product update(@PathVariable int id, @RequestBody Product p) {
        Product old = repo.findById(id).get();
        old.setName(p.getName());
        old.setQuantity(p.getQuantity());
        old.setPrice(p.getPrice());
        return repo.save(old);
    }
}
