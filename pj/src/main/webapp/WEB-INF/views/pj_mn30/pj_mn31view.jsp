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
        .portfolio { width: 555px; margin-left: 292.500px;}
        table {  width: 555px;}
        table tr {background: #36CBD4; }
        table td { text-align: center;}
        .sthead {  border-top: solid, 2px, black;  border-bottom: solid, 2px, black; }
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
 -->    <script src="/resources/js/functions.js"></script>
<!--     <script type="text/javascript">$('.portfolio').flipLightBox()</script>
 -->    <script type="text/javascript">
    var goList = function(page) {
        location.href = "/pj_mn30/pj_mn31?searchWord=${searchWord}&curPage="
                + page;
    };

    /* var goView= function(articleno){
        location.href = '/board/articleview/${boardcd}/' + articleno + location.search;
    };

    var goWrite = function(){
        location.href = "/board/articlewrite/${boardcd}";
    }; */
    
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
                        </p>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>
    
    <div class="portfolio">
        <div class="container">
            <table>
                <tr>
                    <th style="width: 50px;">TITLE</th>
                    <th style="text-align: left;color: #555;">${board.title }</th>
                    <th style="width: 50px;">DATE</th>
                    <th style="width: 130px;color: #555;"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedt }" /></th>
                </tr>   
                </table>
            
                <div id="gul-content">
                    <h6>작성자 ${board.userid }, 조회수 ${board.hit }</h6>
                    <p>${board.content }</p>
                </div>
                
                <!--  덧글 반복 시작
                <div id="commentlist">
                    <c:forEach var="comment" items="${commentList }" varStatus="status">    
                    <%-- <%@ include file="qnaview-commentlistbody.jsp" %> --%>
                    </c:forEach>
                </div> -->
                <!--  덧글 반복 끝 -->
                
                <div id="addComment">
                    <div>
                        <textarea name="memo" rows="7" cols="50"></textarea>
                    </div>
                    <div style="text-align: right;">
                        <input type="button" value="덧글남기기" />
                    </div>
                </div>
                
                <div id="next-prev">
                    <c:if test="${nextQna != null }">
                        <p>다음글 : <a href="javascript:goView('${nextQna.bno }')">${nextQna.title }</a></p>
                    </c:if>
                    <c:if test="${prevQna != null }">
                        <p>이전글 : <a href="javascript:goView('${prevQna.bno }')">${prevQna.title }</a></p>
                    </c:if>
                </div>
                
                <div id="view-menu">
                    <div class="fl">
                        <input type="button" value="수정" onclick="goModify();" />
                        <input type="button" value="삭제" onclick="goDelete();" />
                    </div>
                    
                    <div class="fr">
                    <c:if test="${nextQna != null }">       
                        <input type="button" value="다음글" onclick="goView('${nextQna.bno }')" />
                    </c:if>
                    <c:if test="${prevQna != null }">           
                        <input type="button" value="이전글" onclick="goView('${prevQna.bno }')" />
                    </c:if>
                        <input type="button" value="목록" onclick="goList('${curPage }')" />
                        <input type="button" value="새글쓰기" onclick="goWrite()" />
                    </div>
                </div>
            
            
                <table id="bbs" style="clear: both;">
                    <tr>
                        <th>no.</th>
                        <th>title</th>
                        <th>userid</th>
                        <th>hit</th>
                        <th>date</th>
                    </tr>
                    
                    <!--  반복 구간 시작 -->
                    <c:forEach var="board" items="${boardlist }" varStatus="status">
                    <tr articleno="${board.bno }">
                        <td style="text-align: center;">
                            <c:choose>
                                <c:when test="${bno == board.bno }">
                                    <img src="/resources/images/arrow.gif" alt="현재글" />
                                </c:when>
                                <c:otherwise>
                                    ${no - status.index }
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="javascript:goView('${board.bno }')">${board.title }</a>
                            <c:if test="${board.commentNum > 0 }">
                                <span class="bbs-strong">[${board.commentNum }]</span>
                            </c:if>
                        </td>
                        <td style="text-align: center;">${board.userid }</td>
                        <td style="text-align: center;">${board.hit }</td>
                        <td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedt }" /></td>
                    </tr>
                    </c:forEach>
                    <!--  반복 구간 끝 -->
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
   
    
    
      <%@ include file="../footer.jsp"%>
    
   
  </body>
</html>