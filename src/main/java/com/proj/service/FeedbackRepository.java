package com.proj.service;

import org.springframework.data.repository.CrudRepository;

import com.proj.model.Feedback;

public interface FeedbackRepository extends CrudRepository<Feedback, String> {
 
}
