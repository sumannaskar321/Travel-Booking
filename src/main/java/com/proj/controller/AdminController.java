package com.proj.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.proj.model.Feedback;
import com.proj.model.Payment;
import com.proj.model.TourModel;
import com.proj.service.BookingServise;
import com.proj.service.PaymentService;
import com.proj.service.TourService;


@Controller
public class AdminController {
	
	@Autowired
	private TourService tourserviceobj;
	@Autowired
	private BookingServise bookingservice;
	@Autowired
	private PaymentService payserv;
	
	
	//FOR ADMIN LOGIN
	@RequestMapping(value="/adminlogincheck", method=RequestMethod.POST)
	public ModelAndView AdminLoginCheck(@RequestParam String admin_id,String password,HttpSession session) 
	{
		ModelAndView mv = new ModelAndView();
		if(admin_id.equals("admin") && password.equals("admin")) 
		{
			session.setAttribute("adminusername", "ADMIN");
			mv.addObject("errormsg", "VALID ADMIN");
			mv.setViewName("adminafterlogin.jsp");
		}
		else
		{
			mv.addObject("errormsg", "INVALID UID OR PASSWORD");
			mv.setViewName("adminlogin.jsp");
		}
		
		return mv;
	}

		//FOR ADD TOUR
	@RequestMapping(method=RequestMethod.POST,value="/adminaddtour")
	public String AddTour(TourModel tourmobj, HttpSession session)
	{
		tourmobj = tourserviceobj.addTourDetails(tourmobj);	//ADDING TOUR BY PASSING OBJECT
		ArrayList<TourModel> tourlist = tourserviceobj.getAllTourRecordFromDB();//AFTER ADDING FETCHING ALL DETAILS FROM DB
		session.setAttribute("alltourlist", tourlist);//SET VALUES FOR JSP PAGE

		return "showalltour.jsp";
	}
	
	//FOR GET ALL RECORD FROM TOUR DB
	@RequestMapping("/viewalltour")
	public String openAdminViewAllUser(HttpSession session)
	{
		ArrayList<TourModel> tourlist = tourserviceobj.getAllTourRecordFromDB();
		session.setAttribute("alltourlist", tourlist);
		System.out.println(tourlist.size());
		return "showalltour.jsp";
	}
	
	//FOR DELETE ANY TOUR FROM DB
	@RequestMapping("/deletetour")
	public ModelAndView deletetour(@RequestParam int id,HttpSession session)
	{
		//System.out.println("INSIDE deletetour Method IN CONTROLLER CLASS");
		
		tourserviceobj.deleteTourRecord(id);
		ArrayList<TourModel> tourlist = tourserviceobj.getAllTourRecordFromDB();
		session.setAttribute("alltourlist", tourlist);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "RECORD DELETED");
		mv.setViewName("showalltour.jsp");
		return mv;
	}
	
	//FOR GET ALL RECORD FROM BOOKING DB
	@RequestMapping("/adminshowallbooking")
	public String openAdminViewAllbooking(HttpSession session)
	{
		List<Payment> booklist = payserv.showAllEvent();
		session.setAttribute("bookinglist", booklist);
		System.out.println(booklist.size());
		return "adminshowbooking.jsp";
	}
	
	
	
	// FOR ADMIN LOGOUT
	@RequestMapping("/adminlogout")
	public  String Logout(HttpSession session) 
	{
		session.removeAttribute("adminusername");
		session.invalidate();
		
		return "home.jsp";
	}
	@RequestMapping(method=RequestMethod.POST,value="/feedBackCustomer")
	public ModelAndView feedBackList(Feedback fobject) {
		fobject = bookingservice.feedBackrepository(fobject);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("usershowbooking.jsp");
		return mv;
	}
	@RequestMapping("/showallFeedback")
	public ModelAndView showAllTourFeedBack(HttpSession session) {
		ArrayList<Feedback> fobj= bookingservice.feedbacklist();
		ModelAndView mv =new ModelAndView();
		System.out.println(fobj.size());
		session.setAttribute("FEED",fobj);
		mv.setViewName("home.jsp");
		return mv;
	}
	@RequestMapping(method=RequestMethod.POST,value="/searchpaydate")
	public String searchTours(@RequestParam String date,HttpSession session) 
	{
		ArrayList<Payment> booklist = payserv.searchTourBytourbdate(date);
		session.setAttribute("bookinglist", booklist);
		return "adminshowbooking.jsp";
	}
	/*@RequestMapping(method=RequestMethod.POST,value="/searchpayid")
	public String searchToursId(@RequestParam String tourId,HttpSession session) 
	{
		ArrayList<Payment> booklist = payserv.searchPayId(tourId);
		session.setAttribute("bookinglist", booklist);
		return "adminshowbooking.jsp";
	}*/
	@RequestMapping(method=RequestMethod.POST,value="/searchbypay")
	public String searchpays(@RequestParam String tourId,HttpSession session) 
	{
		ArrayList<Payment> finddate = payserv.searchByTourId(tourId);
		session.setAttribute("bookinglist", finddate);
		System.out.println("finnd"+finddate.size());
		return "adminshowbooking.jsp";
	}
	
}
