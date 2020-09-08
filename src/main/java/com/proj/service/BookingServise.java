package com.proj.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.model.BookingModel;
import com.proj.model.Feedback;
import com.proj.model.TourModel;

@Service
public class BookingServise {
	
	@Autowired
	private BookingRepository bookingrepository;
	@Autowired FeedbackRepository feedbackrepo;
	
	public BookingModel addBooking(BookingModel bookingmodel) 
	{
		bookingmodel = bookingrepository.save(bookingmodel);
		return bookingmodel;
	}
	
	// FETCH BOOKING DATA FROM DB
	public ArrayList<BookingModel> getAllBookingRecordFromDB()
	{
		ArrayList<BookingModel> allbooking = new ArrayList<BookingModel>();
		bookingrepository.findAll().forEach(allbooking::add);
		
		return allbooking;
	}
	
	//METHOD FOR SEARCH BOOKING USING EMAIL
	public ArrayList<BookingModel> getAlldbSearchByEmail(String email)
	{
		ArrayList<BookingModel> bookingsl = (ArrayList<BookingModel>)bookingrepository.findByEmail(email);
		return bookingsl;
	}

	//METHOD FOR DELETE BOOKING RECORDS
	public void deleteBookingRecord(int id) 
	{
		bookingrepository.deleteById(id);
	}

	public Feedback feedBackrepository(Feedback feedobj) {
		feedobj = feedbackrepo.save(feedobj);
		return feedobj;
	}
	public ArrayList<Feedback> feedbacklist() {
		ArrayList<Feedback> ffobj = new ArrayList<Feedback>();
		feedbackrepo.findAll().forEach(ffobj::add);
		return ffobj;
	}
}
