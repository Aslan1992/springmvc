package com.packt.webstore.domain.repository.impl;

import com.packt.webstore.domain.Product;
import com.packt.webstore.domain.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class InMemoryProductRepository implements ProductRepository {

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;


    @Override
    public List<Product> getAllProducts() {
        Map<String, Object> params = new HashMap<>();

        List<Product> result = jdbcTemplate.query("select * from products", params, new ProductMapper());
        return result;
    }

    @Override
    public Product getProductById(String productId) {
        Map<String, Object> params = new HashMap<>();
        params.put("id", productId);
        Product product = jdbcTemplate.queryForObject("select * from products where id = :id",
                params, new ProductMapper());
        return product;
    }

    @Override
    public void updateStock(String productId, long noOfUnits) {
        String SQL = "update products set units_in_stock = :unitsInStock where id = :id";
        Map<String, Object> params = new HashMap<>();
        params.put("unitsInStock", noOfUnits);
        params.put("id", productId);
        jdbcTemplate.update(SQL, params);
    }

    @Override
    public List<Product> getProductsByCategory(String category) {
        List<Product> productsByCategory = new ArrayList<>();
        for (Product p : getAllProducts()) {
            if (category.equalsIgnoreCase(p.getCategory())) {
                productsByCategory.add(p);
            }
        }
        return productsByCategory;
    }

    private static final class ProductMapper implements RowMapper<Product> {

        @Override
        public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
            Product product = new Product();
            product.setProductId(rs.getString("id"));
            product.setName(rs.getString("name"));
            product.setDescription(rs.getString("description"));
            product.setUnitPrice(rs.getBigDecimal("unit_price"));
            product.setManufacturer(rs.getString("manufacturer"));
            product.setCategory(rs.getString("category"));
            product.setUnitsInStock(rs.getLong("units_in_stock"));
            product.setUnitsInOrder(rs.getLong("units_in_order"));
            product.setDiscontinued(rs.getBoolean("discontinued"));
            product.setCondition(rs.getString("condition"));
            return product;
        }
    }
}
