<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="youtube.*" %>
<%@ page import="java.net.URLEncoder, java.net.URLDecoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="dao" value="${YoutubeDAO.getInstance() }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day12_youtube</title>
<style>
	#root {
		width: 1000px;
		margin: auto;
	}
	.wrap {
		display: flex;
		flex-flow: wrap;
		width: 90%;
		margin: auto;
	}
	.item {
		width: 270px;
		margin: 5px;
	}
	.item > .thumbnail {
		text-align: center;
	}
	.item > .thumbnail > a > img {
		width: 250px;
		margin: auto;
	}
	.item > .title {
		font-size: 17px;
	}
	.item > .channel {
		font-size: 15px;
		color: grey;
	}
	h1 {
		text-align: center;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
	.flex {
		width: 1000px;
		margin: auto;
		display: flex;
	}
	.flex > .left {
		width: 100%;
	}
	.flex > .right {
		width: 300px;
	}
	.mov > iframe {
		width: 650px !important;
	}
	header {
		width: 1000px;
		height: 150px;
		margin: auto;
		position: fixed;
		top: 0;
		background-color: white;
		left: 50%;
		transform: translate(-50%, 0);
		z-index: 1;
	}
	
	main {
		position: relative;
		top: 150px;
		width: 1000px;
		margin: auto;
	}
	.recentList img {
		width: 150px;
		margin-right: 5px;
	}
	.recentList .channel {
		font-size: 15px;
		color: grey;
	}
	main > .flex {
		justify-content: space-around;
	}
</style>
</head>
<body>

<header>
	<h1><a href="${cpath }">day12</a></h1>
	<nav>
		<ul>
			<li><a href="${cpath }/list.jsp">목록</a>
			<li><a href="${cpath }/add.jsp">추가</a>
		</ul>
	</nav>
</header>
