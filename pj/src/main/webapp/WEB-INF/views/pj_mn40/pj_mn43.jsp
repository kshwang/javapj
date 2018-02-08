<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<html>
<head>
<meta charset="utf-8" />
<meta name="Keywords" content="게시판 상세보기" />
<meta name="Description" content="게시판 상세보기" />

<title>내용</title>

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

div fl {
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

div.fl {
  
     text-align: right;
    margin-right: auto;
    margin-left: auto;
    width: 1140px;
        
   
}
h6{
    text-align: right;
    margin-right: auto;
    margin-left: auto;
    width: 1140px;
    }
    p{
    text-align: center;
    }
div.fr {

     
    margin-right: auto;
    margin-left: auto;
    width: 1370px;
        text-align: center;
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
   <!--  <script src="/resources/js/ajaxsetup.js"><!-- jquery 아래에 위치해야 함 --></script>
-->

<script>
        $(document).ready( function(event){
        	$('tr[articleno]').click( function(event){
        		var articleno = $(this).attr('articleno');
        		location.href = '/pj_mn40/pj_mn43/' + articleno + location.search; 
        	});
        	
        
        });
    </script>

<script>
        var goView = function( articleno ) {
        	location.href = '/pj_mn40/pj_mn43/'+ articleno + location.search;
        };
        
     /*    var goModify = function( ){
        	location.href = '/board/articlemodify/${boardcd}/${articleno}'; 
        }; */
       /*  
        var goDelete = function( ){ 
        	// post 로 처리해야함.
        	// post 처리하는 방법에는 1. ajax. 2. form을 이용하는 방법.
            var f = document.createElement('form');
        	f.setAttribute('method', 'post');
        	f.setAttribute('action', '/board/articledelete/${boardcd}/${articleno}');
        	f.setAttribute('enctype', 'application/x-www-form-urlencoded');
        	
        	document.body.appendChild( f );
        	
        	f.submit();
        };
         */
        var goList = function( curPage, redirect ) {
        	if( redirect === false )
                location.href = '/pj_mn40/pj_mn43/${articleno}?curPage='+ curPage;
        	else
        		location.href = '/pj_mn40/pj_mn41?curPage='+ curPage;
        };
        
        var goWrite = function( ) {
        	location.href = '/pj_mn40/pj_mn42';
        };
        
        var download = function( filetemp, fileorig ) {
        	// post 로 요청. ajax / form
        	var f  = document.createElement('form');
        	f.setAttribute('method', 'post');
        	f.setAttribute('action', '/download');
        	f.setAttribute('enctype', 'application/x-www-form-urlencoded');
        	
        	var i = document.createElement('input');
        	i.setAttribute('type', 'hidden');
        	i.setAttribute('name', 'filetemp');
        	i.setAttribute('value', filetemp);            
            f.appendChild(i);
        	
            var i = document.createElement('input');
            i.setAttribute('type', 'hidden');
            i.setAttribute('name', 'fileorig');
            i.setAttribute('value', fileorig);            
            f.appendChild(i);
        	
        	document.body.appendChild(f);
        	
        	f.submit();
        };
      
    </script>

</head>
<body>

    <div id="wrap">

        <div id="header">
            <%@ include file="../header.jsp"%>
        </div>

        <%--     <div id="main-menu">
        <%@ include file="../inc/main-menu.jsp" %>
    </div> 
 --%>
        <div id="container">

            <div id="content" style="min-height: 800px;">
                <div id="url-navi">BBS</div>

                <!-- 본문 시작 -->
                <h1>${boardnm }</h1>

                <c:if test="${not empty msg }">
                    <!-- 오류 message 출력 -->
                    <p style="color: red;">${msg }</p>
                </c:if>

                <div id="bbs">
                    <table>
                        <tr>
                            <th style="text-align: left; width: 70px;">교육
                                </th>
                            <th style="text-align: center; color: #555;">${thisArticle.title }</th>
                            <th style="width: 50px;">DATE</th>
                            <th style="width: 130px; color: #555; text-align: right;"><fmt:formatDate
                                    pattern="yyyy-MM-dd"
                                    value="${thisArticle.regdate }" /></th>
                        </tr>
                    </table>

                    <div id="gul-content" >
                        <h6>작성자 ${thisArticle.email }, 조회수
                            ${thisArticle.hit }</h6>
                        <p>${thisArticle.content }</p>
                        <p id="file-list" style="text-align: right;">
                            <c:forEach var="file"
                                items="${attachFileList }"
                                varStatus="status">
                                <a
                                    href="javascript:download('${file.filenametemp }', '${file.filenameorig }')">${file.filenameorig }</a>
                                <br />
                            </c:forEach>
                        </p>
                    </div>

                    <%-- 	<!--  덧글 반복 시작 -->
                <div id="commentlist">
                	<c:forEach var="comment" items="${commentList }" varStatus="status">	
                        <%@ include file="articleview-commentlistbody.jsp" %>
                	</c:forEach>
                </div>
            	<!--  덧글 반복 끝 --> --%>

                    <!-- <div id="addComment">
                    
                    <div>덧글의 타입을 선택하세요.
                        <label><input type="radio" name="memotype" value="text" checked="checked" />text</label>
                        <label><input type="radio" name="memotype" value="html" />html</label>
                    </div>
            		<div>
            			<textarea name="memo" rows="7" cols="50" ></textarea>
            		</div>
            		<div style="text-align: right;">
            			<input type="button" value="덧글남기기" />
            		</div>
            	</div> -->

                    <div id="next-prev">
                        <c:if test="${nextArticle != null }">
                            <p>
                                다음글 : <a
                                    href="javascript:goView( ${nextArticle.articleno } )">${nextArticle.title }</a>
                            </p>
                        </c:if>
                        <c:if test="${prevArticle != null }">
                            <p>
                                이전글 : <a
                                    href="javascript:goView( ${prevArticle.articleno } )">${prevArticle.title }</a>
                            </p>
                        </c:if>
                    </div>

                    <div id="view-menu">
                        <div class="fl">
                            <input type="button" value="수정"
                                onclick="javascript:goModify();" /> <input
                                type="button" value="삭제"
                                onclick="javascript:goDelete();" />
                        </div>

                        <div class="fr">
                            <c:if test="${nextArticle != null }">
                                <input type="button" value="다음글"
                                    onclick="javascript:goView( ${nextArticle.articleno } );" />
                            </c:if>
                                <input type="button" value="목록"
                                onclick="javascript:goList( ${curPage } );" />
                            <c:if test="${prevArticle != null }">
                                <input type="button" value="이전글"
                                    onclick="javascript:goView( ${prevArticle.articleno } );" />
                            </c:if>
                        
                        
                        </div>
                    </div>

                    <table id="bbs" style="clear: both;">
                        <tr>
                            <th style="width: 60px; text-align: center;">NO</th>
                            <th style="text-align: center;">교육 목록</th>
                            <th style="width: 100px; text-align: center;">날짜</th>
                            <th style="width: 60px;">조회수</th>
                        </tr>

                        <!--  반복 구간 시작 -->
                        <c:forEach var="training" items="${articleList }"
                            varStatus="status">
                            <tr articleno="${training.articleno}">
                                <!--  사용자 속성 추가: articleno -->
                                <td style="text-align: center;"><c:choose>
                                        <c:when
                                            test="${articleno == training.articleno }">
                                            <img
                                                src="/resources/images/arrow.gif"
                                                alt="현재글" />
                                        </c:when>
                                        <c:otherwise>
                					${no - status.index }
                				</c:otherwise>
                                    </c:choose></td>
                                <td><span>${training.title}</span> <c:if
                                        test="${training.attachFileNum > 0 }">
                                        <img src="/resources/images/attach.png"
                                            alt="첨부파일" />
                                    </c:if> </td>
                                <td style="text-align: center;"><fmt:formatDate
                                        pattern="yyyy-MM-dd"
                                        value="${training.regdate }" /></td>
                                <td style="text-align: center;">${training.hit }</td>
                            </tr>
                        </c:forEach>
                        <!--  반복 구간 끝 -->
                    </table>

                    <div id="paging" style="text-align: center;">
                        <c:if test="${prevLink > 0 }">
                            <a
                                href="javascript:goList( ${prevLink}, false )">[이전]</a>
                        </c:if>

                        <c:forEach var="i" items="${pageLinks }"
                            varStatus="stat">
                            <c:choose>
                                <c:when test="${curPage == i}">
                                    <span class="bbs-strong">${i }</span>
                                </c:when>
                                <c:otherwise>
                                    <a
                                        href="javascript:goList( ${i }, false)">${i }</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${nextLink > 0 }">
                            <a
                                href="javascript:goList( ${nextLink }, false )">[다음]</a>
                        </c:if>
                    </div>


                    <div id="list-menu" style="text-align: right;">
                        <input type="button" value="새글쓰기"
                            onclick="goWrite()" />
                    </div>

                    <div id="search" style="text-align: center;">
                        <form id="searchForm" action="${actionurl}"
                            method="get" style="margin: 0; padding: 0;">
                            <p style="margin: 0; padding: 0;">

                                <input type="text" name="searchWord"
                                    value="${searchWord}" size="15"
                                    maxlength="30" /> <input
                                    type="submit" value="검색" />
                            </p>
                        </form>
                    </div>

                </div>
                <!--  본문 끝 -->

            </div>
            <!-- content 끝 -->

        </div>
        <!--  container 끝 -->

        <%--    <div id="sidebar">
        <%@ include file="bbs-menu.jsp" %>
    </div>
    
    <div id="extra">
        <%@ include file="../inc/extra.jsp" %>
    </div> --%>

        <div id="footer">
            <%@ include file="../footer.jsp"%>
        </div>
    </div>


</body>
</html>
