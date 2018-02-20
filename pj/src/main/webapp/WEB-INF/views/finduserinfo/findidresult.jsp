<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>아이디 찾기 / 비밀번호 찾기</title>
    <style type="text/css">
        body {
            text-align: center;
            margin-top: 50px;
        }
        a {
            text-decoration: none;
            font-size: 12px;
        }
    </style>
    <script type="text/javascript" src="/resources/js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function(event) {
        	$('a').eq(0).click(function(event) {
        		location.href = "/findpw";
        		return false;
        	});
            $('a').eq(1).click(function(event) {
                window.close();
                return false;
            });
        });
    </script>
</head>
<body>
    <p>
        <div>아이디는</div>
        <c:forEach var="user" items="${result }" varStatus="status">
            <div><b>${user.userid }</b></div>
        </c:forEach>
        <div>입니다.</div>
    </p>
    <div><a href="#">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;<a href="#">닫기</a></div>
</body>
</html>