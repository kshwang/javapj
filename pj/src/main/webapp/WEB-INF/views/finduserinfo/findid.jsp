<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>아이디 찾기 / 비밀번호 찾기</title>
    <style type="text/css">
        body {
            margin: 20px;
        }
        form table {
            margin: 0 auto;
        }
        form label {
            width: 80px;
            font-size: 12px;
        }
        form input[type="text"] {
            width: 120px;
        }
        #button {
            margin: 20px;
            text-align: center;
        }
        #button input {
            font-size: 12px;
        }
    </style>
    <script type="text/javascript" src="/resources/js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function(event) {
        	$('#button > input[type="button"]').click(function(event) {
        		var name = $('input[name="name"]').val();
        		var email = $('input[name="email"]').val();
        		var mobile = $('input[name="mobile"]').val();
        		if (name === ''||email === ''||mobile === '') {
        			alert('모든 정보를 입력하세요.');
        		}
        		else {
        		    $('form').submit();
        		}
        	});
        });
    </script>
</head>
<body>
    <c:if test="${not empty msg }">
        <p style="text-align:center; color: red; font-size:12px;"> ${msg } </p>
    </c:if>      
    <form action="findid" method="post" enctype="application/x-www-form-urlencoded">
        <table>
            <tr>
                <td><label>이름</label></td>
                <td><input type="text" name="name" /></td>
            </tr>
            <tr>
                <td><label>이메일</label></td>
                <td><input type="text" name="email" /></td>
            </tr>
            <tr>
                <td><label>전화번호</label></td>
                <td><input type="text" name="mobile" /></td>
            </tr>
        </table>
            <div id="button">
                <input type="button" value="아이디 찾기" />
                <input type="reset" value="다시 입력">
            </div>
    </form>
</body>
</html>