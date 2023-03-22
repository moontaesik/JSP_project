<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.web.jdbc.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html>
<%
   List<a_member> themems = (List<a_member>)request.getAttribute("amem_list");
%>

<head>

   <meta charset="utf-8">
   <title>회원 요금</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
   
   <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" 크로스오리진>
    <link type="text/css" rel="stylesheet" href="css/room.css">
    <link href="https: //fonts.googleapis.com/css2? family= Noto+Sans+KR:wght@100;300;400;500;700;900 & display=swap" rel="stylesheet">
</head>

<style>
   *{text-align: center;}
   th{color: white; }
   td{color: black; }
</style>

<body>
<input type ="hidden" name="command" value="AMEM"/>

<div class="container">
   <div class="container p-3 my-3 bg-primary text-white">
      <h2>${roomnumber}번방 (회원 요금제)</h2>
   </div>
      <table class="table table-bordered">
          <thead>
               <tr>
                 <th>price</th>
                 <th>time</th>
               </tr>
          </thead>
          <tbody>
             <c:forEach var = "arr3" items = "${amem_list}">
                <c:url var="select_time" value="ProjectServlet">
                   <c:param name="command" value="SCTTIME_A"/>
                   <c:param name="time" value="${arr3.time}"/>
                </c:url>
                <tr>
                   <td>${arr3.price}</td>
                   <td><a href ="${select_time}">${arr3.time}</a></td>
                </tr>
             </c:forEach>   
          </tbody>
       </table>
   </div>
</body>
</html>