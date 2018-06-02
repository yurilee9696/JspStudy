<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	hr{
		margin-top: 1.5em;
		width: 100%;
	}
	#menuDiv{
	background-color: white;
	text-align: center;
	padding:0px 1em 1em 1em;
	width:100%;
	box-shadow: 0px 5px 11px rgba(0, 0, 0, 0.13);
	margin-bottom: 0.7em;
	}
	a:link{
		color: #678EE8;
		text-decoration: none;
		margin-right: 25px;
		font-size: 1em;
	}
	a:visited {
    color: #678EE8;
    text-align: center;
	}
	a:hover {
    color: #36E84F;
    text-align: center;
	}
	html,body {
		width: 100%;
	}
</style>
</head>
<body>
<div id="menuDiv">
	<a href="main.jsp"> 메인</a><a href="learn.jsp">학습하기</a><a href="quiz.jsp">퀴즈풀기</a>
</div>
</body>
</html>
