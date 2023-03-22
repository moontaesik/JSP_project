package com.web.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class ProjectModel{
	private DataSource datasource;
	
	public ProjectModel(DataSource theDataSource) {
		datasource = theDataSource;
	}
	
	public void close(Connection conn, Statement myst, ResultSet myrs) {
		try {
			if(myrs != null) {
				myrs.close();
			}
			if(myst != null) {
				myst.close();
			}
			if(conn != null) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<popular_chart> getchart() throws Exception{
		List<popular_chart> charts = new ArrayList<popular_chart>();
		
		Connection conn = null;
		Statement myst = null;
		ResultSet myrs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM popular_chart";
			myst = conn.createStatement();
			myrs = myst.executeQuery(sql);
			
			while(myrs.next()) {
				int orders = myrs.getInt("orders");
				int song_number = myrs.getInt("song_number");
				String song_title = myrs.getString("song_title");
				String artist = myrs.getString("artist");
				
				popular_chart Chart = new popular_chart(orders, song_number, song_title, artist);
				charts.add(Chart);
			}
			return charts;
		}finally {
			close(conn, myst, myrs);
		}
	}
	
	public List<room_list> getroom() throws Exception{
		List<room_list> rooms = new ArrayList<room_list>();
		
		Connection conn = null;
		Statement myst = null;
		ResultSet myrs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM room_list";
			myst = conn.createStatement();
			myrs = myst.executeQuery(sql);
			
			while(myrs.next()) {
				int room_number = myrs.getInt("room_number");
				int remaining_time = myrs.getInt("remaining_time");
				
				room_list room = new room_list(room_number, remaining_time);
				rooms.add(room);
			}
			return rooms;
		}finally {
			close(conn, myst, myrs);
		}
	}
	
	public members selectmember(int number) throws Exception{
		members mems = null;
		
		Connection conn = null;
		PreparedStatement myst = null;
		ResultSet myrs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM members where phone_number=?";
			myst = conn.prepareStatement(sql);
			
			myst.setInt(1, number);
			
			myrs = myst.executeQuery();
			
			if(myrs.next()) {
				int phone_number = myrs.getInt("phone_number");
				int password = myrs.getInt("password");
				
				mems = new members(phone_number, password);
			}else {
				return null;
			}
			return mems;
		}finally {
			close(conn, myst, myrs);
		}
	}
	
	public void addmember(int phone_number, int password) throws Exception{
		Connection conn = null;
		PreparedStatement myst = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "INSERT INTO members (phone_number, password, storage_time) VALUES(?,?,0)";
			myst = conn.prepareStatement(sql);
			
			myst.setInt(1, phone_number);
			myst.setInt(2,  password);
			
			myst.execute();
		}finally {
			close(conn, myst, null);
		}
	}
	
	public room_list selectroom(int number) throws Exception{
		room_list sct = null;
		
		Connection conn = null;
		PreparedStatement myst = null;
		ResultSet myrs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM room_list where room_number=?";
			myst = conn.prepareStatement(sql);
			myst.setInt(1, number);
			myrs = myst.executeQuery();
			
			if(myrs.next()) {
				int room_number = myrs.getInt("room_number");
				int remaining_time = myrs.getInt("remaining_time");
				
				sct = new room_list(room_number, remaining_time);
			}else {
				throw new Exception("No such room number : " + number);
			}
			return sct;
		}finally {
			close(conn, myst, myrs);
		}
	}
	
	public members joinmember(int number) throws Exception{
		members mem = null;
		
		Connection conn = null;
		PreparedStatement myst = null;
		ResultSet myrs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM members where phone_number=?";
			myst = conn.prepareStatement(sql);
			myst.setInt(1, number);
			myrs = myst.executeQuery();
			
			if(myrs.next()) {
				int phone_number = myrs.getInt("phone_number");
				int password = myrs.getInt("password");
				int storage_time = myrs.getInt("storage_time");
				
				mem = new members(phone_number, password, storage_time);
			}else {
				return null;
			}
			return mem;
		}finally {
			close(conn, myst, myrs);
		}
	}
	
	public List<a_member> amember() throws Exception{
		List<a_member> amem = new ArrayList<a_member>();
		
		Connection conn = null;
		Statement myst = null;
		ResultSet myrs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM a_member";
			myst = conn.createStatement();
			myrs = myst.executeQuery(sql);
			
			while(myrs.next()) {
				int price = myrs.getInt("price");
				int time = myrs.getInt("time");
				
				a_member amems = new a_member(price, time);
				amem.add(amems);
			}
			return amem;
		}finally {
			close(conn, myst, myrs);
		}
	}
	
	public List<non_member> nonmember() throws Exception{
		List<non_member> nonmem = new ArrayList<non_member>();
		
		Connection conn = null;
		Statement myst = null;
		ResultSet myrs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM non_member";
			myst = conn.createStatement();
			myrs = myst.executeQuery(sql);
			
			while(myrs.next()) {
				int price = myrs.getInt("price");
				int time = myrs.getInt("time");
				
				non_member nonmems = new non_member(price, time);
				nonmem.add(nonmems);
			}
			return nonmem;
		}finally {
			close(conn, myst, myrs);
		}
	}
	
	public void nontime(int time, int room) throws Exception{
		Connection conn = null;
		PreparedStatement myst = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "update room_list set remaining_time=? where room_number=? ";
			myst = conn.prepareStatement(sql);
			
			myst.setInt(1, time);
			myst.setInt(2, room);
			
			myst.execute();
		}finally {
			close(conn, myst, null);
		}
	}
	
	public void atime(int time, int phone) throws Exception{
		Connection conn = null;
		PreparedStatement myst = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "update members set storage_time= storage_time + ? where phone_number=? ";
			myst = conn.prepareStatement(sql);
			
			myst.setInt(1, time);
			myst.setInt(2, phone);
			
			myst.execute();
		}finally {
			close(conn, myst, null);
		}
	}
	
	public members sela(int number) throws Exception{
		members mem = null;
		
		Connection conn = null;
		PreparedStatement myst = null;
		ResultSet myrs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM members where phone_number=?";
			myst = conn.prepareStatement(sql);
			myst.setInt(1, number);
			myrs = myst.executeQuery();
			
			if(myrs.next()) {
				int storage_time = myrs.getInt("storage_time");
				
				mem = new members(storage_time);
			}else {
				return null;
			}
			return mem;
		}finally {
			close(conn, myst, myrs);
		}
	}
	
	public void subtime(int time, int phone) throws Exception{
		Connection conn = null;
		PreparedStatement myst = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "update members set storage_time= storage_time - ? where phone_number=? ";
			myst = conn.prepareStatement(sql);
			
			myst.setInt(1, time);
			myst.setInt(2, phone);
			
			myst.execute();
		}finally {
			close(conn, myst, null);
		}
	}
	
	public void adsubtime() throws Exception{
		Connection conn = null;
		PreparedStatement myst = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "update room_list set remaining_time = remaining_time - 1 where remaining_time > 0";
			myst = conn.prepareStatement(sql);
			
			myst.execute();
		}finally {
			close(conn, myst, null);
		}
	}
}