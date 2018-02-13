<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<html>
<head>
<meta charset="utf-8" />
<meta name="Keywords" content="게시판 상세보기" />
<meta name="Description" content="게시판 상세보기" />

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
    border-top: 6px solid rgba(150, 126, 126, 0.5);
    border-bottom: 6px solid rgba(150, 126, 126, 0.5);
}



td {
    padding-top: 5px;
    padding-bottom: 5px;
    border-bottom: silver 1px solid;
    text-align: center;
}

td a {
    color: #555;
    text-decoration: none;
}

span {
    cursor: pointer;
} 
span:hover{
color: #555;
    text-decoration: underline;
}

#bbs-strong {
    color: #FFA500;
    font-weight: bold;
}
tr[articleno] {
    cursor: pointer;
}
div.fl {
  
     text-align: right;
    margin-right: auto;
    margin-left: auto;
    width: 1140px;
        
   
}
h6{
font-size: 20px;
    text-align: right;
    margin-right: auto;
    margin-left: auto;
    width: 1140px;
    }
    

div.fr {     
    margin-right: auto;
    margin-left: auto;
    width: 1370px;
        text-align: center;
}

#next-prev{
    font-size: 15px;
    text-align: left;
    margin-right: auto;
    margin-left: auto;
    width: 1170px;
}

#map {
     margin-right: auto;
    margin-left: auto;
        width: 900px;
        height: 400px;
        background-color: grey;
      }
      
#file-list{
font-size: 15px;
    text-align: left;
    margin-right: auto;
    margin-left: auto;
    width: 1170px;

}
#gul-content{
height: 300px;
font-size: 20px;
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
<!-- <script src="/resources/js/map.js"></script> -->
<script type="text/javascript">
   <!--  <script src="/resources/js/ajaxsetup.js"><!-- jquery 아래에 위치해야 함 --></script>
