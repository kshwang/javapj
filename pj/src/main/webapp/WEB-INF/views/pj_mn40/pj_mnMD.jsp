<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html>
<head>
    <meta charset="utf-8" /> 
    <meta name="Keywords" content="게시판 수정하기 폼" />
    <meta name="Description" content="게시판 수정하기 폼" />
    
  
    
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
    width: 700px;
    border-spacing: 100px;
}
#write-form{
border-spacing: 100px;
}
/*   table tr {background: #36CBD4; } */
table tr {
    text-align: center;
}
table td {
    text-align: center;
    padding : 20px;
}
/* table tr {
padding: 15px;} */

.sthead {
    border-top: solid, 2px, black;
    border-bottom: solid, 2px, black;
}

url-navi {
    margin: 0;
    padding-top: 10px;
    padding-bottom: 8px;
    font-size: 11px;
    color: #666;
    border-bottom: 1px solid #DAEAAA;
}


</style>
    <script src="../../resources/js/jquery-3.1.1.js"></script>
    
     <!-- <script>
        $(document).ready( function(event){
        	$('div[attachfileno]').click( function(event){
        		
        		if( confirm("정말로 삭제하시겠습니까?") ) {
        			    var attachfileno = $(this).attr('attachfileno');
        			    
                        // ajax 호출
                        $.ajax({
                            url : '/pj_mn40/deleteattachfile'
                            , data: { 'attachfileno' : attachfileno }        // 사용하는 경우에는 { 'data1':'test1', 'data2':'test2' }
                            , type: 'post'      // get, post
                            , timeout: 30000    // 30초
                            , dataType: 'json'  // text, html, xml, json, jsonp, script
                        }).done( function(data, textStatus, xhr ){
                            // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                            if( data === 1) { // 삭제 성공
                                $('div[attachfileno="' + attachfileno + '"]').remove();
                            }
                            else { // 삭제 실패
                                alert('삭제 실패');
                            }
                        });        			
        		}
        		
        	});
        });
    </script>  -->
    <script>
    var goList = function(){
    	window.location.href="/pj_mn40/pj_mn41?searchWord=${searchWord}&curPage=1"
    }
    
    var goDelete = function(articleno){ 
        
        var f = document.createElement('form');
    	f.setAttribute('method', 'post');
    	f.setAttribute('action', '/pj_mn40/articledelete');
    	f.setAttribute('enctype', 'application/x-www-form-urlencoded');
    	
    	var i = document.createElement('input');
    	i.setAttribute('type', 'hidden');
    	i.setAttribute('name', 'articleno');
    	i.setAttribute('value', articleno);            
        f.appendChild(i);
        
        var i = document.createElement('input');
    	i.setAttribute('type', 'hidden');
    	i.setAttribute('name', 'curPage');
    	i.setAttribute('value', ${curPage });            
        f.appendChild(i);
    	
    	document.body.appendChild( f );
    	
    	f.submit();
    };
    </script>
    
    
</head>
<body>
 <%@ include file="../header.jsp"%>
    
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="portfolios">
                    <div class="text-center">
                        <h2>수정</h2>
                       
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>
				<!-- 본문 시작 -->
				
				<div id="bbs">
				
					<form id="modifyForm" action="${actionurl}" method="post" enctype="multipart/form-data" >
						<p style="margin: 0; padding: 0;">
							<input type="hidden" name="articleno" value="${articleno }" />							
							<input type="hidden" name="curPage" value="${curPage }" />
							<input type="hidden" name="searchWord" value="${searchWord }" />
						</p>
						<table id="write-form">
							<tr>
								<td><b>제목</td>
								<td><input type="text" name="title" size="60"
									value="${thisArticle.title }" /></td>
							</tr>
							<tr>
                                <td><b>내용</td>
								<td colspan="2"><textarea name="content" rows="17" 
                                style="width: 500px; height: 300px;  ">${thisArticle.content }</textarea>
								</td>
							</tr>
                            <tr>
                                <td>첨부 파일 목록</td>
                                <td>
                                    <c:forEach var="file" items="${attachFileList }" varStatus="status">
                                    <div attachfileno="${file.attachfileno }"> ${file.filenameorig } <b>X</b> </div>
                                    </c:forEach>
                                </td>
                            </tr>
							<tr>
								<td>파일첨부</td>
								<td><input type="file" name="upload" /></td>
							</tr>
						</table>
						<div style="text-align: center; padding-bottom: 15px;">
							<input type="submit" value="수정" /> 							
							<input type="button" value="목록" onclick="goList()" />
                             <input type="button" value="삭제"onclick="javascript:goDelete(${thisArticle.articleno });" /> 
						</div>
					</form>

				</div>
				<!-- bbs 끝 -->
				<!--  본문 끝 -->
			</div>
			<!-- content 끝 -->
		</div>
		<!--  container 끝 -->

	</div>


</body>
</html>
