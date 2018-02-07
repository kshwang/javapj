<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            $('a').click(function(event) {
                window.close();
                return false;
            });
        });
    </script>
</head>
<body>
    <p>
        <div><b>${result.userid }</b>의 비밀번호는</div>
        <div><b>${result.passwd }</b></div>
        <div>입니다.</div>
    </p>
    <div><a href="#">닫기</a></div>
</body>
</html>