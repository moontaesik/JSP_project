<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.web.jdbc.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html>
<% members mem = (members)request.getAttribute("nonmember"); %>
<head>
   <meta charset="utf-8">
   <title>회원 로그인</title>
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

<body>
   <div class="container">
      <div class="container p-3 my-3 bg-primary text-white">
         <h2>로그인</h2>
      </div>
   </div>
   
   <div class="container">
      <form action = "ProjectServlet" method = "GET" class="was-validated">
         <input type ="hidden" name="command" value="JOINMEM"/>
         <%-- <input type ="hidden" name="room_num" value="${number}"/> --%>
         
         <div class="form-group">
            <label>Phone Number(010제외 8자리) : </label>
            <input type = "number" name = "phone_number" class="form-control" placeholder="Enter phone number" required />
         </div>
         <div class="form-group">
            <label>PassWord(4자리) : </label>
            <input type = "number" name = "password" class="form-control" placeholder="Enter password" required />
         </div>
            <label><input type="submit" value="Save" class="btn btn-primary"/></label>
            
      </form>
      <label><input type="button" value="방 확인하기" class="btn btn-primary" onclick="window.location.href='ProjectServlet?command=ROOM';
      return false;"/></label>
   </div>
   
   <script>
      $(document).ready(function(){ 
            if('${nomember}') alert('핸드폰 번호 및 비밀번호가 일치하지 않습니다.');
      });
   </script>
</body>
</html>