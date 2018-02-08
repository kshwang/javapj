<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="Keywords" content="게시판 목록" />
<meta name="Description" content="게시판 목록" />

<!-- <title>교육</title> -->


<link href="../../resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../../resources/css/animate.css">
<link rel="stylesheet" href="../../resources/css/font-awesome.min.css">
<link rel="stylesheet" href="../../resources/css/jquery.bxslider.css">
<link rel="stylesheet" type="text/css"
    href="../../resources/css/normalize.css" />
<link rel="stylesheet" type="text/css"
    href="../../resources/css/demo.css" />
<link rel="stylesheet" type="text/css"
    href="../../resources/css/set1.css" />
<link href="../../resources/css/overwrite.css" rel="stylesheet">
<link href="../../resources/css/style.css" rel="stylesheet">






<style type="text/css">
table {
    margin-right: auto;
    margin-left: auto;
    width: 1143px;
    color: #555;
}

div#list-menu {
    text-align: right;
    margin-right: auto;
    margin-left: auto;
    width: 1143px;
}

th {
    color: #2e3532;
    border-top: 3px solid #109173;
    border-bottom: 3px solid #109173;
    
}

tr {
    cursor: pointer;
}

tr:hover {
    background: pink;
}

td {
    padding-top: 3px;
    padding-bottom: 3px;
    border-bottom: silver 1px solid;
    text-align: center;
}

td a {
    color: #555;
    text-decoration: none;
}

td a:hover {
    color: #555;
    text-decoration: underline;
}

#bbs-strong {
    color: #FFA500;
    font-weight: bold;
}

fl {
    float: left;
}

fr {
    float: right;
}
</style>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resources/js/jquery-2.1.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/wow.min.js"></script>
<script src="/resources/js/jquery.easing.1.3.js"></script>
<script src="/resources/js/jquery.isotope.min.js"></script>
<script src="/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript">
var goWrite = function(){
	  window.location.href = '/pj_mn40/pj_mn42' ;
	
};
</script>
<script>
        $(document).ready( function(event){
            $('tr[articleno]').click( function(event){
                var articleno = $(this).attr('articleno');
                location.href = '/pj_mn40/pj_mn43/' + articleno;               
            });
        
        });
    </script>
</head>
<body>

    <%@ include file="../header.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="portfolios">
                    <div class="text-center">
                        <h2>교육</h2>
                        <p>
                            이번 달 교육입니다. <br>
                        </p>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>

    <!-- 본문 시작 -->
    
    <div id="bbs">
        <table>
            <tr>
                <th style="width: 60px;text-align: center;">NO</th>
                <th style="text-align: center;">교육 목록</th>
                <th style="width: 100px;text-align: center;">날짜</th>
                <th style="width: 60px;">조회수</th>
            </tr>
            <!--  반복 구간 시작 -->
            <c:forEach var="training" items="${traininglist }" varStatus="status">
                    <tr articleno="${training.articleno }" >
                        <td>${training.articleno }</td>
                        <td>${training.title }</td>
                        <td align="center"><fmt:formatDate  value="${training.regdate }" pattern="yyyy-MM-dd"/>  </td>
                        <td>${training.hit }</td>
                    </tr>
                 </c:forEach>
            
            <!--  반복 구간 끝 -->
        </table>
           <br>
           <br>
           <br>
        <div id="paging" style="text-align: center;">
            <c:if test="${prevLink > 0 }">
                <a href="javascript:goList( ${prevLink} )">[이전]</a>
            </c:if>

            <c:forEach var="i" items="${pageLinks }" varStatus="stat">
                <c:choose>
                    <c:when test="${curPage == i}">
                        <span class="bbs-strong">${i }</span>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:goList( ${i} )">${i }</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${nextLink > 0 }">
                <a href="javascript:goList( ${nextLink} )">[다음]</a>
            </c:if>
        </div>

        <div id="list-menu" style="text-align: right;">
            <br> <input type="button" value="새글쓰기" onclick="javascript:goWrite();" />
        </div>

        <div id="search" style="text-align: center;">
            <form id="searchForm" action="${actionurl }" method="get"
                style="margin: 0; padding: 0;">
                <p style="margin: 0; padding: 0;">
                     <input type="text"
                        name="searchWord" value="${searchWord }"
                        size="15" maxlength="30" /> <input
                        type="submit" value="검색" />
                </p>
            </form>
        </div>

    </div>
    <!--  본문 끝 -->

    
    <!-- content 끝 -->
    
    <!--  container 끝 -->

    <div id="footer">
        <%@ include file="../footer.jsp"%>

    </div>

    

</body>
</html>
