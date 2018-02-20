<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>자주 묻는 질문</title>

    <!-- Bootstrap -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/animate.css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/font-awesome.css">
    <link rel="stylesheet" href="/resources/css/jquery.bxslider.css">
    <link href="/resources/css/overwrite.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/set1.css" />
    <link href="/resources/css/style.css" rel="stylesheet">
    
    <style type="text/css">
        .QnA { text-align: left; border-top: grey solid 2px; border-bottom: grey solid 2px;}
    </style>
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    
      <%@ include file="../header.jsp"%>
    
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="portfolios">
                    <div class="text-center">
                        <h2>자주 묻는 질문</h2>
                        <p>자주 물으시는 질문을<br>
                        모아두었습니다.
                        </p>
                        
                        <div><a href="/pj_mn30/pj_mn31">질문 게시판으로</a></div>
                        <br>
                        <div id="qna">
                        <div class="QnA">01. 아이디와 비밀번호를 잊었습니다.</div>
                        <span class="answer">아이디 혹은 비밀번호를 잊으셨을 경우 <br> 
                                            <b><a href="/login">로그인</a></b>으로 들어가신 후에 하단의 아이디/비밀번호 찾기를<br>
                                            이용하시면 찾을 수 있습니다. 비밀번호힌트의 정답이 기억나지 않으시는 경우
                                            서비스 센터에 전화하시어 본인 확인이 가능하면 처리해 드리겠습니다.</span><br><br>
                        <div class="QnA">02. 채용 일정이 궁금합니다.</div>
                        <span class="answer">채용일정은 상반기에는 ?월 하반기에는 ?월에 모집일정이 잡혀 있으며<br>
                                            비정기적으로도 부족 인력을 모집하고 있습니다.
                                            <br>자세한 채용 관련 사항은 <b><a href="/pj_mn20/pj_mn21_jobs">입사지원</a></b> 페이지에서 확인 가능합니다.</span><br>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>
    
    
    
      <%@ include file="../footer.jsp"%>
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/resources/js/jquery-2.1.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/wow.min.js"></script>
    <script src="/resources/js/jquery.easing.1.3.js"></script>
    <script src="/resources/js/jquery.isotope.min.js"></script>
    <script src="/resources/js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="/resources/js/fliplightbox.min.js"></script>
    <script src="/resources/js/functions.js"></script>
    <script type="text/javascript">$('.portfolio').flipLightBox()</script>
  </body>
</html>