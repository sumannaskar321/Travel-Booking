package com.proj.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Payment implements Serializable {
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	private String payid;
	private String payment;
	private String bookid;
	private String tourId;
	private String cusName;
	private String cusEmail;
	private String people;
	private String totalrupee;
	private String date;
	
	public Payment() {
		
	}
	

	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getBookid() {
		return bookid;
	}

	public void setBookid(String bookid) {
		this.bookid = bookid;
	}

	public String getTourId() {
		return tourId;
	}

	public void setTourId(String tourId) {
		this.tourId = tourId;
	}

	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	public String getCusEmail() {
		return cusEmail;
	}

	public void setCusEmail(String cusEmail) {
		this.cusEmail = cusEmail;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public String getTotalrupee() {
		return totalrupee;
	}

	public void setTotalrupee(String totalrupee) {
		this.totalrupee = totalrupee;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
}
