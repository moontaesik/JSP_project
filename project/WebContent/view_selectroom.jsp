<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.web.jdbc.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html lang="ko">

<input type ="hidden" name="command" value="SCTMEM"/>

<head>
   <meta charset="UTF-8">
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
   h2{text-align: center;}
   #button_box2 {width: 100%; height: 15%; margin-top: 40px; }
</style>

<body>
   <div class="container">
      <div class="container p-3 my-3 bg-primary text-white">
         <h2>${number}번방</h2>
      </div>
   </div>
   
   <div class="container">
      <form action = "ProjectServlet" method = "GET" class="was-validated">
         <div id="button_box2">
            <input type="button" id="button_1" value="회원" onclick="window.location.href='view_join_a.jsp'; return false;" class="selectroom_button" />
         </div>
         <div id="button_box2">
            <input type="button" id="button_2" value="비회원" onclick="window.location.href='ProjectServlet?command=NONMEM'; return false;" class="selectroom_button"/>
         </div>
      </form>
   </div>
</body>
</html>