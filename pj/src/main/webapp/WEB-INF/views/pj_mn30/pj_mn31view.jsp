<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>고객지원</title>

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
        /* .container { margin: 0px;}
        .portfolio { width: 555px; margin-left: 292.500px;}
        table {  width: 555px;}
        table tr {background: #36CBD4; }
        table td { text-align: center;}
        .sthead {  border-top: solid, 2px, black;  border-bottom: solid, 2px, black; }
        hr {width: 555px;} */
        
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
          
          #commentId {border-top: solid 1px #333; border-bottom: solid 1px #333; }
          
          
        
    </style>
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/resources/js/jquery-3.1.1.js"></script>
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
    // 게시판기능
    var goList = function(page) {
        location.href = "/pj_mn30/pj_mn31?searchWord=${searchWord}&curPage="
                + page;
    };

    var goView= function(bno){
        location.href = '/pj_mn30/pj_mn31view/' + bno;
    };
    var goWrite = function(){
    	if(${empty user}===true){
    		alert('로그인하세요');
            location.href = "/login";
    	}
    	else {
            location.href = "/pj_mn30/pj_mn31write";
    	}
    };
    var goModify = function(){
    	
    	var bno = ${bno};
        if(${empty user}){
            alert('권한이 없습니다. 로그인 하세요.');
            location.href = "/login";
        }
        else {

            $.ajax({
                url : '/pj_mn30/pj_mn31match'
                , data: JSON.stringify( {'bno':bno } )        // 사용하는 경우에는 JSON.stringify( { 'data1':'test1', 'data2':'test2' } )
                , type: 'post'       // get, post
                , timeout: 30000    // 30초
                , dataType: 'json'  // text, html, xml, json, jsonp, script
                , headers: {  'Accept': 'application/json', 'Content-Type': 'application/json' }
            }).done( function(data, textStatus, xhr ){
                if(data===1){
                    location.href = "/pj_mn30/pj_mn31modify/${bno}";
                }
                else {
                    alert('권한이 없습니다.');
                }
            }).fail( function(xhr, textStatus, error ) {
                // 통신이 실패했을 때 이 함수를 타게 된다.
                alert('error');
            }).always( function(data, textStatus, xhr ) {
                // 통신이 실패했어도 성공했어도 이 함수를 타게 된다.
            })
        }
    };
    
    var goDelete = function(){
    	var bno = ${bno};
    	if(${empty user}){
    		alert('권한이 없습니다. 로그인 하세요.');
            location.href = "/login";
    	}
    	else {

            $.ajax({
                url : '/pj_mn30/pj_mn31match'
                , data: JSON.stringify( {'bno':bno } )        // 사용하는 경우에는 JSON.stringify( { 'data1':'test1', 'data2':'test2' } )
                , type: 'post'       // get, post
                , timeout: 30000    // 30초
                , dataType: 'json'  // text, html, xml, json, jsonp, script
                , headers: {  'Accept': 'application/json', 'Content-Type': 'application/json' }
            }).done( function(data, textStatus, xhr ){
                if(data===1){
                    $.ajax({
                        url : '/pj_mn30/pj_mn31delete'
                        , data: JSON.stringify( {'bno':bno } )        // 사용하는 경우에는 JSON.stringify( { 'data1':'test1', 'data2':'test2' } )
                        , type: 'post'       // get, post
                        , timeout: 30000    // 30초
                        , dataType: 'json'  // text, html, xml, json, jsonp, script
                        , headers: {  'Accept': 'application/json', 'Content-Type': 'application/json' }
                    }).done( function(data, textStatus, xhr ){
                        if(data===1){
                            alert('삭제되었습니다.');
                            goList(1);
                        }
                    }).fail( function(xhr, textStatus, error ) {
                        // 통신이 실패했을 때 이 함수를 타게 된다.
                        alert('error');
                    }).always( function(data, textStatus, xhr ) {
                        // 통신이 실패했어도 성공했어도 이 함수를 타게 된다.
                    }) 
                }
                else {
                    alert('삭제 권한이 없습니다.');
                }
            }).fail( function(xhr, textStatus, error ) {
                // 통신이 실패했을 때 이 함수를 타게 된다.
                alert('error');
            }).always( function(data, textStatus, xhr ) {
                // 통신이 실패했어도 성공했어도 이 함수를 타게 된다.
            })
    	}
    	
    	
    };
    
    // 댓글 기능
    var commentModifyShowHide = function(commentno){
        $('div[commentno="'+commentno+'"] div.modify-comment').toggle();
    };
    var commentupdate = function(commentno){
        var memo = $('div[commentno="'+commentno+'"] .modify-comment-ta').val();
        
        if(${empty user}){
            alert('권한이 없습니다. 로그인 하세요.');
            location.href = "/login";
        }
        else {

            $.ajax({
                url : '/pj_mn30/pj_mn31matchc'
                , data: JSON.stringify( {'commentno':commentno } )        // 사용하는 경우에는 JSON.stringify( { 'data1':'test1', 'data2':'test2' } )
                , type: 'post'       // get, post
                , timeout: 30000    // 30초
                , dataType: 'json'  // text, html, xml, json, jsonp, script
                , headers: {  'Accept': 'application/json', 'Content-Type': 'application/json' }
            }).done( function(data, textStatus, xhr ){
                if(data===1){
                	 $.ajax({
                         url : '/pj_mn30/pj_mn31updatec'
                         , data: JSON.stringify( {'commentno':commentno , 'memo' : memo} )        // 사용하는 경우에는 JSON.stringify( { 'data1':'test1', 'data2':'test2' } )
                         , type: 'post'       // get, post
                         , timeout: 30000    // 30초
                         , dataType: 'json'  // text, html, xml, json, jsonp, script
                         , headers: {  'Accept': 'application/json', 'Content-Type': 'application/json' }
                     }).done( function(data, textStatus, xhr ){
                         if(data===1){
                        	 alert('수정되었습니다.')
                             $('#comment'+commentno).html(memo);
                         }
                     }).fail( function(xhr, textStatus, error ) {
                         // 통신이 실패했을 때 이 함수를 타게 된다.
                         alert('error');
                     }).always( function(data, textStatus, xhr ) {
                         // 통신이 실패했어도 성공했어도 이 함수를 타게 된다.
                     })
                }
                else {
                    alert('본인이 작성한 댓글만 수정 가능합니다.');
                }
            }).fail( function(xhr, textStatus, error ) {
                // 통신이 실패했을 때 이 함수를 타게 된다.
                alert('error');
            }).always( function(data, textStatus, xhr ) {
                // 통신이 실패했어도 성공했어도 이 함수를 타게 된다.
            })
        }
        
       
    };
    
    var commentdelete = function(commentno){
    	
    	if(${empty user}){
            alert('권한이 없습니다. 로그인 하세요.');
            location.href = "/login";
        }
        else {

            $.ajax({
                url : '/pj_mn30/pj_mn31matchc'
                , data: JSON.stringify( {'commentno':commentno } )        // 사용하는 경우에는 JSON.stringify( { 'data1':'test1', 'data2':'test2' } )
                , type: 'post'       // get, post
                , timeout: 30000    // 30초
                , dataType: 'json'  // text, html, xml, json, jsonp, script
                , headers: {  'Accept': 'application/json', 'Content-Type': 'application/json' }
            }).done( function(data, textStatus, xhr ){
                if(data===1){
                	if(confirm("정말로 삭제하시겠습니까?")){
                        $.ajax({
                            url : '/pj_mn30/pj_mn31deletec'
                            , data: JSON.stringify( {'commentno':commentno } )        // 사용하는 경우에는 JSON.stringify( { 'data1':'test1', 'data2':'test2' } )
                            , type: 'post'       // get, post
                            , timeout: 30000    // 30초
                            , dataType: 'json'  // text, html, xml, json, jsonp, script
                            , headers: {  'Accept': 'application/json', 'Content-Type': 'application/json' }
                        }).done( function(data, textStatus, xhr ){
                            // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                            
                            if(data === 1){// 삭제 성공
                                $('div.comments[commentno="'+commentno+'"]').remove();
                            }
                            else {// 삭제 실패
                                
                            }
                        }).fail( function(xhr, textStatus, error ) {
                            // 통신이 실패했을 때 이 함수를 타게 된다.
                            alert('error');
                        }).always( function(data, textStatus, xhr ) {
                            // 통신이 실패했어도 성공했어도 이 함수를 타게 된다.
                        })
                    }
                }
                else {
                    alert('본인이 작성한 댓글만 삭제가능합니다.');
                }
            }).fail( function(xhr, textStatus, error ) {
                // 통신이 실패했을 때 이 함수를 타게 된다.
                alert('error');
            }).always( function(data, textStatus, xhr ) {
                // 통신이 실패했어도 성공했어도 이 함수를 타게 된다.
            })
        }
        
        
    };

    
    $(document).ready(function(e){
    	
    	
    	
    	// .replaceAll(/\n/g, '<br>')
    	

        $('#insertc').click(function(e){
        	
            var memo = $('#addComment textarea').val();
            var bno = ${bno};  // 컨트롤러에서 넘겨 받는 값.
            
            // ajax 호출
            if(${empty user}){
            	alert('권한이 없습니다. 로그인 하세요.');
                location.href = "/login";
            }
            else {
            	$.ajax({
                    url : '/pj_mn30/pj_mn31insertc'
                    , data: JSON.stringify(  {'bno':bno, 'memo': memo}  )       // 사용하는 경우에는 { data1:'test1', data2:'test2' }
                    , type: 'post'       // get, post
                    , timeout: 30000    // 30초
                    , dataType: 'html'  // text, html, xml, json, jsonp, script
                        , headers: {'Accept': 'application/json', 'Content-Type':'application/json'}
                }).done( function(data, textStatus, xhr ){
                    // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                    
                    $('#commentlist').append(data);
                    $('#addComment textarea').val('');
                }).fail( function(xhr, textStatus, error ) {
                    // 통신이 실패했을 때 이 함수를 타게 된다.
                    alert('error');
                }).always( function(data, textStatus, xhr ) {
                    // 통신이 실패했어도 성공했어도 이 함수를 타게 된다.
                }); 
            }
            
        });
    });
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
            <table>
                <tr>
                    <th style="width: 50px;">제목</th>
                    <th style="text-align: left;color: #555;">${board.title }</th>
                    <th style="width: 50px;">작성일</th>
                    <th style="width: 130px;color: #555;"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedt }" /></th>
                </tr>   
                </table>
            
                <div id="gul-content">
                    <h6>작성자 ${board.userid } ㅣ 조회수 ${board.hit }</h6>
                    <p id="qnaVM">${board.content }</p>
                </div>
                <hr>
                <!--  덧글 반복 시작 -->
                <div id="commentlist">
                    <c:forEach var="comment" items="${commentList }" varStatus="status">  
                    <%@ include file="qnaview-commentlistbody.jsp" %>
                    </c:forEach>
                </div>
                <br>
                <!--  덧글 반복 끝 -->
                
                <div id="addComment">
                    <div>
                        <textarea name="memo" rows="2" cols="100"></textarea>
                    </div>
                    <div style="text-align: left;">
                        <input type="button" value="댓글 달기" id="insertc"/>
                    </div>
                </div>
                
                <div id="next-prev">
                    <c:if test="${nextQna != null }">
                        <p>다음글 : <a href="javascript:goView('${nextQna.bno }')">${nextQna.title }</a></p>
                    </c:if>
                    <c:if test="${prevQna != null }">
                        <p>이전글 : <a href="javascript:goView('${prevQna.bno }')">${prevQna.title }</a></p>
                    </c:if>
                </div>
                
                <div id="view-menu">
                    <div class="fl">
                        <input type="button" value="수정" onclick="goModify();" />
                        <input type="button" value="삭제" onclick="goDelete();" />
                    </div>
                    
                    <div class="fr">
                    <c:if test="${nextQna != null }">       
                        <input type="button" value="다음글" onclick="goView('${nextQna.bno }')" />
                    </c:if>
                    <c:if test="${prevQna != null }">           
                        <input type="button" value="이전글" onclick="goView('${prevQna.bno }')" />
                    </c:if>
                        <input type="button" value="목록" onclick="goList('${curPage }')" />
                        <input type="button" value="새글쓰기" onclick="goWrite()" />
                    </div>
                </div>
            
            
                <table id="bbs" style="clear: both;">
                    <tr>
                        <th width="100px">no.</th>
                        <th width="443px">제목</th>
                        <th width="300px">아이디</th>
                        <th width="100px">조회수</th>
                        <th width="200px">작성일</th>
                    </tr>
                    
                    <!--  반복 구간 시작 -->
                    <c:forEach var="board" items="${boardlist }" varStatus="status">
                    <tr articleno="${board.bno }">
                        <td style="text-align: center;">
                            <c:choose>
                                <c:when test="${bno == board.bno }">
                                    <img src="/resources/images/arrow.gif" alt="현재글" />
                                </c:when>
                                <c:otherwise>
                                    ${no - status.index }
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="javascript:goView('${board.bno }')">${board.title }</a>
                            <c:if test="${board.commentNum > 0 }">
                                <span class="bbs-strong">[${board.commentNum }]</span>
                            </c:if>
                        </td>
                        <td style="text-align: center;">${board.userid }</td>
                        <td style="text-align: center;">${board.hit }</td>
                        <td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedt }" /></td>
                    </tr>
                    </c:forEach>
                    <!--  반복 구간 끝 -->
                </table>
                    
            
            <div id="paging" style="text-align: center;">

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
                    
                    
                    <div id="list-menu" style="text-align: right;">
                        <input type="button" value="새글쓰기"
                            onclick="goWrite()" />
                    </div>

                    <div id="search" style="text-align: center;">
                        <form id="searchForm" action="${url }"
                            method="get" style="margin: 0; padding: 0;">
                            <p style="margin: 0; padding: 0;">
                                <input
                                    type="text" name="searchWord"
                                    size="15" maxlength="30" value="${searchWord }"  /> <input
                                    type="submit" value="검색" />
                            </p>
                        </form>
                    </div>
                    
            </div>
        </div>
   
    
    
      <%@ include file="../footer.jsp"%>
    
   
  </body>
</html>