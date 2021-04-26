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
            height: 120px;
            text-align: center;
            border-bottom: 1px solid black;
            background: #f2f2f2;
        }
        #h_main a {
        	color: #4da6ff;
        	text-decoration: none;
        }
        #h_main a:hover {
        	color: #0073e6;
        }
        #left{
             float:left;
             width:15%;
             height: 1200px; 
             background-color: #80ccff;
        }
        #left .card {
        	background-color: #33adff;
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
         .my-5 {
         
         } 
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
    <div>
    <div id="header"><tiles:insertAttribute name="header" /></div>
    <div id="left"><tiles:insertAttribute name="left" /></div>
    <div id="main"><tiles:insertAttribute name="body" /></div>    
    <!--  
    <div id="footer"><tiles:insertAttribute name="footer" /></div>
    -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <tiles:insertAttribute name="scripts" />
    </div>
</body>
</html>