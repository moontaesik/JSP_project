package com.web.jdbc;

import java.io.IOException;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.mysql.cj.x.protobuf.MysqlxCrud.Projection;

@WebServlet("/ProjectServlet")
public class ProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ProjectModel projectModel;
	
	@Resource(name="jdbc/project2")
	private DataSource datasource;
	
	@Override
	public void init() throws ServletException{
		super.init();
		try {
			projectModel = new ProjectModel(datasource);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String theCommand = request.getParameter("command");
			System.out.println("doGet"+theCommand);	
			if(theCommand == null) {
				theCommand = "HOME";
			}
			
			switch(theCommand) {
			case "Home":
				home(request, response);
				break;
			case "ROOM":
				room(request, response);
				break;
			case "ADDMEM":
				addmem(request, response);
				break;
			case "SCTROOM":
				sctroom(request, response);
				break;
			case "JOINMEM":
				joinmem(request, response);
				break;
			case "USETIME":
				usetime(request, response);
				break;
			case "AMEM":
				amem(request, response);
				break;
			case "NONMEM":
				nonmem(request, response);
				break;
			case "SCTTIME_NON":
				scttime_non(request, response);
				break;
			case "SCTTIME_A":
				scttime_a(request, response);
				break;
			 case "END":
		        end(request, response);
		        break;
			default : 
				home(request, response);
			}
		}catch(Exception e) {
			throw new ServletException(e);
		}
	}
	
	 private void end(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      int roomnum = Integer.parseInt(request.getParameter("room_number"));
	      
	      projectModel.nontime(0, roomnum);
	      
	      response.sendRedirect(request.getContextPath() + "/ProjectServlet?command=ROOM");
	   }

	private void scttime_a(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int time = Integer.parseInt(request.getParameter("time"));
		HttpSession session = request.getSession();
		int phone = (Integer)session.getAttribute("phonenumber");
		
		projectModel.atime(time, phone);
		
		members select = projectModel.sela(phone);
		session.setAttribute("atime", select);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view_a_time.jsp");
		dispatcher.forward(request, response);
	}

	private void scttime_non(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int time = Integer.parseInt(request.getParameter("time"));
		HttpSession session = request.getSession();
		int room = (Integer)session.getAttribute("roomnumber");
		
		projectModel.nontime(time, room);
		
		response.sendRedirect(request.getContextPath() + "/ProjectServlet?command=ROOM");
	}

	private void nonmem(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<non_member> nonmem = projectModel.nonmember();
		request.setAttribute("nonmem_list", nonmem);
			
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view_addtime_non.jsp");
		dispatcher.forward(request, response);
	}

	private void amem(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<a_member> amem = projectModel.amember();
		request.setAttribute("amem_list", amem);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view_addtime_a.jsp");
		dispatcher.forward(request, response);
	}
	
	private void usetime(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int time = Integer.parseInt(request.getParameter("usetime"));
		System.out.println(time);
		HttpSession session = request.getSession();
		int room = (Integer)session.getAttribute("roomnumber");
		int phone = (Integer)session.getAttribute("phonenumber");
		
		request.setAttribute("Time", time);
		
		projectModel.nontime(time, room);
		projectModel.subtime(time, phone);
		
		response.sendRedirect(request.getContextPath() + "/ProjectServlet?command=ROOM");
	}

	private void joinmem(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int phone_number = Integer.parseInt(request.getParameter("phone_number"));
		int password = Integer.parseInt(request.getParameter("password"));
		
		HttpSession session = request.getSession();
		session.setAttribute("phonenumber", phone_number);
		
		members mem = projectModel.joinmember(phone_number);
		
		members select = projectModel.sela(phone_number);
		session.setAttribute("atime", select);
		
		if(mem == null || mem.getPassword() != password) {
			request.setAttribute("nomember", "A");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view_join_a.jsp");
			dispatcher.forward(request, response);
			 System.out.println(4);
		}else{
			request.setAttribute("a_list", mem);
			System.out.println(mem);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view_a_time.jsp");
			dispatcher.forward(request, response);
//			response.sendRedirect(request.getContextPath() + "/ProjectServlet?command=AMEM");
		}
	}

	private void sctroom(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int roomnum = Integer.parseInt(request.getParameter("room_number"));
		
		HttpSession session = request.getSession();
		session.setAttribute("roomnumber", roomnum);
		System.out.println("room : "+roomnum);	
//		room_list sct = projectModel.selectroom(roomnum);
		request.setAttribute("number", roomnum);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view_selectroom.jsp");
		dispatcher.forward(request, response);
	}

	private void addmem(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int phone_number = Integer.parseInt(request.getParameter("phone_number"));
		members mem = projectModel.selectmember(phone_number);
		
		if(mem == null) {
			int password = Integer.parseInt(request.getParameter("password"));
			
			projectModel.addmember(phone_number, password);
			
			response.sendRedirect(request.getContextPath() + "/ProjectServlet?command=ROOM");
		}else {
			request.setAttribute("mem_list", mem);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view_addmember.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void room(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<room_list> rooms = projectModel.getroom();
		request.setAttribute("rooms_list", rooms);
		
//		Timer timer = new Timer();
//		TimerTask task = new TimerTask() {
//			@Override
//			public void run() {
//				try {
//					projectModel.adsubtime();
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		};
//		timer.scheduleAtFixedRate(task, 60000, 360000);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view_room.jsp");
		dispatcher.forward(request, response);
	}

	private void home(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<popular_chart> charts = projectModel.getchart();
		request.setAttribute("chart_list", charts);
			
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view_home.jsp");
		dispatcher.forward(request, response);
	}
}
