package com.proj.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.model.Payment;


@Service
public class PaymentService {
	@Autowired
	private PaymentRepository payrepo;
	public Payment payTourRupess(Payment payobj) {
		payobj = payrepo.save(payobj);
		return payobj;
		
	}
	/*public ArrayList<Payment> showAllpay()
	{
		ArrayList<Payment> alltrain = new ArrayList<Payment>(); //'alltrain' is model class object. this object for use all model class data fatching in jsp page.
		for(Payment tr_obj:payrepo.findAll()) //'tr_obj' is event model class object. this is use for find one data store in server.
		{
			alltrain.add(tr_obj);
		}
		return alltrain;
}*/
	public List<Payment> showAllEvent()
	{
		List<Payment> allevent = new ArrayList<Payment>();
		for(Payment ev_obj:payrepo.findAll()) 
		{
			allevent.add(ev_obj);
		}
		//tourrepositoryobj.findAll().forEach(alltour::add);
		return allevent ;
	}

	public ArrayList<Payment> searchTourBytourbdate(String date)
	{
		ArrayList<Payment> booklist = (ArrayList<Payment>) payrepo.findByDate(date);
		return booklist;
	}
	/*public ArrayList<Payment> searchPayId(String tourId) {
		ArrayList<Payment> bookobj = (ArrayList<Payment>) payrepo.findByTourId(tourId);
		return bookobj;
	}*/
	public ArrayList<Payment> searchByTourId(String tourId)
	{
		ArrayList<Payment> datelist = (ArrayList<Payment>) payrepo.findByTourId(tourId);
		return datelist;
	}
	
}
