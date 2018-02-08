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
        #company > ul {
            text-align: center;
            padding-top:20px;
            display:inline-block;
            float:left;
        }
        #company > ul > li {
            cursor: pointer;
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
        .selected {
            background-color: darkgreen !important;
        }
        .content hr {
            height: 10px;
            margin:0;
            padding:0;
        }
        .content li {
            text-align: left;
            line-height: 2em;
            margin:0;
        }
        .content ul {
            margin:0;
            padding:0;
        }
        .content > ul > #co {
            margin: 5px 0;
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
        /* [contants] > 연혁 */
        .history-tab li{
            float:left; width:111px; margin-right:16px;
        }
        .history-wrap{
            display:inline-block; background:url(/resources/images/company/history_bg.gif) no-repeat left -15px;
            margin-top: 30px;
        }
        .history-img{
            clear:both;
            float:left;
            width:360px;
            margin-left: 1px;
        }
        
        .history-list{
            float:left;
            width:400px;
            margin-bottom:40px;
        }
        .history-list li{ height:30px;}
        .sub-title {
            color: #666;
            font-size: 14px;
            font-weight: 800;
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
        	$('.history-tab > li').click(function(event) {
        		var index = $(this).index();
        		$('.history-wrap').hide();
        		$('.history-wrap').eq(index).show();
        		$('.history-tab').children('li').eq(0).children('a').children('img').attr('src', '/resources/images/company/history2015_off.gif');
                $('.history-tab').children('li').eq(1).children('a').children('img').attr('src', '/resources/images/company/history05_off.gif');
                $('.history-tab').children('li').eq(2).children('a').children('img').attr('src', '/resources/images/company/history04_off.gif');
                $('.history-tab').children('li').eq(3).children('a').children('img').attr('src', '/resources/images/company/history01_off.gif');
                $('.history-tab').children('li').eq(4).children('a').children('img').attr('src', '/resources/images/company/history02_off.gif');
                $('.history-tab').children('li').eq(5).children('a').children('img').attr('src', '/resources/images/company/history03_off.gif');
        		if (index === 0) {
        			$(this).children('a').children('img').attr('src', '/resources/images/company/history2015_on.gif');
        		}
        		else if (index === 1) {
                    $(this).children('a').children('img').attr('src', '/resources/images/company/history05_on.gif');
        		}
                else if (index === 2) {
                    $(this).children('a').children('img').attr('src', '/resources/images/company/history04_on.gif');
                }
                else if (index === 3) {
                    $(this).children('a').children('img').attr('src', '/resources/images/company/history01_on.gif');
                }
                else if (index === 4) {
                    $(this).children('a').children('img').attr('src', '/resources/images/company/history02_on.gif');
                }
                else if (index === 5) {
                    $(this).children('a').children('img').attr('src', '/resources/images/company/history03_on.gif');
                }
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
                <li class="list">연혁</li>
                <li class="list">조직도</li>
                <li class="list">오시는길</li>
            </ul>
            <div class="content">
                <h1><b>인사말</b></h1>
                <hr>
                <div class="sub-title">더조은 컴퍼니를 찾아주신 모든 분께 깊이 감사드립니다</div>
                <br>
                <div class="greet"><img src="/resources/images/company/greet_img.jpg" style="width:320px; height:auto;" alt="더조은 컴퍼니는 신뢰를 바탕으로 가치를 창조하는 IT전문기업입니다." /></div>
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
                  <span class="unline">더조은 컴퍼니는 신 가치 창출, 고객가치 실현 의지, 창의성을 기업 최우선 핵심가치로 삼고 한 걸음 더 목표를 향해 전진하고자 합니다.</span></dd>
                </dl>
            </div>
            <div class="content" style="display:none;">
                <h1><b>연혁</b></h1>
                <hr>
                <div class="sub-title">더조은 컴퍼니가 설립 이래 걸어온 발자취입니다.</div>
                <ul class="history-tab" type="none">
                    <li><a href="#history15"><img src="/resources/images/company/history2015_on.gif" alt="2015" /></a></li>
                    <li><a href="#history13_14"><img src="/resources/images/company/history05_off.gif" alt="2013~2014" /></a></li>
                    <li><a href="#history11_12"><img src="/resources/images/company/history04_off.gif" alt="2012~2011" /></a></li>
                    <li><a href="#history09_10"><img src="/resources/images/company/history01_off.gif" alt="2010~2009" /></a></li>
                    <li><a href="#history07_08"><img src="/resources/images/company/history02_off.gif" alt="2008~2007" /></a></li>
                    <li><a href="#history03_06"><img src="/resources/images/company/history03_off.gif" alt="2006~2003" /></a></li>
                </ul>
                <div class="history-wrap">
                    <h4 class="history-img"><img src="/resources/images/company/history2015.gif" alt="2015년" /></h4>
                    <ul class="history-list">
                        <li><img src="/resources/images/company/history2015_12.gif" alt="2015_12 한국산업기술평가 관리원 KEIT R&D 상담콜센터 위탁운영 사업"/></li>
                        <li><img src="/resources/images/company/history2015_10.gif" alt="2015_10 두레생연합회 두레정보시스템 유지보수 및 기능개선 사업"/></li>
                        <li><img src="/resources/images/company/history2015_09_2.gif" alt="2015_09 대검찰청 불법집단행동 및 선거관련 전산시스템 구축사업"/></li>
                        <li><img src="/resources/images/company/history2015_09.gif" alt="2015_09 한국 에너지공단 에너지바우처 콜센터 위탁운영 용역"/></li>
                        <li><img src="/resources/images/company/history2015_08.gif" alt="2015_08 법무부 형사사법 통계시스템 구축사업"/></li>
                        <li><img src="/resources/images/company/history2015_05_2.gif" alt="2015_05 엘지 유플러스 유박스 아이모리 SNS 위탁운영 사업"/></li>
                        <li><img src="/resources/images/company/history2015_05.gif" alt="2015_05 엘지유플러스 U+BOX 인프라 보안대응 구축사업"/></li>
                        <li><img src="/resources/images/company/history2015_04_2.gif" alt="2015_04 법제처 국가법령 정보서비스 유지보수 사업"/></li>
                        <li><img src="/resources/images/company/history2015_04.gif" alt="2015_04 법제처 2015년 국가법령정보 통합 서비스 구축사업"/></li>
                        <li><img src="/resources/images/company/history2015_03.gif" alt="2015_03 법제처 2015년 찾기쉬운 생활법령정보 개발 및 처내업무 행정정보화 유지보수 사업"/></li>
                        <li><img src="/resources/images/company/history2015_02_3.gif" alt="2015_02 한국에너지기술평가원 KETEP R&D 상담콜 센터 구축운영 용역"/></li>
                        <li><img src="/resources/images/company/history2015_02_2.gif" alt="2015_02 엘지 유플러스 전자금융 서비스 개발 및 유지보수"/></li>
                        <li><img src="/resources/images/company/history2015_02.gif" alt="2015_02 (주)비인텍으로 사명변경"/></li>
                        <li><img src="/resources/images/company/history2015_01_4.gif" alt="2015_01 행자부 2015년 주민등록시스템 유지보수 사업"/></li>
                        <li><img src="/resources/images/company/history2015_01_3.gif" alt="2015_01 인천광역시 교육청 법무도우미 홈페이지 유지보수"/></li>
                        <li><img src="/resources/images/company/history2015_01_2.gif" alt="2015_01 부산광역시 법무행정서비스 유지보수"/></li>
                        <li><img src="/resources/images/company/history2015_01.gif" alt="2015_01 울산광역시 교육청 자치법규 홈페이지 유지보수"/></li>
                    </ul>                
                </div> 
                <div class="history-wrap" style="display: none;" >
                    <h4 class="history-img"><img src="/resources/images/company/history2014.gif" alt="2014년부터" /></h4>
                    <ul class="history-list">
                        <li><img src="/resources/images/company/history2014_12.gif" alt="2014년 12월 소프트웨어프로세스 품질인증서 획득" /></li>
                        <li><img src="/resources/images/company/history2014_10.gif" alt="2014년 10월 엘지유플러스 클라우드 OpenAPI 서버 고도화 사업" /></li>
                        <li><img src="/resources/images/company/history2014_09.gif" alt="2014년 09월 검찰청 검찰 형사사법정보시스템 고도화 사업" /></li>
                        <li><img src="/resources/images/company/history2014_08.gif" alt="2014년 08월 엘지유플러스 U+ BOX 인증개선개발" /></li>
                        <li><img src="/resources/images/company/history2014_04.gif" alt="2014년 04월 한국에너지 기술평가원 KETEP R&amp;D 상담콜 센터 구축. 운영" /></li>
                        <li><img src="/resources/images/company/history2014_03_3.gif" alt="2014년 03월 법제처 처내업무 행정정보화 및 유지보수 사업" /></li>
                        <li><img src="/resources/images/company/history2014_03_2.gif" alt="2014년 03월  대법원 맞춤형 사법서비스 제공시스템 구축사업" /></li>
                        <li><img src="/resources/images/company/history2014_03.gif" alt="2014년 03월 법제처 국가법령정보 통합서비스 및 유지보수 사업" /></li>
                        <li><img src="/resources/images/company/history2014_02_2.gif" alt="2014년 02월 정보통신 산업 진흥원 공인전자주소 콜센터 위탁운영" /></li>
                        <li><img src="/resources/images/company/history2014_02.gif" alt="2014년 02월 LG유플러스 e-Biz 서비스 개발 및 위탁운영 계속" /></li>
                        <li><img src="/resources/images/company/history2014_01_3.gif" alt="2014년 01월 인천광역시 교육청 법무도우미 홈페이지 유지보수" /></li>
                        <li><img src="/resources/images/company/history2014_01_2.gif" alt="2014년 01월 부산광역시 법무행정서비스 유지보수" /></li>
                        <li><img src="/resources/images/company/history2014_01.gif" alt="2014년 01월 울산광역시 교육청 자치법규 홈페이지 유지보수" /></li>
                        <br>
                    </ul>
                    <h4 class="history-img"><img src="/resources/images/company/history2013.gif" alt="2013년" /></h4>
                    <ul class="history-list">
                        <li><img src="/resources/images/company/history2013_10_2.gif" alt="2013.10 한국산업기술평가관리원 상담 콜 센터 구축 운영" /></li>
                        <li><img src="/resources/images/company/history2013_10_1.gif" alt="2013.10 검찰청 검찰 정보시스템 고도화 사업" /></li>
                        <li><img src="/resources/images/company/history2013_10.gif" alt="2013.10 검찰청 아.태지역 범죄수익 환수 기관 간 네트워크 홈페이지 구축사업" /></li>
                        <li><img src="/resources/images/company/history2013_09.gif" alt="2013.09  한국정보통신산업연구원 표준시방서 운영 시스템 구축" /></li>
                        <li><img src="/resources/images/company/history2013_06.gif" alt="2013.06 LG유플러스 앱 결제시스템 구축을 위한 PG시스템 연동개발" /></li>
                        <li><img src="/resources/images/company/history2013_04.gif" alt="2013.04  기상청 국가지진종합정보시스템(NECIS)2차년도 구축" /></li>
                        <li><img src="/resources/images/company/history2013_03-08.gif" alt="2013.03 법제처 처내업무 행정정보화 및 유지보수 사업" /></li>
                        <li><img src="/resources/images/company/history2013_03.gif" alt="2013.03 법제처 법령지식등록 시스템등 개발 및 유지보수 사업" /></li>
                        <li><img src="/resources/images/company/history2013_02-10.gif" alt="2013.02 LG유플러스 전자결제창 시스템 구축" /></li>
                        <li><img src="/resources/images/company/history2013_02.gif" alt="2013.02 대법원 성년후견 사건관리 및 촉탁 시스템 구축" /></li>
                        <li><img src="/resources/images/company/history2013_01_4.gif" alt="2013.01 LG유플러스 e-Biz 서비스 개발 및 위탁운영 계속" /></li>
                        <li><img src="/resources/images/company/history2013_01_3.gif" alt="2013.01 대법원 13년 가족관계 등록정보화 사업" /></li>
                        <li><img src="/resources/images/company/history2013_01_2.gif" alt="2013.01 법원행정처 사법 업무 전산화 시스템 유지보수" /></li>
                        <li><img src="/resources/images/company/history2013_01_1.gif" alt="2013.01 울산광역시 교육청 자치법규 홈페이지 유지보수" /></li>
                        <li><img src="/resources/images/company/history2013_01.gif" alt="2013.01 부산광역시 교육청 법무행정서비스 유지보수" /></li>
                    </ul>                
                </div> 
                <div class="history-wrap" style="display: none;" >
                    <h4 class="history-img"><img src="/resources/images/company/history2012.gif" alt="2012년" /></h4>
                    <ul class="history-list">
                        <li><img src="/resources/images/company/history2012_13.gif" alt="2012.10 대검찰청 국제자금추적업무 시스템 구축" /></li>
                        <li><img src="/resources/images/company/history2012_12.gif" alt="2012.10 LG유플러스 웹하드 서비스 보안강화 개발" /></li>
                        <li><img src="/resources/images/company/history2012_11.gif" alt="2012.10 한국산업기술평가관리원 중기 콜 센터 운영 사업" /></li>
                        <li><img src="/resources/images/company/history2012_10.gif" alt="2012.09 STX 팬오션 easyCon 사이트 개편구축" /></li>
                        <li><img src="/resources/images/company/history2012_09.gif" alt="2012.07 대법원 판결서등 비실명화 검수시스템 구축" /></li>
                        <li><img src="/resources/images/company/history2012_08.gif" alt="2012.07 대검찰청 형사사법정보시스템 고도화 사업" /></li>
                        <li><img src="/resources/images/company/history2012_07.gif" alt="2012.06 기상청 차세대 통합 기상 IT 인프라 2차년도 구축사업" /></li>
                        <li><img src="/resources/images/company/history2012_06.gif" alt="2012.05 한국고용정보원 고유식별정보 암호화 및 결재시스템 구축" /></li>
                        <li><img src="/resources/images/company/history2012_05.gif" alt="2012.04 대법원 전자소송 고도화 1차 사업" /></li>
                        <li><img src="/resources/images/company/history2012_04.gif" alt="2012.04 기상청 국가기후자료 관리 및 서비스 체계 구축 2차사업 " /></li>
                        <li><img src="/resources/images/company/history2012_03.gif" alt="2012.03 법제처 법령정보검사시스템등 개발 및 유지보수 사업" /></li>
                        <li><img src="/resources/images/company/history2012_02.gif" alt="2012.02 KT Nstep 무선 운영" /></li>
                        <li><img src="/resources/images/company/history2012_01.gif" alt="2012.01 LG유플러스 e-Biz 서비스 개발 및 위탁운영 " /></li>
                        <br>
                    </ul>
                    <h4 class="history-img"><img src="/resources/images/company/history2011.gif" alt="2011년" /></h4>
                    <ul class="history-list">
                        <li><img src="/resources/images/company/history2011_14.gif" alt="2011.12 국민권익위원회 정부민원안내 콜센터 구축. 운영 " /></li>
                        <li><img src="/resources/images/company/history2011_13.gif" alt="2011.12 LG 유플러스 무비팟 서비스 구축" /></li>
                        <li><img src="/resources/images/company/history2011_12.gif" alt="2011.11 한국산업기술평가관리원 상담 콜센터 구축 운영 " /></li>
                        <li><img src="/resources/images/company/history2011_11.gif" alt="2011.11 LG 유플러스 웹하드 일본향 시스템 구축" /></li>
                        <li><img src="/resources/images/company/history2011_10.gif" alt="2011.10 KT무선 영업계 빌링 시스템 구축" /></li>
                        <li><img src="/resources/images/company/history2011_09.gif" alt="2011.09 기술 혁신형 중소기업(INNO-BIZ)  인증" /></li>
                        <li><img src="/resources/images/company/history2011_08.gif" alt="2011.09 LG 유플러스 e-biz DB 암호화 시스템 구축" /></li>
                        <li><img src="/resources/images/company/history2011_07.gif" alt="2011.08 기상청 공동활용 체계구축 2차 사업" /></li>
                        <li><img src="/resources/images/company/history2011_06.gif" alt="2011.07 대법원 형사업무시스템 고도화 사업 " /></li>
                        <li><img src="/resources/images/company/history2011_05.gif" alt="2011.05 한국산업단지공단 FEMIS 이중화 사업 " /></li>
                        <li><img src="/resources/images/company/history2011_04.gif" alt="2011.04 법제처 국가입법지원센터 구축사업 " /></li>
                        <li><img src="/resources/images/company/history2011_03.gif" alt="2011.03 한국인터넷 진흥원 2011년 개인정보 노출대응 체계 운영 " /></li>
                        <li><img src="/resources/images/company/history2011_02.gif" alt="2011.02 법제처 국가법령정보서비스 및 유지보수 사업" /></li>
                        <li><img src="/resources/images/company/history2011_01.gif" alt="2011.01 LG유플러스 e-Biz 서비스 개발 및 위탁운영 사업" /></li>
                    </ul>
                </div> 
                <div class="history-wrap" style="display: none;" >
                    <h4 class="history-img"><img src="/resources/images/company/history2010.gif" alt="2010년" /></h4>
                    <ul class="history-list">
                        <li><img src="/resources/images/company/history2010_11.gif" alt="한국장학재단 인재육성지원 포털시스템 구축" /></li>
                        <li><img src="/resources/images/company/history2010_10.gif" alt="벤처기업인증" /></li>
                        <li><img src="/resources/images/company/history2010_07.gif" alt="기상청 기상관측자료 표준화 및 공동 활용체계 구축" /></li>
                        <li><img src="/resources/images/company/history2010_07_01.gif" alt="한화손해보험 장기/연금 SM 용역" /></li>
                        <li><img src="/resources/images/company/history2010_06.gif" alt="한국산업단지공단 공장설립 온라인 전국확산사업" /></li>
                        <li><img src="/resources/images/company/history2010_03.gif" alt="KT M&S 마케팅 웹 위탁운영" /></li>
                        <li><img src="/resources/images/company/history2010_03_02.gif" alt="한국인터넷진흥원 118개인정보 노출대응체계 운영" /></li>
                        <li><img src="/resources/images/company/history2010_03_03.gif" alt="울산교육청 법무행정 통합관리시스템 연계 구축" /></li>
                        <li><img src="/resources/images/company/history2010_02.gif" alt="법제처 법제정보서비스 안정화 3차사업" /></li>
                        <li><img src="/resources/images/company/history2010_02_02.gif" alt="법제처 국가법령정보 통합구축 및 연계사업" /></li>
                        <li><img src="/resources/images/company/history2010_01.gif" alt="대법원 사법UHD운영사업" /></li>
                        <br>
                    </ul>
                    <h4 class="history-img"><img src="/resources/images/company/history2009.gif" alt="2009년" /></h4>
                    <ul class="history-list">
                        <li><img src="/resources/images/company/history2009_12.gif" alt="부산교육청 자치법규 관리시스템 구축" /></li>
                        <li><img src="/resources/images/company/history2009_12_02.gif" alt="국민카드 SMS/MMS 발송시스템 구축" /></li>
                        <li><img src="/resources/images/company/history2009_11.gif" alt="대검찰청 수사자료관리시스템  암호화 개발" /></li>
                        <li><img src="/resources/images/company/history2009_06.gif" alt="한국산업단지공단 공장설립 온라인 시범구축사업" /></li>
                        <li><img src="/resources/images/company/history2009_05.gif" alt="대법원 재판지원 감정인등 시스템 구축사업" /></li>
                        <li><img src="/resources/images/company/history2009_03.gif" alt="서울시 세무종합 유지보수 사업" /></li>
                        <li><img src="/resources/images/company/history2009_02.gif" alt=" 법제처 법제정보서비스 안정화 2차사업" /></li>
                        <li><img src="/resources/images/company/history2009_02_02.gif" alt="법제처 정부입법 통합시스템 구축 4차사업축" /></li>
                        <li><img src="/resources/images/company/history2009_01_03.gif" alt="LG 데이콤 e-Biz서비스 개발 및 위탁운영 사업" /></li>
                        <li><img src="/resources/images/company/history2009_01_02.gif" alt="전국산업단지현황통계 온라인 조사시스템 구축" /></li>
                        <li><img src="/resources/images/company/history2009_01.gif" alt="대법원 사용자지원센터(사법UHD)운영사업" /></li>
                    </ul>
                </div> 
                <div class="history-wrap" style="display: none;" >
                    <h4 class="history-img"><img src="/resources/images/company/history2008.gif" alt="2008년" /></h4>
                    <ul class="history-list">
                        <li><img src="/resources/images/company/history2008_09.gif" alt="대법원 인사시스템 구축사업" /></li>
                        <li><img src="/resources/images/company/history2008_07_02.gif" alt="기상청 역사기후자료DB구축사업" /></li>
                        <li><img src="/resources/images/company/history2008_07.gif" alt="법제처 법제정보서비스 안정화 사업" /></li>
                        <li><img src="/resources/images/company/history2008_05.gif" alt="대한항공 ERP 구축사업" /></li>
                        <li><img src="/resources/images/company/history2008_04.gif" alt="KTF  N-STEP 개발" /></li>
                        <li><img src="/resources/images/company/history2008_03.gif" alt="서울시 세무종합 유지보수 사업" /></li>
                        <li><img src="/resources/images/company/history2008_01_02.gif" alt=" 대법원 사용자지원센터(사법UHD)운영사업" /></li>
                        <li><img src="/resources/images/company/history2008_01.gif" alt=" 전국산업단지현황통계 온라인 조사시스템 구축" /></li>
                        <br>
                    </ul>
                    <h4 class="history-img"><img src="/resources/images/company/history2007.gif" alt="2007년" /></h4>
                    <ul class="history-list">
                        <li><img src="/resources/images/company/history2007_08.gif" alt="대교문구 프랜차이즈 시스템 개발" /></li>
                        <li><img src="/resources/images/company/history2007_06.gif" alt="기상청 종합기상정보시스템 2차년 구축" /></li>
                        <li><img src="/resources/images/company/history2007_05_02.gif" alt="법제처 법령해석 정보화 시스템 고도화" /></li>
                        <li><img src="/resources/images/company/history2007_05.gif" alt="한국산업단지공단 FEMIS 통합유지보수사업" /></li>
                        <li><img src="/resources/images/company/history2007_03.gif" alt="서울시 세무종합 유지보수 사업" /></li>
                        <li><img src="/resources/images/company/history2007_01.gif" alt=" LG 데이콤 e-Biz서비스 개발 및 위탁운영 사업" /></li>
                    </ul>
                </div>
                <div class="history-wrap" style="display: none;" >
                    <h4 class="history-img"><img src="/resources/images/company/history2006.gif" alt="2006년" /></h4>
                    <ul class="history-list">
                        <li><img src="/resources/images/company/history2006_11.gif" alt=" 한국전산원 이용관리시스템 구축" /></li>
                        <li><img src="/resources/images/company/history2006_07.gif" alt="LGT 차세대 CSBS 시스템 개발" /></li>
                        <li><img src="/resources/images/company/history2006_05.gif" alt=" 대검찰청 형사사법 통합정보체계 구축 사업 참여" /></li>
                        <li><img src="/resources/images/company/history2006_04.gif" alt="파워콤 XCION 개발 및 유지보수" /></li>
                        <br>
                    </ul>
                    <h4 class="history-img"><img src="/resources/images/company/history2005.gif" alt="2005년" /></h4>
                    <ul class="history-list">
                        <li><img src="/resources/images/company/history2005_12.gif" alt=" SKC 생산관리 시스템 개발  " /></li>
                        <li><img src="/resources/images/company/history2005_09.gif" alt="풀무원   FMS 운영 및 유지보수" /></li>
                        <br>
                    </ul>
                    <h4 class="history-img"><img src="/resources/images/company/history2004.gif" alt="2004년" /></h4>
                    <ul class="history-list">
                        <li><img src="/resources/images/company/history2004_03.gif" alt="하나로통신  시외/국제 빌링시스템 개발 및 운영" /></li>
                        <li><img src="/resources/images/company/history2004_06.gif" alt="데이콤 웹하드,전자지불 시스템 개발 및 운영" /></li>
                        <br>
                    </ul>
                    <h4 class="history-img"><img src="/resources/images/company/history2003.gif" alt="2003년" /></h4>
                    <ul class="history-list">
                        <li><img src="/resources/images/company/history2003_12.gif" alt="용인송담대학교 종합정보시스템 개발" /></li>
                        <li><img src="/resources/images/company/history2003_05.gif" alt="행자부 주민망센터 구조개선 사업 구축" /></li>
                        <li><img src="/resources/images/company/history2003_03.gif" alt="(주)장메이트정보기술 회사설립" /></li>
                    </ul>
                </div> 
            </div>
            <div class="content" style="display:none;">
                <h1><b>조직도</b></h1>
                <hr>
                <div class="sub-title">파트별 전문가들로 구성된 조직체계로 사업을 성공적으로 이끌겠습니다.</div>
                <div><img src="/resources/images/company/group_img.gif" alt="비인텍 임직원 모두는 한마음 한뜻으로 
        모두가 함께 노력해 나가고 있습니다" /></div>
                <div class="mgB30"><img src="/resources/images/company/group_img02.gif" alt="조직도" /><br />
                  <br />
                  <br />
                </div>
            </div>
            <div class="content" style="display:none;">
                <h1><b>오시는길</b></h1>
                <hr>
                <div class="sub-title">더조은 컴퍼니는 항상 고객을 맞이할 준비가 되어있습니다.</div>
                <ul type="none">
                    <li class="mgB30">
                        <div id="beintech_Map" style="border:1px solid #000; width:740px; height:400px; margin:20px;">
                            <img style="width: 738px; height: 398px;'" src="/resources/images/company/location.jpg" />
                        </div>
                    </li>
                    <li><img src="/resources/images/company/map_img01.gif" alt="주소 :152-848  서울시 구로구 구로3동 222-8 코오롱 디지털타워 빌 2차 1105호     
        전화번호: 02-2081-1818" /></li>
                    <li><img src="/resources/images/company/map_img02.gif" alt="2호선 구로디지털단지역 3번출구: 포장마차 골목길 진입 -> 이마트 정문앞 맞은편 뒷건물(코오롱디지털타워빌란트1차 뒷건물) -> 
        코오롱디지털타워빌란트 2차,7호선 남구로역 2번출구" /></li>
                    <li><img src="/resources/images/company/map_img03.gif" alt="버스: 5536, 5616, 6004,구로09, 영등포01  " /></li>
                    <li><img src="/resources/images/company/map_img04.gif" alt="남부순환로 시흥IC에서 여의도방향 시흥대로로 진출->삼거리에서 좌회전 -> 외환은행 (대륭포스트타워1차)사거리에서 좌회전->   
        좌회전 -> 100여미터 앞 좌측에 주차장 " /></li>
                </ul>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp"%>
</body>
</html>