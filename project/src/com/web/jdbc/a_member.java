package com.web.jdbc;

public class a_member{
	private int price;
	private int time;
	
	public a_member(int price, int time) {
		super();
		this.price = price;
		this.time = time;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
}