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
    $('.ok').click( function(){ // 폼 유효성 검사
       var name = $('.name').val();
       var phone1=$('.phone1').val();
       var phone2=$('.phone2').val();
       var mail =$('.mail').val();
       var address = $('.address').val();
       var email = $('select[name="email"]').val();
       var selectphone =$('select[name="phone"]').val();
    	if(name === '' ){
            alert('이름을적어주세요.');
            return false;
        }
    	if(selectphone ==='선택'){
            alert('핸드폰번호를선택해주세요');
            return false;
        }
        if(phone1 ===''){
            alert('핸드폰번호를적어주세요');
            return false;
        }  
        if(phone2 ===''){
            alert('핸드폰번호를적어주세요');
            return false;
        }
        if(mail === ''){
        	alert('메일을 적어주세요.');
        	return false;
        } 
        if(email ==='선택해주세요'){
            alert('이메일 주소를 선택해주세요.');
            return false;
        }
        if(address === ''){
            alert('주소를 적어주세요.');
            return false;
        }
        else{
             alert('지원완료 되었습니다..');
             $('form').attr('action','/');
        }
         });
    $('.no').click( function(){
    	 if (!confirm('취소하시겠습니까?')) {
             return false;
         } 
    	$('form').attr('action','/pj_mn20/pj_mn21_jobs');
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
    float: right;
}

thead {
    background-color: lightblue;
}

h3 {
    color: #31708f;
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
            <h3>입사지원서 작성</h3>
            <hr>

            <form action="" method="post" enctype="application/x-www-form-urlencoded">
                <table>
                    <thead>
                        <tr>
                            <th colspan="2"><b>기본 정보 입력</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>지원분야</th>
                            <td><label>${jobtitle}</label></td>

                        </tr>
                        <tr>
                            <th>이름</th>
                            <c:choose>
                                <c:when test="${empty user}">
                                    <td><input class="name" type="text" size="20" name="name" style="width: 304px;"></td>
                                </c:when>
                                <c:otherwise>
                                    <td><label>${user.name }</label></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <th>핸드폰</th>
                            <c:choose>
                                <c:when test="${empty user}">
                                    <td><select name="phone">
                                            <option value="선택">선택</option>
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                            <option value="017">017</option>
                                    </select> <input class="phone1" type="text" name="phone1">
                                        - <input class="phone2" type="text" name="phone2"></td>
                                </c:when>
                                <c:otherwise>
                                    <td><label>${user.mobile }</label>
                                    </td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <th>주로 쓰는 메일</th>
                            <c:choose>
                                <c:when test="${empty user}">
                                    <td><input class="mail" type="text" name="mail"> 
                                            @
                                        <select name="email" style="width: 143px;">
                                            <option value="선택해주세요">선택해주세요</option>
                                            <option value="naver.com">naver.com</option>
                                            <option value="daum.net">daum.net</option>
                                            <option value="nate.com">nate.com</option>
                                    </select>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td><label>${user.email }</label>
                                    </td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <th>거주지</th>
                            <c:choose>
                                <c:when test="${empty user}">
                                    <td><input class="address"  type="text" size="20" name="address" style="width: 543px;" ></td>
                                </c:when>
                                <c:otherwise>
                                    <td><label>${user.address }</label>
                                    </td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <th>홈페이지 URL</th>
                            <td><input type="text" size="20" name="url" style="width: 543px;" ></td>
                        </tr>
                        <tr>
                            <th>이력서 파일첨부 & 포토폴리오 파일첨부</th>
                            <td>
                            <br><input type="file" name="file1" size="20" name="name" style="width: 25%;">
                            <br>
                                <ul>
                                    <li>이력서는 자유롭게 작성하셔서 등록해 주시기 바랍니다.</li>
                                    <li>저희는 지원자의 고유식별정보를 수집하지 않으므로
                                          이력서에 주민등록번호 등을 기록하지 않도록 유의하여 주시기
                                          바랍니다.</li>
                                    <li>파일 최대용량은 20MB입니다.</li>
                                    <li>파일은 최대 1개까지 첨부 가능합니다.*(여러개일경우압축해첨부해주세요.)</li>
                                    <li>hwp, doc, xls, ppt, docx,xlsx, pptx, pdf 형식의 파일만 첨부 가능합니다.</li>
                                </ul></td>
                        </tr>
                    </tbody>
                </table>
                <br> <br>
                <center>
                    <input class="ok" type="submit" name="확인" value="확인">
                    &nbsp;&nbsp;&nbsp;&nbsp;<input class="no" type="submit"
                        name="확인" value="취소">
                </center>
            </form>


        </div>
    </div>
</div>


<%@ include file="../footer.jsp"%>


</body>
</html>