<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> 채용 분야</title>

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
       <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/resources/js/jquery-2.1.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/wow.min.js"></script>
    <script src="/resources/js/jquery.easing.1.3.js"></script>
    <script src="/resources/js/jquery.isotope.min.js"></script>
    <script src="/resources/js/jquery.bxslider.min.js"></script>
    <!-- <script type="text/javascript" src="/resources/js/fliplightbox.min.js"></script> -->
    <script src="/resources/js/functions.js"></script>
    <script type="text/javascript">
    var goList = function(  ) {
        window.location.href = '/pj_mn20/pj_mn21_jobs ';
    };
    var fileList = function(  ){
    	window.location.href = '/pj_mn20/pj_mn24_filelist' ;
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
  $(document).ready(function(event) {
	  $('.delete').click(function(event) {
          if (!confirm('삭제하시겠습니까?')) {
              return false;
          }
		    var no = $(this).attr('no');
        $.ajax({
            url : '/pj_mn20/deletefile'
            , data: {'uploadFileNo': Number(no)}        // 사용하는 경우에는 { 'data1':'test1', 'data2':'test2' }
            , type: 'post'       // get, post
            , timeout: 30000    // 30초
            , dataType: 'json'  // text, html, xml, json, jsonp, script
            , beforeSend : function() {
                // 통신이 시작되기 전에 이 함수를 타게 된다.
            }
        }).done( function(data, textStatus, xhr ){
            // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
            if (data === 1) {
            	// 삭제
            	$('td[no="'+ no +'"]').parent('tr').remove();
            }
            else {
            	// 삭제 안됨
            	alert('권한이 없습니다.');
            	window.location.href='/pj_mn20/pj_mn21_jobs';
            }
        }).fail( function(xhr, textStatus, error ) {
            // 통신이 실패했을 때 이 함수를 타게 된다.
        }).always( function(data, textStatus, xhr ) {
            // 통신이 실패했어도 성공했어도 이 함수를 타게 된다.
        }); 
	  });
  });
    
    
    </script>
    <style type="text/css">
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
          div.info{
          background: #36cbd430;
          }
          .delete {
            cursor: pointer;
          }
    </style>
    
   
  </head>
  <body>
    
      <%@ include file="../header.jsp"%>
    
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="portfolios">
                    <div class="text-center">
                        <h2>채용 정보</h2>
                        <p>스펙보다는 능력과 열정을 우선시합니다. <br>
                        </p>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>
    
     <div class="portfolio">
        <div class="container">
            <div class="emp">
            
            <h3>채용 현황</h3>
            <br>
           
            </div>
            <br>
            <div> 지원현황</div>
            <table>
                <tr class="sthead">
                    <th>  </th>
                    <th>모집부분</th>
                    <th>모집분야</th> 
                    <th>이름</th>
                    <th>핸드폰번호</th>
                    <th>mail</th>
                    <th>주소</th>
                    <th>url</th>
                    <th>포토폴리오</th>
                </tr>
                
                <c:forEach var="empfile" items="${empfilelist }" varStatus="status">
                    <tr>
                        <td class="delete" no="${empfile.uploadFileNo }">x</td>
                        <td>${empfile.emp.detpname }</td>
                        <td>${empfile.emp.detptitle } </td> 
                        <td>${empfile.name }</td>
                        <td>${empfile.phone }</td>
                        <td>${empfile.mail }</td>
                        <td>${empfile.address }</td>
                        <c:if test="${empfile.url == ''}">
                        <td>없음</td>
                        </c:if>
                        <c:if test="${empfile.url != ''}">
                        <td>${empfile.url }</td>
                        </c:if>
                        <c:if test="${empfile.fileSize == null}">
                        <td>없음</td>
                        </c:if> 
                        <c:if test="${empfile.fileSize != null}">
                        <td>
                        <a href="javascript:download('${empfile.fileNameTemp }','${empfile.fileNameOrig }')">
                        <img src="/resources/images/attach.png" alt="${empfile.fileNameOrig }"/>
                        </a>
                        </td>
                        </c:if>
                    </tr>
                  </c:forEach>
              </table>
               <br>
                <br>
              
            <div id="paging" style="text-align: center;">
            <form id="" action="" method="post" enctype="application/x-www-form-urlencoded">
                        <c:choose>
                                <c:when test="${empty mgs}">
                                  <input type="button" value="목록" onclick="javascript:goList( );" />
                                  &nbsp;&nbsp;&nbsp;&nbsp;
                                  <input type="button" value="지원현황" onclick="javascript:fileList();" />
                                </c:when>
                                
                                <c:otherwise>
                                  
                                </c:otherwise>
                            </c:choose>
                            </form>
                                <br>
                               <br>
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
            </div>
        </div>
    
    
    
      <%@ include file="../footer.jsp"%>
    
 
  </body>
</html>