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
    var goList = function( page ) {
        window.location.href = '/pj_mn20/pj_mn21_jobs?searchWord=${searchWord}&curPage=' + page;
    }
    var fileList = function(  ){
    	  window.location.href = '/pj_mn20/pj_mn24_filelist' ;
    };
    var goWrite = function(  ){
        window.location.href = '/pj_mn20/pj_mn21write' ;
  };
   var goModify = function(detpno ){
	    window.location.href = '/pj_mn20/pj_mn21modify/'+detpno ;
  };
   
  var goDelete = function(detpno){
	  if (!confirm('삭제하시겠습니까?')) {
		  return false;
	  }
/*	  if (${ not empty user.userclass} !== 0) {
		  alert('권한이 없습니다');
		  window.location.href = '/pj_mn20/pj_mn21_jobs';
		  return false;
	  }  */
	  var f = document.createElement('form');
      f.setAttribute('method', 'post');
      f.setAttribute('action', '/pj_mn20/delete');
      f.setAttribute('enctype', 'application/x-www-form-urlencoded');
      
      var i = document.createElement('input');
      i.setAttribute('type', 'hidden');
      i.setAttribute('name', 'detpno');
      i.setAttribute('value', detpno);
      f.appendChild(i);
      
      document.body.appendChild(f);
      f.submit();   
  }
  
  function selectEvent(selectObj) {
	  window.location.href = '/pj_mn20/pj_mn21_jobs?searchWord='+selectObj.value ;
  };
  
  $(document).ready(function() {
    
	  $('.detpexpiry').click( function(){
    	$(this).attr('href','/pj_mn20/pj_mn22_view');
    	var detpexpiry = $(this).parent('td').prev('td').prev('td').children('button').children('span').eq(0).text();
    	var detpno = $(this).parent('td').parent('tr').children('.detpno').val();
    	var f = document.createElement('form');
        f.setAttribute('method', 'post');
        f.setAttribute('action', '/pj_mn20/pj_mn22_view');
        f.setAttribute('enctype', 'application/x-www-form-urlencoded');
        
        var i = document.createElement('input');
        i.setAttribute('type', 'hidden');
        i.setAttribute('name', 'title');
        i.setAttribute('value', detpexpiry);
        f.appendChild(i);
        var i = document.createElement('input');
        i.setAttribute('type', 'hidden');
        i.setAttribute('name', 'detpno');
        i.setAttribute('value', detpno);
        f.appendChild(i);
        
        document.body.appendChild(f);
        f.submit();
    	return false;
    });
    
    $('.tr1').hide();
    $('.btu1').click( function(){
    	 $(this).parent('td').parent('tr').next('.tr1').toggle();
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
          div.info input{
          float: right;
          margin-right: 10px;
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
            
            <h3>채용 분야</h3>
            우수한 인재를 상시적으로 채용하고 있습니다 .
           <select class="select" name = "detpname" onChange="javascript:selectEvent(this)">
                <option >부서선택</option>
                <option value="">전체직군</option>
               <c:forEach var="q" items="${detpname }" varStatus="status">    
                            <option value="${q.detpname }">${q.detpname }</option>
                        </c:forEach>
            </select>
            

            </div>
            <br>
            <table>
                <tr class="sthead">
                    <th>모집부분</th>
                    <th>모집분야</th>
                    <th>모집기간</th>
                    <th>지원</th>
                </tr>
                
                <c:forEach var="detp" items="${deptlist }" varStatus="status">
                    <tr>
                     <input class="detpno"  type="hidden" name="detpno" value="${detp.detpno}"/>
                        <td>${detp.detpname }</td>
                        <td><button type="button" class="btu1" ><span>${detp.detptitle }</span> </button></td>
                        <td>${detp.detpperiod } </td>
                        <td>
                        <c:if test="${detp.detpperiod == '채용시까지'}">
                        <a class="detpexpiry" href="#">${detp.detpexpiry }</a>
                        </c:if>
                        </td>
                    </tr>
                    
                   <tr class="tr1" >
                   <td class="td1" colspan="4">
                   <div class="info">${detp.detptitleinfo }
                   <c:choose>
                   <c:when test="${empty mgs}">
                    </c:when>
                   <c:otherwise>
                   <input type="button" value="수정" onclick="javascript:goModify(${detp.detpno });" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" value="삭제" onclick="javascript:goDelete(${detp.detpno });" />
                    </c:otherwise>
                            </c:choose>
                   </div>
                   
                   </td>
                   </tr>
                   
                    
                </c:forEach>
                
                
            </table>
             
            <br>
            <br>
            
            <div id="paging" style="text-align: center;">
            <form id="" action="" method="post" enctype="application/x-www-form-urlencoded">
                        <c:choose>
                                <c:when test="${empty mgs}">
                                
                                </c:when>
                                
                                <c:otherwise>
                                  <input type="button" value="목록" onclick="javascript:goList( ${curPage } );" />
                                  &nbsp;&nbsp;&nbsp;&nbsp;
                                  <input type="button" value="새글쓰기" onclick="javascript:goWrite();" />
                                  &nbsp;&nbsp;&nbsp;&nbsp;
                                  <input type="button" value="지원현황" onclick="javascript:fileList();" />
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