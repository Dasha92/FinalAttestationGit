package com.example.springsecurityapplication.services;

import com.example.springsecurityapplication.enumm.Status;
import com.example.springsecurityapplication.models.Order;
import com.example.springsecurityapplication.repositories.OrderRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public List<Order> getOrders(String filter) {
        if (filter == null || filter.isBlank()) {
            return this.orderRepository.findAll();
        } else {
            return this.orderRepository.findByNumber(filter);
        }
    }

    @Transactional
    public void changeOrderStatus(int orderId, Status status) {
        this.orderRepository.findById(orderId)
                .orElseThrow()
                .setStatus(status);
    }
}
