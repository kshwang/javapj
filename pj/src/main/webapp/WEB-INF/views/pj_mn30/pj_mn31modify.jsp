<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eNno Bootstrap Template</title>

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
    
    <style type="text/css">
        /* .portfolio { width: 555px; margin-left: 292.500px;}
        table {  width: 555px;}
        table tr {background: #36CBD4; }
        table td { text-align: center;}
        .sthead {  border-top: solid, 2px, black;  border-bottom: solid, 2px, black; }
        
        #qnatexta { width: 550px;} */
        
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
          
          #qnatexta { width: 700px;}
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
 -->    <script src="/resources/js/functions.js"></script>
<!--     <script type="text/javascript">$('.portfolio').flipLightBox()</script>
 -->    <script type="text/javascript">
    var goList = function() {
        location.href = "/pj_mn30/pj_mn31?searchWord=${searchWord}&curPage=${curPage}";
                
    };
    
    var goView= function(){
        location.href = '/pj_mn30/pj_mn31view/' + ${bno};
    };

    </script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    
      <%@ include file="../header.jsp"%>
    
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="portfolios">
                    <div class="text-center">
                        <h2>Support</h2>
                        <p>이용에 궁금한 사항이나 문의 사항에 대해 <br>
                        </p>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>
    
    <div class="portfolio">
        <div class="container">
            <div id="container">
            <div id="content" style="min-height: 800px;">

                <!-- 본문 시작 -->
                <div id="bbs">
                    <h2>수정</h2>
                    <form id="modifyForm" action="${actionurl }" method="post" enctype="multipart/form-data" >
                        <p style="margin: 0; padding: 0;">
                            <input type="hidden" name="bno" value="${bno }" />
                            <input type="hidden" name="curPage" value="${curPage }" />
                            <input type="hidden" name="searchWord" value="${searchWord }" />
                        </p>
                        <table id="write-form">
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="title" size="80"
                                    value="${thisBoard.title }" /></td>
                            </tr>
                            <tr>
                                <td colspan="2"><textarea name="content" rows="17" id="qnatexta">${thisBoard.content }</textarea>
                                </td>
                            </tr>
                            
                        </table>
                        <div style="text-align: center; padding-bottom: 15px;">
                            <input type="submit" value="전송" /> 
                            <input type="button" value="돌아가기" onclick="goView()" /> 
                            <input type="button" value="목록" onclick="goList()" />
                        </div>
                    </form>
                </div>
                <!--  본문 끝 -->

            </div>
            <!-- content 끝 -->
            
        </div>
        <!--  container 끝 -->
                    
        </div>
    </div>
   
    
    
      <%@ include file="../footer.jsp"%>
    
   
  </body>
</html>