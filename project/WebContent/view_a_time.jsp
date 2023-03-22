<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.web.jdbc.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html>

<head>
   <meta charset="utf-8">
   <title>회원 시간</title>
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
         <h2>010${phonenumber} 회원</h2>
      </div>
     </div>   
    
      <div class="container">
      	<form action = "ProjectServlet" method = "GET" class="was-validated">
        <input type ="hidden" name="command" value="USETIME"/>
      
         <div class="form-group">
            <label>잔여시간 : <span id="remainingTime">${atime.storage_time}</span></label>
         </div>
         
         <div class="form-group">
            <label>사용시간 입력 : </label>
            <input id="useTime" type = "number" name = "usetime" class="form-control" placeholder="Enter usetime" required />
            <script>   
               $(document).ready(function(){
                  $('#useButton').click(function(){
                       if(Number($('#useTime').val()) > Number($('#remainingTime').text())){
                           alert('잔여 시간을 초과하여 사용할 수 없습니다.');
                        }else{
                          window.location.href='ProjectServlet?command=USETIME&usetime='+$('#useTime').val();
                        }
                  })
               })
            </script> 
         </div>
         <label><input type="button" value="충전하기" class="btn btn-primary" onclick="window.location.href='ProjectServlet?command=AMEM'; return false;" class="selectroom_button"/></label>
           <label><input type="button" id="useButton" value="사용하기" class="btn btn-primary"/></label>
		</form>      
      </div>      
</body>
</html>