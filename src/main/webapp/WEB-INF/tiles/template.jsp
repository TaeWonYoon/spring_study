<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>제목</title>
    <style>
        #header{
            width: 100%;
            height: 80px;
            text-align: center;
            border-bottom: 1px solid black;
            background: #80ccff;
        }
        #h_main a {
        	color: #ff1a1a;
        	text-decoration: none;
        }
        #h_main a:hover {
        	color: #e60000;
        }
        #left{
             float:left;
             width:15%;
             height: 1200px; 
             background-color: #80ccff;
        }
        
        #main{
             float:left;
             width:85%;
             height: 1200px; 
        }
        /*
        #footer{
            width: 100%;
            height: 150px;            
            text-align: center;
            background-color: orange;
            clear:both;
        }
        */
         #left, #main{ 
               min-height: 600px;
         }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/total.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div>
    <div id="header"><tiles:insertAttribute name="header" /></div>
    <div id="left"><tiles:insertAttribute name="left" /></div>
    <div id="main"><tiles:insertAttribute name="body" /></div>    
    <!--  
    <div id="footer"><tiles:insertAttribute name="footer" /></div>
    -->
    <tiles:insertAttribute name="scripts" />
    </div>
</body>
</html>