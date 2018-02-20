<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        

        <div class="container" style="position: relative; z-index: 2;">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/"><span>더조은 컴퍼니</span></a>
            </div>
            <div class="navbar-collapse collapse">                          
                <div class="menu">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation"><a href="/company">회사소개</a></li>
                        <li role="presentation"><a href="/pj_mn20/pj_mn21_jobs">입사지원</a></li>
                        <li role="presentation"><a href="/pj_mn30/pj_mn31">고객지원</a></li>
                        <li role="presentation"><a href="/pj_mn40/pj_mn41">교육</a></li>
                    </ul>
                    
                </div>
            </div>
        </div>
        <div style="position: absolute; right:120px; top: 70px; z-index: 1; display:inline; background-color:none">
            <c:choose>
                <c:when test="${empty user}">
                    <div><a style="decoreation:none; color:black " href="/login">로그인</a></div>
                </c:when>
                <c:otherwise>
                    <div><a style="decoreation:none; color:black " href="/logout">로그아웃</a></div>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>