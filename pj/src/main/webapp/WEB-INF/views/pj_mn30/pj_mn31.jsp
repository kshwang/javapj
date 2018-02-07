<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eNno Bootstrap Template</title>

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
/*         table { margin-left: 292.500px; width: 555px;} */
/*         table tr {background: #36CBD4; } */
/*         table td { text-align: center;} */
/*         .sthead {  border-top: solid, 2px, black;  border-bottom: solid, 2px, black; } */
        
        table { margin-left: auto; width: 1143px;}
        table tr th {
        text-align: center;
         background:#ebf5fc;
         border-bottom:  1px solid #5ea5d6;
         border-top: 3px solid #5ea5d6;}
        table td {
         text-align: center;
         border-bottom:  1px solid #adb1b4;
         padding: 10px;
         }
        .sthead {  border-top: solid, 2px, black;  border-bottom: solid, 2px, black; }
        .select{float: right;}
          hr {width: 1413px;} 
          .btu1{
          overflow:visible; 
          border: 0px;
          padding: 0px;
          margin: 0px;
          cursor: pointer;
          vertical-align: middle;
          text-align: left;
          background: none;}
    </style>
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/resources/js/jquery-2.1.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/wow.min.js"></script>
    <script src="/resources/js/jquery.easing.1.3.js"></script>
    <script src="/resources/js/jquery.isotope.min.js"></script>
    <script src="/resources/js/jquery.bxslider.min.js"></script>
<!--     <script type="text/javascript" src="/resources/js/fliplightbox.min.js"></script>
 -->    <script src="/resources/js/functions.js"></script><!-- 
    <script type="text/javascript">$('.portfolio').flipLightBox()</script> -->
    <script type="text/javascript">
    var goList = function(page) {
        location.href = "/pj_mn30/pj_mn31?searchWord=${searchWord}&curPage="
                + page;
    };

    var goView= function(bno){
        location.href = '/pj_mn30/pj_mn31view/' + bno;
    };
    var goWrite = function(){
    	if(${empty user}===true){
            alert('로그인하세요');
            location.href = "/login";
        }
        else {
            location.href = "/pj_mn30/pj_mn31write";
        }
    };
    </script>
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
                        <h2>Support</h2>
                        <p>이용에 궁금한 사항이나 문의 사항에 대해 <br>
                        질문해 주시면 성실하게 답해드리겠습니다
                        </p>
                        <div><a href="/pj_mn30/pj_mn32">자주묻는 질문</a></div>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>
    
    <div class="portfolio">
        <div class="container">
            <table>
                <tr class="sthead">
                    <th width="100px">no.</th>
                    <th width="443px">제목</th>
                    <th width="300px">아이디</th>
                    <th width="100px">조회수</th>
                    <th width="200px">작성일</th>
                </tr>
                
                <c:forEach var="board" items="${boardlist }" varStatus="status">
                    <tr>
                        <td>${no - status.index }</td>
                        <td><a href="javascript:goView('${board.bno }')">${board.title }</a>
                            <c:if test="${board.commentNum > 0 }">
                                <span class="bbs-strong">[${board.commentNum }]</span>
                            </c:if></td>
                        <td>${board.userid }</td>
                        <td>${board.hit }</td>
                        <td>${board.updatedt }</td>
                    </tr>
                </c:forEach>
                
                
            </table>
            
            <div id="paging" style="text-align: center;">

                        <c:if test="${prevLink > 0 }">
                            <a href="javascript:goList(${prevLink })">[이전]</a>
                        </c:if>

                        <c:forEach var="i" items="${pageLinks }"
                            varStatus="stat">
                            <c:choose>
                                <c:when test="${curPage == i}">
                                    <span class="bbs-strong">${i }</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:goList(${i })">${i }</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${nextLink > 0 }">
                            <a href="javascript:goList(${nextLink })">[다음]</a>
                        </c:if>

                    </div>
                    
                    
                    <div id="list-menu" style="text-align: right;">
                        <input type="button" value="새글쓰기"
                            onclick="goWrite()" />
                    </div>

                    <div id="search" style="text-align: center;">
                        <form id="searchForm" action="${url }"
                            method="get" style="margin: 0; padding: 0;">
                            <p style="margin: 0; padding: 0;">
                                <input
                                    type="text" name="searchWord"
                                    size="15" maxlength="30" value="${searchWord }"  /> <input
                                    type="submit" value="검색" />
                            </p>
                        </form>
                    </div>
                    
            </div>
        </div>
    </div>
    
    
      <%@ include file="../footer.jsp"%>
    
   
  </body>
</html>