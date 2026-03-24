package com.example.stock.repository;

import com.example.stock.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    List<Product> findByNameContaining(String name);
    List<Product> findByCategoryContaining(String category);
    List<Product> findByCompanyContaining(String company);
}
