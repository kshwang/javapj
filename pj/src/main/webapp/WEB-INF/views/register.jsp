<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eNno Bootstrap Template</title>

    <!-- Bootstrap -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/animate.css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/jquery.bxslider.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/set1.css" />
    <link href="/resources/css/overwrite.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        form label {
            width: 80px;
        }
    </style>
    <script src="/resources/js/jquery-2.1.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/wow.min.js"></script>
    <script src="/resources/js/jquery.easing.1.3.js"></script>
    <script src="/resources/js/jquery.isotope.min.js"></script>
    <script src="/resources/js/jquery.bxslider.min.js"></script>
    <script src="/resources/js/functions.js"></script>
    <script type="text/javascript">
        $(document).ready(function(event) {
        	$('#register').click(function(event) {
        		if ($('#check').text() === '1') {
        			if ($('input[name="passwd"]').val() === '') {
        				alert('비밀번호를 입력하세요');
        			}
        			else if ($('input[name="email"]').val() === ''){
                        alert('이메일을 입력하세요');
        			}
        			else {
        				alert('회원가입이 완료되었습니다.');
                        $('form').submit();
        			}
        		
        		}
        		else {
        			alert('아이디 중복체크하세요');
        		}
        	});
        	$('#checkuserid').click(function(event) {
        		var userid = $('input[name="userid"]').val();
        		if (userid === '') {
        			alert('아이디를 입력하세요');
        		}
        		else {
            		$.ajax({
            		    url : '/rest/checkuserid',  // 호출되는 서버 주소.
            		    data: {'userid':userid},  // 서버로 보내지는 데이터.사용하는 경우에는 { data1:'test1', data2:'test2' }
            		    type: 'post',       // request method: get, post
            		    timeout: 30000,    // 최대 대기 시간: 30초. 30초 이상이 되면 fail 부분이 실행됨.
            		    dataType: 'json',  // response로 넘어오는 데이터 형태: text, html, xml, json, jsonp, script
            		    beforeSend : function() {
            		        // 통신이 시작되기 전에 이 함수를 타게 된다. 화면에 시계 표출.
            		    }
            		}).done( function(data, textStatus, xhr ){
            		    if (data === 0) {
            		    	alert('사용가능');
            		    	$('#check').text('1');
            		    }
            		    else if (data === 1) {
            		    	alert('중복');
            		    	$('input[name="userid"]').val('');
            		    }
            		}).fail( function(xhr, textStatus, error ) {
            		    // 통신이 실패했을 때 이 함수를 타게 된다.
            		}).always( function(data, textStatus, xhr ) {
            		    // 통신이 실패했어도 성공했어도 이 함수를 타게 된다. 표출된 시계 감추기..
            		});
        		}
        	});
        	$('input[name="userid"]').change(function(event) {
        		$('#check').text('0');
        	});
        });
    </script>
  </head>
  <body>
    <%@ include file="header.jsp"%>


    <div style="height: 200px;">
        
    </div>
    <div class="container" align="center">
        <div class="register">
        <h1>회원가입</h1>
        <div style="width: 90%; padding: 40px">
            <form action="register" method="post" enctype="application/x-www-form-urlencoded">
                <table>
                    <tr>
                        <td><label>아이디*</label></td>
                        <td>
                            <input type="text" name="userid" placeholder="아이디를 입력하세요">
                            <input type="button" id="checkuserid" value="아이디 중복체크">
                            <span id="check" style="display:none;">0</span>
                        </td>
                    </tr>
                    <tr>
                        <td><label>비밀번호*</label></td>
                        <td><input type="password" name="passwd" placeholder="비밀번호를 입력하세요"></td>
                    </tr>
                    <tr>
                        <td><label>이름</label></td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td><label>이메일*</label></td>
                        <td><input type="text" name="email"></td>
                    </tr>
                    <tr>
                        <td><label>전화번호</label></td>
                        <td><input type="text" name="mobile"></td>
                    </tr>
                </table>
                <div style="padding: 30px;">
                    <input type="button" id="register" value="회원가입">
                    <input type="reset" value="초기화">
                </div>
            </form>
        </div>
    </div>
    <%@ include file="footer.jsp"%>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  </body>
</html>
