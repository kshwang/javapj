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
            height: auto;
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
        .greet {
            margin 0;
            padding 0;
            width: 300px;
            display:inline-block;
            float:left;
        }
        .greet-txt {
            color:black;
            font-size: 13px;
            margin: 10px;
            padding-left: 50px;
            width:450px;
            display:inline-block;
            float:left;
        }
        .greet-txt > dt{
            margin-bottom: 8px;
        }
        .unline {
            text-decoration: underline;
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
                <div><img src="/resources/images/company/title01.gif"></div>
                <li class="list">인사말</li>
                <li class="list">일반현황</li>
                <li class="list">연혁</li>
                <li class="list">조직도</li>
                <li class="list">오시는길</li>
            </ul>
            <div class="content">
                <h1><b>인사말</b></h1>
                <hr>
                <div class="sub-title"><img src="/resources/images/company/p01_01.gif" alt="비인텍을 찾아주신 모든 분께 깊이 감사드립니다" /></div>
                <br>
                <div class="greet"><img src="/resources/images/company/greet_img.jpg" alt="비인텍은 신뢰를 바탕으로 가치를 창조하는 IT전문기업입니다." /></div>
                <dl class="greet-txt">
                    <dt><img src="/resources/images/company/greet_ti01.gif" alt="신가치창출" /></dt>
                    <dd>최근 IT기술의 급속한 발전과 더불어 정치, 경제, 사회, 문화 등 모든 분야에 혁신적인  변화를 유발하여 지식정보사회로 빠르게 진화하고 새로운 가치질서를 창출하고 있습니다.
        지난 10년간 고객과 함께 성장 발전해 온 저희는 그동안의 축적된 경험과 기술로 고객의 새로운 패러다임 변화에 새로운 가치를 창출하겠습니다.</dd><br>
                    <dt><img src="/resources/images/company/greet_ti02.gif" alt="고객가치 실현의 의지" /></dt>
                    <dd>“도대체 당신들이 춤추기만 하면 비가 오는 이유는 무엇입니까?”
        “간단합니다, 우리는 비가 올 때 까지 춤을 춥니다.”
        위의 말은 원주민과의 대화에 나온 말입니다. 
        
        비인텍 임직원은  고객 가치 실현을 위하여 비가 올 때  까지 춤추겠습니다.</dd><br>
                    <dt><img src="/resources/images/company/greet_ti03.gif" alt="사상의 힘,창의성" /></dt>
                    <dd>의지와 상상이 부딪힐 경우 예외없이 상상이 승리하며, 의지와 상상이 같은 방향으로 발휘되면 상상의 힘은 ‘의지의 제곱’에 비례합니다.
        
                      <br />
                      <br />
                  <span class="unline">비인텍은 신 가치 창출, 고객가치 실현 의지, 창의성을 기업 최우선 핵심가치로 삼고 한 걸음 더 목표를 향해 전진하고자 합니다.</span></dd>
                </dl>
            </div>
            <div class="content" style="display:none;">
                <h1><b>일반현황</b></h1>
                <hr>
                <div></div>
            </div>
            <div class="content" style="display:none;">
                <h1><b>연혁</b></h1>
                <hr>
                <div><b>○○○이 설립 이래 걸어온 발자취 입니다.</b></div>
            </div>
            <div class="content" style="display:none;">
                <h1><b>조직도</b></h1>
                <hr>
                <div></div>
            </div>
            <div class="content" style="display:none;">
                <h1><b>오시는길</b></h1>
                <hr>
                <div></div>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp"%>
</body>
</html>