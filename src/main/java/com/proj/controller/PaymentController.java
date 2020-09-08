package com.proj.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.proj.model.Payment;
import com.proj.service.PaymentService;

@RestController
public class PaymentController {
	@Autowired
	private PaymentService payser;
	@RequestMapping(method=RequestMethod.POST, value="/paybook")
	public ModelAndView payTourallInfo(Payment payobject,HttpSession session) {
		payobject = payser.payTourRupess(payobject);
		session.setAttribute("modelobj", payobject);
		ModelAndView mv = new ModelAndView();
		System.out.println(payobject);
		mv.setViewName("paymentApply.jsp");
		return mv;
	}
	/*@RequestMapping(value="/payinfo") //this mapping use for all event show in home jsp page
	public ModelAndView showAllEvents(HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("event",session.getAttribute("modelobj"));
		mv.setViewName("paymentApply.jsp");
		return mv;
	}
	/*@RequestMapping("/payinfo")
	public ModelAndView showAllTourFeedBack(HttpSession session) {
		ArrayList<Payment> fobj= payser.paymentlist();
		ModelAndView mv =new ModelAndView();
		System.out.println(fobj.size());
		session.setAttribute("pay",fobj);
		mv.setViewName("paymentApply.jsp");
		return mv;
	}*/
	@RequestMapping(value="/payinfo")
	public ModelAndView showAllEvents(HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("event",session.getAttribute("modelobj"));
		mv.setViewName("paymentApply.jsp");
		return mv;
	}
	@RequestMapping(method=RequestMethod.POST,value="/searchbypaytour")
	public String searchpays(@RequestParam String tourId,HttpSession session) 
	{
		ArrayList<Payment> finddate = payser.searchByTourId(tourId);
		session.setAttribute("bookinglist", finddate);
		System.out.println("finnd"+finddate.size());
		return "adminshowbooking.jsp";
	}
}
