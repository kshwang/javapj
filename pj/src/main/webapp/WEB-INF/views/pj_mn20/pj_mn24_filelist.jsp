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
    }
    var fileList = function(  ){
    	window.location.href = '/pj_mn20/pj_mn24_filelist' ;
  };
  var goWrite = function(  ){
      window.location.href = '/pj_mn20/pj_mn21write' ;
};
    
    
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
            <div>회원 지원현황</div>
            <table>
                <tr class="sthead">
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
                        <td>${empfile.jobname }</td>
                        <td>${empfile.jobtitle } </td>
                        <td>${empfile.userid }</td>
                        <td>${empfile.phone }</td>
                        <td>${empfile.mail }</td>
                        <td>${empfile.address }</td>
                        <td>${empfile.url }</td>
                        <td>${empfile.fileno }</td>
                    </tr>
                  </c:forEach>
              </table>
               <br>
                <br>
                
            <div>비회원 지원현황</div>
             <table>
                <tr class="sthead">
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
                        <td>${empfile.jobname }</td>
                        <td>${empfile.jobtitle } </td>
                        <td>${empfile.userid }</td>
                        <td>${empfile.phone }</td>
                        <td>${empfile.mail }</td>
                        <td>${empfile.address }</td>
                        <td>${empfile.url }</td>
                        <td>${empfile.fileno }</td>
                    </tr>
                  </c:forEach>
              </table>
            <br>
            <br>
            
            <div id="paging" style="text-align: center;">
            <form id="" action="" method="post" enctype="application/x-www-form-urlencoded">
                        <c:choose>
                                <c:when test="${empty mgs}">
                                  <input type="button" value="삭제" onclick="javascript:goDelete();" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                  <input type="button" value="목록" onclick="javascript:goList( );" />
                                  &nbsp;&nbsp;&nbsp;&nbsp;
                                  <input type="button" value="새글쓰기" onclick="javascript:goWrite();" />
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