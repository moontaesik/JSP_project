<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.web.jdbc.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html lang="ko">
<%
	List<popular_chart> thecharts = (List<popular_chart>)request.getAttribute("chart_list");
%>
<input type ="hidden" name="command" value="HOME"/>

<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus®">
	<meta name="Author" content="">
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" 크로스오리진>
	<link href="https: //fonts.googleapis.com/css2? family= Noto+Sans+KR:wght@100;300;400;500;700;900 & display=swap" rel="stylesheet">
  	<title>HOME</title>
  	
  	<style>
   	* {margin: 0; padding: 0; list-style: none;}
    @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;}
    body {font-family: 'Pretendard-Regular'; background-color: #F4F4F4; }
    header {width: 100%; height: 15%; background-color: #fff; border-bottom: 1px solid #ccc; }
    header>h2 {font-size: 48px; line-height: 120px; text-align: center;}
    #section {width: 100%; height: 100%; }
    #Popular_charts_box {width: 96%; height: 100%; margin: auto;}
    #button_3 {width: 160px; height: 60px; background-color: #5583FF; border-radius: 12px; border: none; float: left; font-size: 28px; color: #fff; cursor: pointer;  font-family: 'Pretendard-Regular'; margin-top: 20px; margin-bottom: 10px;}
    #button_3:hover {background-color: #3E6BE5;}
    #Popular_charts {width: 100%; height: 100%; font-size: 18px; text-align: center; border-collapse:collapse; background-color: #fff; margin-bottom: 20px;}
    th,td { border:1px solid #eee; padding: 12px;}
    th {background-color: #555; color: #fff; border:1px solid #888; }
  </style>

</head>

<body>
	<header>
        <h2>인기차트</h2>
    </header>

		<div id="section">
        <div id="Popular_charts_box">
      <input type="button" id="button_3" value="코노 입장"
      onclick="window.location.href='ProjectServlet?command=ROOM'; return false;"/>
      <table id="Popular_charts">
          <tr>
                    <th>인기차트 순위</th>
                    <th>예약 번호</th>
                    <th>노래 제목</th>
                    <th>가수</th>
            </tr>
          <tbody>
             <c:forEach var = "arr" items = "${chart_list}">
                <tr>
                   <td>${arr.orders}</td>
                   <td>${arr.song_number}</td>
                   <td>${arr.song_title}</td>
                   <td>${arr.artist}</td>
                </tr>
             </c:forEach>   
             </tbody>
          </table>
       </div>
   </div>

</body>

</html>