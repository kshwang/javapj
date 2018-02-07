<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="ko">
<html>
<head>
<meta charset="utf-8" />
<meta name="Keywords" content="게시판 새글쓰기" />
<meta name="Description" content="게시판 새글쓰기" />

<title>${boardnm }</title>


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
/* h2 {    margin: 9px 0 0 0;    padding: 0;    font-size: 13px;
    border-bottom: 1px solid #ebebeb;
}

td {    border: none;}

textarea {    width: 99%;}

form-group {    display: none;}
wrap {    margin: 0 auto;
    padding: 0;
    width: 1000px;
}
url-navi {
    margin: 0;
    padding-top: 10px;
    padding-bottom: 8px;
    font-size: 11px;
    color: #666;
    border-bottom: 1px solid #DAEAAA;
}

content h1 {
    margin: 9px 0 9px 0;
    padding: 7px 0 7px 12px;
    font-size: 15px;
    
} */
table { margin-right: auto; margin-left: auto; width: 555px;}
      /*   table tr {background: #36CBD4; } */
        table td { text-align: center;}
        .sthead {  border-top: solid, 2px, black;  border-bottom: solid, 2px, black; }
        url-navi {
    margin: 0;
    padding-top: 10px;
    padding-bottom: 8px;
    font-size: 11px;
    color: #666;
    border-bottom: 1px solid #DAEAAA;
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
<!--     <script type="text/javascript" src="/resources/js/fliplightbox.min.js"></script>
 -->
<script src="/resources/js/functions.js"></script>
<!-- 
    <script type="text/javascript">$('.portfolio').flipLightBox()</script> -->

<script>
	$(document)
			.ready(
					function(evnet) {
						$('#golist')
								.click(
										function(event) {
											location.href = "/pj_mn40/pj_mn41/${boardcd}?searchWord=${searchWord}&curPage=${curPage}";/* "articlelist/${boardcd}?searchWord=${searchWord}&curPage=${curPage}" ;*/
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
                        <p>이번 달 교육입니다. <br>
                        </p>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>
                <!-- 본문 시작 -->
                <h1>${boardnm }</h1>
                <div id="bbs">
                    <h2 align=center>교육 등록</h2>
                    <form id="writeForm" action="/pj_mn40/pj_mn42"
                        method="post" enctype="multipart/form-data"
                        onsubmit="return check()">
                        <p style="margin: 0; padding: 0;">
                            <input type="hidden" name="boardcd"
                                value="${boardcd }" />
                        </p>
                        <table id="write-form">
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="title"
                                    size="50" /></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <textarea name="content" rows="17" style="width:384px; height:300px;"></textarea>
                                </td>
                            </tr>

                            <tr>
                                <td>파일첨부</td>
                                <td><input type="file"
                                    name="upload" /></td>
                            </tr>
                        </table>
                        <div
                            style="text-align: center; padding-bottom: 15px;">
                            <input type="submit" value="전송" /> 
                            <input type="button" value="목록" id="golist" />
                        </div>
                    </form>
                </div>
                <!--  본문 끝 -->

            </div>
            <!-- content 끝 -->

        </div>
        <!--  container 끝 -->

        <%--  <div id="sidebar">
            <%@ include file="bbs-menu.jsp"%>
        </div>

        <div id="extra">
            <%@ include file="extra.jsp"%>
        </div> --%>

        <div id="footer">
            <%@ include file="../footer.jsp"%>
        </div>

    </div>


</body>
</html>
