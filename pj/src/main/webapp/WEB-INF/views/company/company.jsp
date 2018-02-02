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
            display:block;
            margin:auto;
            width:1100px;
        }
        ul > div {
            
        }
        #company ul {
            text-align: center;
            padding-top:20px;
            display:inline-block;
            float:left;
        }
        #company li {
            text-align: left;
            text-weight: 10px;
            color: white;
            background-color: green;
            margin: 2px;
            padding: 5px 30px;
        }
        #company .content {
            color: darkgray;
            width:80%;
            height: 100px;
            padding: 10px 40px;
            display:inline-block;
            float:left;
        }
        .content > div {
            font-size: 20px;
        }
        .selected {
            background-color: darkgreen !important;
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
    <script type="text/javascript">
        $(document).ready(function(event) {
        	$('.list').hover(function(event) {
        		$(this).addClass('selected');
        	}, function(event) {
        		$(this).removeClass('selected');
        	})
        	$('.list').click(function(event) {
        		var index = $(this).index() - 2;
        		$('#company > .content').hide();
        		$('#company > .content').eq(index).show();
        	});
        });
    </script>
</head>
<body>
    <%@ include file="../header.jsp"%>
    
    <div class="row">
        <div style="height:100px;"></div>
    </div>
    <div class="row">
        <div id="company">
            <ul type="none">
                <br>
                <div><img src="/resources/images/title01.gif"></div>
                <li class="list">인사말</li>
                <li class="list">일반현황</li>
                <li class="list">연혁</li>
                <li class="list">조직도</li>
                <li class="list">오시는길</li>
            </ul>
            <div class="content">
                <h1><b>인사말</b></h1>
                <div></div>
            </div>
            <div class="content" style="display:none;">
                <h1><b>일반현황</b></h1>
                <div></div>
            </div>
            <div class="content" style="display:none;">
                <h1><b>연혁</b></h1>
                <div><b>○○○이 설립 이래 걸어온 발자취 입니다.</b></div>
            </div>
            <div class="content" style="display:none;">
                <h1><b>조직도</b></h1>
                <div></div>
            </div>
            <div class="content" style="display:none;">
                <h1><b>오시는길</b></h1>
                <div></div>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp"%>
</body>
</html>