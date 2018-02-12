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
    <script src="/resources/js/functions.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        $('.ok').click( function(){
        	var checkbox = $('.checkbox');
        	if($(checkbox[0]).prop('checked') === false){
        		alert('개인정보 수집 및 이용동의에 체크해주세요.');
        		return false;
        	}
        	if($(checkbox[1]).prop('checked') === false){
                alert('민감정보의 수집 및 이용동의에 체크해주세요.');
                return false;
            }
        	else{
        		 alert('완료되었습니다.');
        		 $('form').attr('action','/pj_mn20/pj_mn23');
        	}
        	 });
       $('.no').click( function(){
        	 $('form').attr('action','/pj_mn20/pj_mn21_jobs');
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
        .hr1 {width: auto;} 
        textarea {width: 839px; height: 175px;}
        
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
            <div id="post">

            <h1 class="join"> 입사 지원  </h1>
            <hr class="hr1">
            
            <h3>개인정보 수집 및 이용에 대한 안내</h3>
            <br>
            <br>
            <br>
             <ul>
            <li> 개인정보 수집 및 이용동의</li>
    <form action="" method="post" enctype="application/x-www-form-urlencoded">
    <input  type="hidden" name="title" value="${jobtitle}"/>
    <input class="detpno"  type="hidden" name="detpno" value="${detpno}"/>
        <p>
            <textarea cols="40" rows="25">
                1. 개인정보의 수집 및 이용 목적
                - 입사전형 진행, 입사지원서 수정, 자격요건의 확인, 합격여부 확인, 지원자와의 원활한 의사소통 경로 확보
                
                2. 수집하는 개인정보의 항목
                - 필수정보 : 성명, 이메일 주소, 전화번호(유/무선), 사진, 주소, 국적, 거주국, 출신학교, 학력, 전공, 경력사항(경력직), 병역 사항 (미필의 경우 미필 사유),
                보훈 사항(보훈 대상의 경우 보훈번호 포함), 장애사항(대상인 경우)
                - 선택정보 : 경력사항(신입), 자격사항, 수상내역
                3. 개인정보의 보유 및 이용기간
                - 입사지원자의 개인정보는 회사의 인력풀에 저장되어 채용이 필요한 경우 해당 인력풀에서 상시 채용을 위하여 이용됩니다.
                - 입사지원자가 개인정보의 삭제를 원하는 경우 지체 없이 해당 정보를 파기합니다. 다만, 관련 법령에 의해 보유가 허용된 정보는 법령이 정한 기간 동안 보관합니다.</textarea>
        </p>
        <div>
        
        <div><input class="checkbox" type="checkbox" name="agreement" > 개인정보 수집 및 이용에 동의 합니다.</div>
        <br>
        <br>
        <br>
        <br>
        </div>
             <li>민감정보의 수집 및 이용동의</li>
        <p> 
        
            <textarea cols="40" rows="25" >
                1. 개인정보의 수집 및 이용 목적
                - 입사전형 진행, 입사지원서 수정, 자격요건의 확인, 합격여부 확인, 지원자와의 원활한 의사소통 경로 확보
                
                2. 수집하는 개인정보의 항목
                - 필수정보 : 성명, 이메일 주소, 전화번호(유/무선), 사진, 주소, 국적, 거주국, 출신학교, 학력, 전공, 경력사항(경력직), 병역 사항 (미필의 경우 미필 사유),
                보훈 사항(보훈 대상의 경우 보훈번호 포함), 장애사항(대상인 경우)
                - 선택정보 : 경력사항(신입), 자격사항, 수상내역
                3. 개인정보의 보유 및 이용기간
                - 입사지원자의 개인정보는 회사의 인력풀에 저장되어 채용이 필요한 경우 해당 인력풀에서 상시 채용을 위하여 이용됩니다.
                - 입사지원자가 개인정보의 삭제를 원하는 경우 지체 없이 해당 정보를 파기합니다. 다만, 관련 법령에 의해 보유가 허용된 정보는 법령이 정한 기간 동안 보관합니다.</textarea>
        </p>
        
    <div>
        <div><input class="checkbox"  type="checkbox" name="agreement" > 민감정보의 수집 및 이용에 동의 합니다.</div>
        <br>
        <br>
        <br>
        <br>
        </div>
        <center><input class="ok" type="submit" value="동의 " >&nbsp;&nbsp;&nbsp;&nbsp;<input class="no" type="submit" value="동의하지 않습니다."></center>
    </form>
    </ul>
</div>
</div>
</div>



      <%@ include file="../footer.jsp"%>
    
 
  </body>
</html>