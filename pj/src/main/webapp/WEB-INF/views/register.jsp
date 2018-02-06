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
            width: 100px;
        }
        input[name="address"] {
            width: 300px;
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
        				$('input[name="passwd"]').focus();
        			}
                    else if ($('input[name="confirm"]').val() === ''){
                        alert('비밀번호확인을 입력하세요');
                        $('input[name="confirm"]').focus();
                    }
                    else if ($('select').val() === '0'){
                        alert('비밀번호질문을 선택하세요');
                        $('select').focus();
                    }
                    else if ($('input[name="q_answer"]').val() === ''){
                        alert('비밀번호답변을 입력하세요');
                        $('input[name="q_answer"]').focus();
                    }
                    else if ($('input[name="name"]').val() === ''){
                        alert('이름을 입력하세요');
                        $('input[name="name"]').focus();
                    }
                    else if ($('input[name="address"]').val() === ''){
                        alert('주소를 입력하세요');
                        $('input[name="address"]').focus();
                    }
        			else if ($('input[name="email"]').val() === ''){
                        alert('이메일을 입력하세요');
                        $('input[name="email"]').focus();
        			}
                    else if ($('input[name="mobile"]').val() === ''){
                        alert('전화번호를 입력하세요');
                        $('input[name="mobile"]').focus();
                    }
        			else if ($('input[name="passwd"]').val() !== $('input[name="confirm"]').val()) {
        				alert('비밀번호가 일치하지 않습니다');
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
        			$('input[name="userid"]').focus();
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
            		    	$('input[name="userid"]').focus();
            		    }
            		}).fail( function(xhr, textStatus, error ) {
            		    // 통신이 실패했을 때 이 함수를 타게 된다.
            		}).always( function(data, textStatus, xhr ) {
            		    // 통신이 실패했어도 성공했어도 이 함수를 타게 된다. 표출된 시계 감추기..
            		});
        		}
        	});
        	$('input[name="userid"]').keyup(function(event) {
        		$('#check').text('0');
        	});
        	$('input[name="passwd"], input[name="confirm"]').keyup(function(event) {
                if ($('input[name="passwd"]').val() === $('input[name="confirm"]').val()) {
                	$('#passwordcheck').html('비밀번호 일치');
                	$('#passwordcheck').css('color', 'green');
                }
                else {
                	$('#passwordcheck').html('<b>일치하지 않음</b>');
                	$('#passwordcheck').css('color', 'red');
                }
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
                        <td><label>비밀번호확인*</label></td>
                        <td><input type="password" name="confirm"><span id="passwordcheck"></span></td>
                    </tr>
                    <tr>
                        <td><label>비밀번호질문*</label></td>
                        <td>
                            <select name="q_no">
                                <option value="0">질문을 선택하세요</option>
                                <c:forEach var="q" items="${q_for_pw }" varStatus="status">    
                                    <option value="${q.q_no }">${q.q_st }</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>비밀번호답변*</label></td>
                        <td><input type="text" name="q_answer"></td>
                    </tr>
                    <tr>
                        <td><label>이름*</label></td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td><label>주소*</label></td>
                        <td><input type="text" name="address"></td>
                    </tr>
                    <tr>
                        <td><label>이메일*</label></td>
                        <td><input type="text" name="email"></td>
                    </tr>
                    <tr>
                        <td><label>전화번호*</label></td>
                        <td><input type="text" name="mobile"></td>
                    </tr>
                    <tr>
                        <td><label>회원등급</label></td>
                        <td>
                            <input type="radio" name="userclass" value="1">사원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="userclass" value="2" checked="checked">일반
                        </td>
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
