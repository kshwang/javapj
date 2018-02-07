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
            $(document).ready(function(event) {
                $('#button > input[type="button"]').click(function(event) {
                    var userid = $('input[name="userid"]').val();
                    var q_no = $('select').val();
                    var q_answer = $('input[name="q_answer"]').val();
                    if (userid === ''||q_no === '0'||q_answer === '') {
                        alert('모든 정보를 입력하세요.');
                    }
                    else {
                        $('form').submit();
                    }
                });
            });
        });
    </script>
</head>
<body>
    <c:if test="${not empty msg }">
        <p style="text-align:center; color: red; font-size:12px;"> ${msg } </p>
    </c:if>      
    <form action="findpw" method="post" enctype="application/x-www-form-urlencoded">
        <table>
            <tr>
                <td><label>아이디</label></td>
                <td><input type="text" name="userid" /></td>
            </tr>
            <tr>
                <td><label>비밀번호질문</label></td>
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
                <td><label>비밀번호답변</label></td>
                <td><input type="text" name="q_answer" /></td>
            </tr>
        </table>
        <div id="button">
            <input type="button" value="비밀번호 찾기" />
            <input type="reset" value="다시 입력">
        </div>
    </form>
</body>
</html>