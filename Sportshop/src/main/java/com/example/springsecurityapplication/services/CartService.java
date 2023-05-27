package com.example.springsecurityapplication.services;

import com.example.springsecurityapplication.models.Cart;
import com.example.springsecurityapplication.repositories.CartRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {

    private final CartRepository cartRepository;

    public CartService(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    public List<Cart> getCartsByPersonId(int personId) {
        return this.cartRepository.findByPersonId(personId);
    }

    @Transactional
    public void deleteCartByProductId(int productId) {
        this.cartRepository.deleteCartByProductId(productId);
    }

    @Transactional
    public void save(Cart cart) {
        this.cartRepository.save(cart);
    }
}
