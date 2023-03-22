<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.web.jdbc.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html>

<head>
   <meta charset="EUC-KR">
   <title>ADD MEMBER</title>
   <script
     src="https://code.jquery.com/jquery-2.2.4.min.js"
     integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
     crossorigin="anonymous"></script>
</head>

<body>
   <h2>회원가입</h2>
   <form action = "ProjectServlet" method = "GET">
   <input type ="hidden" name="command" value="ADDMEM"/>
      <label>Phone Number : </label>
      <input type = "text" name = "phone_number"/> <br/>
      
      <label>PassWord(4자리) : </label>
      <input type = "password" name = "password"/> <br/>
      
      <label></label>
      <input type="submit" value="Save"/> 
   </form>
   
   <br/>
   <input type="button" value="방 확인하기"
   onclick="window.location.href='ProjectServlet?command=ROOM'; return false;"/>

   <script>
   $(document).ready(function(){ 
         if('${A}') alert('이미 있는 아이디 입니다');
   });
   </script>
</body>

</html> --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.web.jdbc.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html>

<head>
   <meta charset="utf-8">
   <title>ADD MEMBER</title>
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
   
   <script type="text/javascript">
      $(document).ready(function(){
         if('${mem_list}')alert("이미 가입된 회원입니다.");
      });
   </script>
</head>

<body>
   <div class="container">
      <div class="container p-3 my-3 bg-primary text-white">
         <h2>회원가입</h2>
      </div>
   </div>
   
   <div class="container">
      <form action = "ProjectServlet" method = "GET" class="was-validated">
         <input type ="hidden" name="command" value="ADDMEM"/>
         
         <div class="form-group">
            <label>Phone Number(010제외 8자리) : </label>
            <input type = "text" name = "phone_number" class="form-control" placeholder="Enter phone number" required />
         </div>
         <div class="form-group">
            <label>PassWord(4자리) : </label>
            <input type = "text" name = "password" class="form-control" placeholder="Enter password" required />
         </div>
            <label><input type="submit" value="Save" class="btn btn-primary"/></label>
            
      </form>
      <label><input type="button" value="방 확인하기" class="btn btn-primary" onclick="window.location.href='ProjectServlet?command=ROOM';
      return false;"/></label>
   </div>
</body>

</html>