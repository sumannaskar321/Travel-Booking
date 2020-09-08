package com.proj.service;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.proj.model.BookingModel;
import com.proj.model.Payment;

public interface PaymentRepository extends CrudRepository<Payment, String> {
	List<Payment> findByDate(String date);
	List<Payment> findByTourId(String tourId);

}
