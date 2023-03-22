<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.web.jdbc.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import= "java.util.*" %>

<!DOCTYPE html>

<html lang="ko">

<%
   List<room_list> therooms = (List<room_list>)request.getAttribute("rooms_list");
%>

<input type ="hidden" name="command" value="ROOM"/>

 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" 크로스오리진>
  <link type="text/css" rel="stylesheet" href="css/room.css">
  <link href="https: //fonts.googleapis.com/css2? family= Noto+Sans+KR:wght@100;300;400;500;700;900 & display=swap" rel="stylesheet">
  <title>방 현황</title>
 </head>
 
 <style>
    .use {font-size: 20px; color: #585858; text-align: center; }
 </style>

<body>
   <div id="section">
        <header>
            <h2>방 현황</h2>
        </header>
        
             <div id="number_box">   
                <div class="number" id="number1">
                    <c:if test="${rooms_list.get(0).remaining_time == 0}">
                    <div class="use"> 빈방 </div>   
                    <div class="room_number"> <a href ="ProjectServlet?command=SCTROOM&room_number=${rooms_list.get(0).room_number}">01</a></div> </c:if>
                    
                    <c:if test="${rooms_list.get(0).remaining_time != 0}">
                    <div class="use"> 이용중 </div> 
                    <div class="room_number"> <a href ="ProjectServlet?command=END&room_number=${rooms_list.get(0).room_number}" 
                       onclick="return confirm('종료하시겠습니까?');">01</a></div> </c:if>
                       
                    <div class="use">${rooms_list.get(0).remaining_time}분</div>  
                </div>               
                 
                 
                <div class="number" id="number2">
                    <c:if test="${rooms_list.get(1).remaining_time == 0}">
                    <div class="use"> 빈방 </div>   
                    <div class="room_number"> <a href ="ProjectServlet?command=SCTROOM&room_number=${rooms_list.get(1).room_number}">02</a></div> </c:if>
                    
                    <c:if test="${rooms_list.get(1).remaining_time != 0}">
                    <div class="use"> 이용중 </div> 
                    <div class="room_number"> <a href ="ProjectServlet?command=END&room_number=${rooms_list.get(1).room_number}" 
                       onclick="return confirm('종료하시겠습니까?');">02</a></div> </c:if>
                       
                    <div class="use">${rooms_list.get(1).remaining_time}분</div>  
                </div>
                
                
                <div class="number" id="number3">
                    <c:if test="${rooms_list.get(2).remaining_time == 0}">
                    <div class="use"> 빈방 </div>   
                    <div class="room_number"> <a href ="ProjectServlet?command=SCTROOM&room_number=${rooms_list.get(2).room_number}">03</a></div> </c:if>
                    
                    <c:if test="${rooms_list.get(2).remaining_time != 0}">
                    <div class="use"> 이용중 </div> 
                    <div class="room_number"> <a href ="ProjectServlet?command=END&room_number=${rooms_list.get(2).room_number}" 
                       onclick="return confirm('종료하시겠습니까?');">03</a></div> </c:if>
                       
                    <div class="use">${rooms_list.get(2).remaining_time}분</div>  
                </div>
                
                
                <div class="number" id="number4">
                    <c:if test="${rooms_list.get(9).remaining_time == 0}">
                    <div class="use"> 빈방 </div>   
                    <div class="room_number"> <a href ="ProjectServlet?command=SCTROOM&room_number=${rooms_list.get(9).room_number}">10</a></div> </c:if>
                    
                    <c:if test="${rooms_list.get(9).remaining_time != 0}">
                    <div class="use"> 이용중 </div> 
                    <div class="room_number"> <a href ="ProjectServlet?command=END&room_number=${rooms_list.get(9).room_number}" 
                       onclick="return confirm('종료하시겠습니까?');">10</a></div> </c:if>
                       
                    <div class="use">${rooms_list.get(9).remaining_time}분</div>  
                </div>
                
                
                <div class="number" id="number5">
                   <div class="room_number">X</div> 
                </div>
                
                
                <div class="number" id="number6">
                    <c:if test="${rooms_list.get(3).remaining_time == 0}">
                    <div class="use"> 빈방 </div>   
                    <div class="room_number"> <a href ="ProjectServlet?command=SCTROOM&room_number=${rooms_list.get(3).room_number}">04</a></div> </c:if>
                    
                    <c:if test="${rooms_list.get(3).remaining_time != 0}">
                    <div class="use"> 이용중 </div> 
                    <div class="room_number"> <a href ="ProjectServlet?command=END&room_number=${rooms_list.get(3).room_number}" 
                       onclick="return confirm('종료하시겠습니까?');">04</a></div> </c:if>
                       
                    <div class="use">${rooms_list.get(3).remaining_time}분</div>  
                </div>
                
                
                <div class="number" id="number7">
                    <c:if test="${rooms_list.get(8).remaining_time == 0}">
                    <div class="use"> 빈방 </div>   
                    <div class="room_number"> <a href ="ProjectServlet?command=SCTROOM&room_number=${rooms_list.get(8).room_number}">09</a></div> </c:if>
                    
                    <c:if test="${rooms_list.get(8).remaining_time != 0}">
                    <div class="use"> 이용중 </div> 
                    <div class="room_number"> <a href ="ProjectServlet?command=END&room_number=${rooms_list.get(8).room_number}" 
                       onclick="return confirm('종료하시겠습니까?');">09</a></div> </c:if>
                       
                    <div class="use">${rooms_list.get(8).remaining_time}분</div>  
                </div>
                
                
                <div class="number" id="number8">
                   <div class="room_number">X</div> 
                </div>
                
                
                <div class="number" id="number9">
                    <c:if test="${rooms_list.get(4).remaining_time == 0}">
                    <div class="use"> 빈방 </div>   
                    <div class="room_number"> <a href ="ProjectServlet?command=SCTROOM&room_number=${rooms_list.get(4).room_number}">05</a></div> </c:if>
                    
                    <c:if test="${rooms_list.get(4).remaining_time != 0}">
                    <div class="use"> 이용중 </div> 
                    <div class="room_number"> <a href ="ProjectServlet?command=END&room_number=${rooms_list.get(4).room_number}" 
                       onclick="return confirm('종료하시겠습니까?');">05</a></div> </c:if>
                       
                    <div class="use">${rooms_list.get(4).remaining_time}분</div>  
                </div>
                
                
                <div class="number" id="number10">
                    <c:if test="${rooms_list.get(7).remaining_time == 0}">
                    <div class="use"> 빈방 </div>   
                    <div class="room_number"> <a href ="ProjectServlet?command=SCTROOM&room_number=${rooms_list.get(7).room_number}">08</a></div> </c:if>
                    
                    <c:if test="${rooms_list.get(7).remaining_time != 0}">
                    <div class="use"> 이용중 </div> 
                    <div class="room_number"> <a href ="ProjectServlet?command=END&room_number=${rooms_list.get(7).room_number}" 
                       onclick="return confirm('종료하시겠습니까?');">08</a></div> </c:if>
                       
                    <div class="use">${rooms_list.get(7).remaining_time}분</div>  
                </div>
                
                
                <div class="number" id="number11">
                    <c:if test="${rooms_list.get(6).remaining_time == 0}">
                    <div class="use"> 빈방 </div>   
                    <div class="room_number"> <a href ="ProjectServlet?command=SCTROOM&room_number=${rooms_list.get(6).room_number}">07</a></div> </c:if>
                    
                    <c:if test="${rooms_list.get(6).remaining_time != 0}">
                    <div class="use"> 이용중 </div> 
                    <div class="room_number"> <a href ="ProjectServlet?command=END&room_number=${rooms_list.get(6).room_number}" 
                       onclick="return confirm('종료하시겠습니까?');">07</a></div> </c:if>
                       
                    <div class="use">${rooms_list.get(6).remaining_time}분</div>  
                </div>
                
                
              <div class="number" id="number12">
                    <c:if test="${rooms_list.get(5).remaining_time == 0}">
                    <div class="use"> 빈방 </div>   
                    <div class="room_number"> <a href ="ProjectServlet?command=SCTROOM&room_number=${rooms_list.get(5).room_number}">06</a></div> </c:if>
                    
                    <c:if test="${rooms_list.get(5).remaining_time != 0}">
                    <div class="use"> 이용중 </div> 
                    <div class="room_number"> <a href ="ProjectServlet?command=END&room_number=${rooms_list.get(5).room_number}" 
                       onclick="return confirm('종료하시겠습니까?');">06</a></div> </c:if>
                       
                    <div class="use">${rooms_list.get(5).remaining_time}분</div> 
                </div>

        </div>
    </div>
           

   <div id="menu">
        <div id="button_box">
          <input type="button" id="button_1" value="회원가입"
         onclick="window.location.href='view_addmember.jsp'; return false;"/> 
         <input type="button" id="button_2" value="홈 화면"
         onclick="window.location.href='ProjectServlet?command=HOME'; return false;"/>
      </div>
      
        <div id="price_list_box">
            <table id="price_list">
                <tr>
                    <th rowspan="2">금액</th>
                    <th colspan="2">회원</th>
                    <th colspan="2">비회원</th>
                </tr>
                <tr>
                    <th>코인</th>
                    <th>시간</th>
                    <th>코인</th>
                    <th>시간</th>
                </tr>
                <tr>
                    <td>1,000원</td>
                    <td>3곡</td>
                    <td>9분</td>
                    <td>3곡</td>
                    <td>9분</td>
                </tr>
                <tr>
                    <td>2,000원</td>
                    <td>7곡</td>
                    <td>21분</td>
                    <td>6곡</td>
                    <td>18분</td>
                </tr>
                <tr>
                    <td>3,000원</td>
                    <td>11곡</td>
                    <td>33분</td>
                    <td>9곡</td>
                    <td>27분</td>
                </tr>
                <tr>
                    <td>4,000원</td>
                    <td>15곡</td>
                    <td>45분</td>
                    <td>12곡</td>
                    <td>36분</td>
                </tr>
                <tr>
                    <td>5,000원</td>
                    <td>19곡</td>
                    <td>57분</td>
                    <td>15곡</td>
                    <td>45분</td>
                </tr>
                <tr>
                    <td>7,000원</td>
                    <td>27곡</td>
                    <td>81분</td>
                    <td>21곡</td>
                    <td>63분</td>
                </tr>
                <tr>
                    <td>10,000원</td>
                    <td>45곡</td>
                    <td>135분</td>
                    <td>30곡</td>
                    <td>90분</td>
                </tr>
                <tr>
                    <td>20,000원</td>
                    <td>100곡</td>
                    <td>300분</td>
                    <td>60곡</td>
                    <td>180분</td>
                </tr>
            </table>
        </div>
    </div>
 </body>
</html>