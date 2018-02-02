<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회사소개</title>

    <!-- Bootstrap -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/animate.css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/jquery.bxslider.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/set1.css" />
    <link href="/resources/css/overwrite.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
    
    <style type="text/css">
        #company {
            margin-left:auto;
            margin-right:auto;
            width: 80%;
        }
        #company ul {
            padding-top:20px
            display:inline-block;
            float:left;
        }
        #company li {
            padding: 10px;
            border: 2px solid orange;
        }
        #company #content {
            color: darkgray;
            width:80%;
            height: 100px;
            padding: 10px 40px;
            display:inline-block;
            float:left;
            background-color:blue;
        }
        #content > div {
            font-size: 20px;
        }
    </style>
    
    <script src="/resources/js/jquery-2.1.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/wow.min.js"></script>
    <script src="/resources/js/jquery.easing.1.3.js"></script>
    <script src="/resources/js/jquery.isotope.min.js"></script>
    <script src="/resources/js/jquery.bxslider.min.js"></script>
    <script src="/resources/js/functions.js"></script>
</head>
<body>
    <%@ include file="../header.jsp"%>
    
    <div class="row">
        <div style="height:100px;"></div>
    </div>
    <div id="company">
        <ul type="none">
            <br>
            <li>연혁</li>
            <li>인사말</li>
            <li>오시는길</li>
        </ul>
        <div id="content">
            <h1><b>연혁</b></h1>
            <div><b>○○○이 설립 이래 걸어온 발자취 입니다.</b></div>
        </div>
    </div>
    
    <%@ include file="../footer.jsp"%>
</body>
</html>