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
       var select = $('.select').val();
       var jobtitle=$('.jobtitle').val();
       var phone2=$('.phone2').val();
       var mail =$('.mail').val();
       var address = $('.address').val();
        if(select === '부서선택' ){
            alert('부서를 선택해주세요.');
            return false;
        }
        if(jobtitle ===''){
            alert('모집분야를 작성해주세요.');
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
        if(address === ''){
            alert('주소를 적어주세요.');
            return false;
        }
        else{
             alert('등록되었습니다.');
             $('form').attr('action','/pj_mn20/pj_mn21write');
        }
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
            <h3> 새글 등록</h3>
            <hr>

            <form id="" action="" method="post" enctype="application/x-www-form-urlencoded">
                <table>
                    <thead>
                        <tr>
                            <th colspan="2"><b>모집 정보 입력</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>모집부분</th>
                            <td>
                            <select class="select" name = "detpname">
                            <option >부서선택</option>
                                <c:forEach var="q" items="${detpname }" varStatus="status">    
                            <option value="${q.detpname }">${q.detpname }</option>
                        </c:forEach>
                            </select>
                            </td>

                        </tr>
                        <tr>
                            <th>모집분야</th>
                           <td><input class="jobtitle" type="text"
                                        size="20" name="detptitle"
                                        style="width: 304px;">
                           </td>
                        </tr>
                        <tr class="tr1" >
                        <th>상세 내용 </th>
                       <td class="td1" colspan="4">
                       <p>
                            <textarea cols="40" rows="25" name="detptitleinfo">
■ 업무내용
                               
■ 자격요건
                               
■ 우대요건

                               </textarea>
                               <!-- ■ 업무내용<br>
- 이커머스몰 온라인 매체 광고 컨설팅<br>
- 중대형몰 및 브랜드 업체 온라인 마케팅 컨설팅<br>
- 컨설팅에 필요한 제안서 작업 및 기획<br>
<br>
■ 자격요건<br>
- 1 ~ 5년 경력자 <br>
- 의사소통 원활하며 변화하는 광고시장에 대한 이해자<br>
- 외부 미팅 및 컨설팅에 거부감이 없는 자<br>
- MS Office 사용능력 우수자<br>
- 적극적인 마인드 및 긍정적 성격 보유자<br>
<br>
■ 우대요건<br>
- 온라인 광고 자격증 소지자<br>
- 광고대행사 출신으로 온라인 광고 경험자 <br>
- 해외온라인 광고 경험자<br>
- 광고 제안 및 기획 작성 능력 보유자<br>
- 장애인 및 보훈대상자<br> -->
                        </p>
                       </td>
                       </tr>
                        <tr>
                            <th>모집 기간</th>
                            <td>
                            <input class="period" type="text" name="detpperiod" value="채용시까지">
                             </td>
                        </tr>
                        <tr>
                            <th>지원</th>
                            <td>
                            <input class="empexpiry" type="text" name="detpexpiry" value="지원하기>">
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