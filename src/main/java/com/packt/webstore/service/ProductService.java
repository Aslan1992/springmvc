package com.packt.webstore.service;

import com.packt.webstore.domain.Product;

import java.util.List;

public interface ProductService {
    void updateAllStock();
    Product getProductById(String productId);
    List<Product> getAllProducts();
    List<Product> getProductsByCategory(String category);
}
