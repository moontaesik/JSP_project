package com.web.jdbc;

public class popular_chart{
	private int orders;
	private int song_number;
	private String song_title;
	private String artist;
	
	public popular_chart(int orders, int song_number, String song_title, String artist) {
		super();
		this.orders = orders;
		this.song_number = song_number;
		this.song_title = song_title;
		this.artist = artist;
	}
	
	public int getorders() {
		return orders;
	}
	public void setorders(int orders) {
		this.orders = orders;
	}
	
	public int getsong_number() {
		return song_number;
	}
	public void setsong_number(int song_number) {
		this.song_number = song_number;
	}
	
	public String getsong_title() {
		return song_title;
	}
	public void setsong_title(String song_title) {
		this.song_title = song_title;
	}
	
	public String getartist() {
		return artist;
	}
	public void setartist(String artist) {
		this.artist = artist;
	}
	
	@Override
	public String toString() {
		return "chart[orders="+orders+", song_number="+song_number+
				", song_title="+song_title+", artist="+artist+"]";
	}
}