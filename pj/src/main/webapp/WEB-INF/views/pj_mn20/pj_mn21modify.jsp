<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">

<body>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>채용 분야</title>

<!-- Bootstrap -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/animate.css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/font-awesome.css">
<link rel="stylesheet" href="/resources/css/jquery.bxslider.css">
<link href="/resources/css/overwrite.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
    href="/resources/css/normalize.css">
<link rel="stylesheet" type="text/css" href="/resources/css/demo.css">
<link rel="stylesheet" type="text/css" href="/resources/css/set1.css">
<link href="/resources/css/style.css" rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resources/js/jquery-2.1.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/wow.min.js"></script>
<script src="/resources/js/jquery.easing.1.3.js"></script>
<script src="/resources/js/jquery.isotope.min.js"></script>
<script src="/resources/js/jquery.bxslider.min.js"></script>

<script src="/resources/js/functions.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('.ok').click( function(){ 
      
             alert('등록되었습니다.');
             $('form').attr('action','/pj_mn20/pj_mn21modify');
     });
    $('.no').click( function(){
    	  window.location.href = '/pj_mn20/pj_mn21_jobs' ;
    });
    
    });
    </script>
<style type="text/css">
table {
    margin-left: auto;
    width: 1143px;
}

table tr th {
    text-align: center;
    background: #ebf5fc;
    border-bottom: 1px solid #5ea5d6;
    border-top: 3px solid #5ea5d6;
}

table td {
    border-bottom: 1px solid #adb1b4;
    padding: 10px;
}

.sthead {
    border-top: solid, 1px, black;
}

.select {
    float: left ;
}

thead {
    background-color: lightblue;
}

h3 {
    color: #31708f;
}

textarea{
    margin: 0px;
    width: 964px;
    height: 235px;
    }
</style>


</head><%@ include file="../header.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="portfolios">
                <div class="text-center">
                    <h2>채용 정보</h2>
                    <p>
                        스펙보다는 능력과 열정을 우선시합니다. <br>
                    </p>
                </div>
                <hr>
            </div>
        </div>
    </div>
</div>

<div class="portfolio">
    <div class="container">
        <div id="post">

            <h1 class="join">입사 지원</h1>
            <hr class="hr1">
            <h3> 수정</h3>
            <hr>

            <form id="" action="" method="post" enctype="application/x-www-form-urlencoded">
                <table>
                    <thead>
                        <tr>
                            <th colspan="2"><b>모집 정보 수정</th>
                               <c:if test="${not empty msg }">
                                <p style="color: red;">정보 수정에 실패했습니다.</p>
                                </c:if> 
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>모집부분</th>
                            <td>
                            <input type="hidden" name="detpno" value="${detp.detpno }"></input>
                            ${detp.detpname }
                            </td>

                        </tr>
                        <tr>
                            <th>모집분야</th>
                           <td><input class="jobtitle" type="text"
                                        size="20" name="detptitle" value="${detp.detptitle }"
                                        style="width: 304px;">
                           </td>
                        </tr>
                        <tr class="tr1" >
                        <th>상세 내용 </th>
                       <td class="td1" colspan="4">
                       <p>
                            <textarea cols="40" rows="25" name="detptitleinfo">
                              ${detp.detptitleinfo}
                               </textarea>
                        </p>
                       </td>
                       </tr>
                        <tr>
                            <th>모집 기간</th>
                            <td>
                            <input class="period" type="text" name="detpperiod" value="${detp.detpperiod}">
                             </td>
                        </tr>
                        <tr>
                            <th>지원</th>
                            <td>
                            <input class="empexpiry" type="text" name="detpexpiry" value="${detp.detpexpiry}">
                             </td>
                        </tr>
                    </tbody>
                </table>
                <br> <br>
                <center>
                    <input class="ok" type="submit" name="확인" value="확인">
                    &nbsp;&nbsp;&nbsp;&nbsp;<input class="no" type="button"
                        name="취소" value="취소">
                </center>
            </form>


        </div>
    </div>
</div>


<%@ include file="../footer.jsp"%>


</body>
</html>