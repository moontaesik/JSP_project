package com.web.jdbc;

public class room_list{
	private int room_number;
	private int remaining_time;
	
	public room_list(int room_number, int remaining_time) {
		super();
		this.room_number = room_number;
		this.remaining_time = remaining_time;
	}
	
	public room_list(int room_number) {
		super();
		this.room_number = room_number;
	}

	public int getRoom_number() {
		return room_number;
	}
	public void setRoom_number(int room_number) {
		this.room_number = room_number;
	}


	public int getRemaining_time() {
		return remaining_time;
	}
	public void setRemaining_time(int remaining_time) {
		this.remaining_time = remaining_time;
	}

	@Override
	public String toString() {
		String roomnum = Integer.toString(room_number);
		return roomnum;
	}
	
	
}