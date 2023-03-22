package com.web.jdbc;

public class members{
	private int phone_number;
	private int password;
	private int storage_time;

	public members(int phone_number, int password, int storage_time) {
		super();
		this.phone_number = phone_number;
		this.password = password;
		this.storage_time = storage_time;
	}
	
	public members(int phone_number, int password) {
		super();
		this.phone_number = phone_number;
		this.password = password;
	}
	public members(int storage_time) {
		super();
		this.storage_time = storage_time;
	}
	
	public int getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(int phone_number) {
		this.phone_number = phone_number;
	}
	
	public int getPassword() {
		return password;
	}
	public void setPassword(int password) {
		this.password = password;
	}
	
	public int getStorage_time() {
		return storage_time;
	}
	public void setStorage_time(int storage_time) {
		this.storage_time = storage_time;
	}
	
}