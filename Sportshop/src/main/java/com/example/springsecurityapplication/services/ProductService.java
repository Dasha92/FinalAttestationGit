package com.example.springsecurityapplication.services;

import com.example.springsecurityapplication.models.Category;
import com.example.springsecurityapplication.models.Product;
import com.example.springsecurityapplication.repositories.ProductRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    // Данный метод позволяет получить список всех товаров
    public List<Product> getAllProduct(){
        return productRepository.findAll();
    }

    // Данный метод позволяет получить товар по id
    public Product getProductId(int id){
        Optional<Product> optionalProduct = productRepository.findById(id);
        return optionalProduct.orElse(null);
    }

    // Данный метод позволяет сохранить товар
    @Transactional
    public void saveProduct(Product product, Category category){
        product.setCategory(category);
        productRepository.save(product);
    }

    // Данный метод позволяет обновить данные о товаре
    @Transactional
    public void updateProduct(int id, Product product){
        product.setId(id);
        productRepository.save(product);
    }

    // Данный метод позволяет удалить товар по id
    @Transactional
    public void deleteProduct(int id){
        productRepository.deleteById(id);
    }

    public List<Product> search(String search, String ot, String Do, String price, String contract) {
        if(!ot.isEmpty() & !Do.isEmpty()){
            if(!price.isEmpty()){
                if(price.equals("sorted_by_descending_price")){
                    System.out.println(contract);
                    if ("furniture".equals(contract)) {
                        return productRepository.findByTitleAndCategoryOrderByPriceDesc(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do), 4);
                    } else if ("appliances".equals(contract)) {
                        return productRepository.findByTitleAndCategoryOrderByPriceDesc(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do), 6);
                    } else if ("clothes".equals(contract)) {
                        return productRepository.findByTitleAndCategoryOrderByPriceDesc(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do), 5);
                    } else {
                        return productRepository.findByTitleOrderByPriceDesc(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do));
                    }
                } else {
                    if ("furniture".equals(contract)) {
                        return productRepository.findByTitleAndCategoryOrderByPriceAsc(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do), 4);
                    } else if ("appliances".equals(contract)) {
                        return productRepository.findByTitleAndCategoryOrderByPriceAsc(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do), 6);
                    } else if ("clothes".equals(contract)) {
                        return productRepository.findByTitleAndCategoryOrderByPriceAsc(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do), 5);
                    } else {
                        return productRepository.findByTitleOrderByPriceAsc(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do));
                    }
                }
            } else {
                return productRepository.findByTitleAndPriceGreaterThanEqualAndPriceLessThanEqual(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do));
            }
        } else {
            return productRepository.findByTitleContainingIgnoreCase(search);
        }
    }
}