-->
<script>;
var address = null;

  function initMap() { // 지도 요청시 callback으로 호출될 메서드 부분으로 지도를 맨처음 초기화하고, 표시해주는 함수
    
    var mapLocation = new google.maps.LatLng('37.655557', '127.060504'); // 게시글 DTO에서 위도값을 가져옴
    var  markLocation = new google.maps.LatLng('337.655557', '127.060504');
    var mapOptions = {
            center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
            zoom: 18, // 지도 zoom단계
            mapTypeId: google.maps.MapTypeId.ROADMAP
          };
          var map = new google.maps.Map(document.getElementById("map"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
              mapOptions);
            
          var size_x = 60; // 마커로 사용할 이미지의 가로 크기
          var size_y = 60; // 마커로 사용할 이미지의 세로 크기
            
          // 마커로 사용할 이미지 주소
          var image = new google.maps.MarkerImage( 'http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png',
                              new google.maps.Size(size_x, size_y),
                              '',
                              '',
                              new google.maps.Size(size_x, size_y));
            
          var marker;
          marker = new google.maps.Marker({
                 position: mapLocation, // 마커가 위치할 위도와 경도(변수)
                 map: map,
                 icon: image, // 마커로 사용할 이미지(변수)
                 title: "교육장" // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
          });
          google.maps.event.addDomListener(window, 'load', initMap);
     
  }
</script>

<script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCIjE95EEaou7VAOu1Mmod_HbvFQguQh7U&callback=initMap">
</script>

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
        var goApplyCancel = function(){
        	if (confirm("정말 취소하시겠습니까?") == true){    //확인
        		 var f = document.createElement('form');
              	f.setAttribute('method', 'post');
              	f.setAttribute('action', '/pj_mn40/deleteapply');
              	f.setAttribute('enctype', 'application/x-www-form-urlencoded');
              	
              	var i = document.createElement('input');
              	i.setAttribute('type', 'hidden');
              	i.setAttribute('name', 'articleno');
              	i.setAttribute('value', ${articleno});            
                  f.appendChild(i);
                  
                  var i = document.createElement('input');
              	i.setAttribute('type', 'hidden');
              	i.setAttribute('name', 'curPage');
              	i.setAttribute('value', ${curPage });            
                  f.appendChild(i);
              	
              	document.body.appendChild( f );
              	
              	f.submit();
        	    document.form.submit();
        	}else{   //취소
        	    return;
        	}
        	};


        
        var goApply = function(){
        	if(${empty user}===true){
                alert('로그인하세요');
                location.href = "/login";
            }
            else {
            	alert('등록되었습니다');
                location.href = "/pj_mn40/pj_mn43/insertapply";
            	 var f = document.createElement('form');
            	f.setAttribute('method', 'post');
            	f.setAttribute('action', '/pj_mn40/pj_mn43/insertapply');
            	f.setAttribute('enctype', 'application/x-www-form-urlencoded');
            	
            	var i = document.createElement('input');
            	i.setAttribute('type', 'hidden');
            	i.setAttribute('name', 'articleno');
            	i.setAttribute('value', ${articleno});            
                f.appendChild(i);
                
            	document.body.appendChild( f );
            	
            	f.submit(); 
            	$.ajax({
            	    url : '/rest/pj_mn40/pj_mn43/insertapply',
            	    data: {'articleno': ${articleno } },        // 사용하는 경우에는 { data1:'test1', data2:'test2' }
            	    type: 'post',       // get, post
            	    timeout: 30000,    // 30초
            	    dataType: 'json',  // text, html, xml, json, jsonp, script
            	    beforeSend : function() {
            	        // 통신이 시작되기 전에 이 함수를 타게 된다.
            	    }
            	}).done( function(data, textStatus, xhr ){
            	    // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
            	    if (data == 1) {
            	    	alert('등록되었습니다');
            	    	window.location.href = '/pj_mn40/pj_mn43/${articleno}';
            		}
            	    else {
            	    	alert('이미 신청하셨습니다');
            	    }
            	}).fail( function(xhr, textStatus, error ) {
            	    // 통신이 실패했을 때 이 함수를 타게 된다.
            	}).always( function(data, textStatus, xhr ) {
            	    // 통신이 실패했어도 성공했어도 이 함수를 타게 된다.
            	});

                
            }
        	
        };
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
        
        var goModify = function( ){
        	location.href = '/pj_mn40/pj_mnMD/${articleno}'; 
        }; 
       
          
     

        var goList = function( curPage, redirect ) {
        	if( redirect === false )
                location.href = '/pj_mn40/pj_mn43/${articleno}?curPage='+ curPage;
        	else
        		location.href = '/pj_mn40/pj_mn41?curPage='+ curPage;
        };
        
        var goWrite = function(){
        	if(${empty user}===true){
                alert('로그인하세요');
                location.href = "/login";
            }
            else {
                location.href = "/pj_mn40/pj_mn42";
            }
        	
        };
        
        var download = function( filetemp, fileorig ) {
        	// post 로 요청. ajax / form
        	var f  = document.createElement('form');
        	f.setAttribute('method', 'post');
        	f.setAttribute('action', 'pj_mn40/download');
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
               

                <c:if test="${not empty msg }">
                    <!-- 오류 message 출력 -->
                    <p style="color: red;">${msg }</p>
                </c:if>

                <div id="bbs">
                    <table>
                        <tr>
                           <th style="text-align: left; width: 70px;">${thisArticle.articleno }
                                </th>
                                <%--  <th style="text-align: left;">
                                    ${articleno }
                                    </th> --%>
                                
                            <th style="text-align: center; color: #555;">${thisArticle.title }</th>
                            <th style="width: 50px;">DATE</th>
                            <th style="width: 130px; color: #555; text-align: right;"><fmt:formatDate
                                    pattern="yyyy-MM-dd"
                                    value="${thisArticle.regdate }" /></th>
                        </tr>
                    </table>
                    <h6>작성자 ${thisArticle.userid}, 조회수
                            ${thisArticle.hit }</h6>  <!--gul-content안에 있던걸 위로 끌어 올림  -->
                    <div id="gul-content" >
                        
                        <p style="text-align: center;">${thisArticle.content }</p>
                      
                    </div>
                                  <p id="file-list" style="text-align: right;">
                            <c:forEach var="file"
                                items="${attachFileList }"
                                varStatus="status"> 첨부 파일 : 
                                <a
                                    href="javascript:download('${file.filenametemp }', '${file.filenameorig }')">${file.filenameorig }</a>
                                <br />
                            </c:forEach>
                        </p> <!--gul-content안에 있던걸 아래로 끌어 내림  -->
           
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
                         <input type="button" value="신청"
                                onclick="javascript:goApply();" /> 
                                
                                <input type="button" value="신청취소"
                                onclick="javascript:goApplyCancel();" /> 
                                
                              <input type="button" value="목록" id="apply"
                                onclick="javascript:goList( ${curPage } );" />
                                
                               
                            <input type="button" value="수정"
                                onclick="javascript:goModify();" />                 
                                              
                                <input type="button" value="삭제"
                                onclick="javascript:goDelete(${thisArticle.articleno });" />
                        
                        
                        </div>

                 
                    </div>

                    <table id="bbs" style="clear: both;">
                        <tr>
                            <th style="width: 60px; text-align: center;">NO</th>
                            <th style="text-align: center;">교육 목록</th>
                            <th style="width: 100px; text-align: center;">등록 날짜</th>
                            <th style="width: 100px; text-align: center;">마감일</th>
                            <th style="width: 60px;">조회수</th>
                        </tr>

                        <!--  반복 구간 시작 -->
                        <c:forEach var="training" items="${articleList}"
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
                					${training.articleno }
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
                                <td style="text-align: center;"><fmt:formatDate
                                        pattern="yyyy-MM-dd"
                                        value="${training.enddate }" /></td>
                                <td style="text-align: center;">${training.hit }</td>
                                
                            </tr>
                        </c:forEach>
                        <!--  반복 구간 끝 -->
                    </table>

                    <div id="paging" style="text-align: center;">
                        <c:if test="${prevLink > 0 }">
                            <a href="javascript:goList( ${prevLink}, false )">[이전]</a>
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

                     <c:choose>
                                <c:when test="${user.getUserclass() >1}">
                                <!-- 2.13 --> 
                                </c:when>
                                
                                <c:otherwise> 
                    <div id="list-menu" style="text-align: right;">
                        <input type="button" value="새글쓰기"
                            onclick="goWrite()" />
                    </div>
                     </c:otherwise>
                            </c:choose> 
        

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
  


 <h3 align="center">교육 장소</h3>
<div id="map"></div> 





        <div id="footer">
            <%@ include file="../footer.jsp"%>
        </div>
    </div>


</body>
</html>
