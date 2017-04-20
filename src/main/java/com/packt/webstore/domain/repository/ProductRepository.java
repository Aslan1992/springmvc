package com.packt.webstore.domain.repository;

import com.packt.webstore.domain.Product;

import java.util.List;

public interface ProductRepository {

    List<Product> getAllProducts();
    void addProduct(Product product);

    void updateStock(String productId, long noOfUnits);

    Product getProductById(String productId);

    List<Product> getProductsByCategory(String category);
}
