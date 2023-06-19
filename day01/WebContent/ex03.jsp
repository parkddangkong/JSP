<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>

<h1>parameter</h1>
<hr>

<h3>사용자가 서버에 요청하면서 추가로 전달하는 값. 대부분 String 타입이다</h3>
<h3>브라우저 주소 창내용 맨 뒤에 ?name=이름  형태로 추가로 적어서 입력하세요</h3>
<%
	String name = request.getParameter("name");

	if(name != null && name.equals("") == false) {
		out.print("<h3>" + name + "님 안녕하세요 !!</h3>");
	}
	else {
		out.print("<h3>반갑습니다</h3>");
	}
	
	String requestURL = request.getRequestURL().toString();
	String protocol = request.getProtocol();
	String serverName = request.getServerName();
	int port = request.getServerPort();
	String contextPath = request.getContextPath();
	String requestURI = request.getRequestURI();
	Map<String, String[]> paramMap = request.getParameterMap();
	
	System.out.println("URL : " + requestURL);
	System.out.println("protocol : " + protocol);
	System.out.println("serverName : " + serverName);
	System.out.println("port : " + port);
	System.out.println("contextPath : " + contextPath);
	System.out.println("requestURI : " + requestURI);
	
	for(String key : paramMap.keySet()) {
		String[] values = paramMap.get(key);
		System.out.println("key : " + key);	
		System.out.print("values : ");	
		for(int i = 0; i < values.length; i++) {
			String value = values[i];
			System.out.print(value);
			if(i == values.length - 1) {
				System.out.println();	
			}
			else {
				System.out.print(", ");
			}
		}
	}
	System.out.println();
%>
<style>
	div.sample {
		font-size: 30px;
		display: flex;
	}
	span.protocol { color: red; }
	span.serverName { color: orange; }
	span.serverPort { color: lime; }
	span.contextPath { color: green; }
	span.resource { color: blue; }
	span.paramName { color: purple; }
	span.paramValue { color: hotpink; }
</style>

<fieldset>
	<div class="sample">
		<span class="protocol">http</span>://
		<span class="serverName">localhost</span>:
		<span class="serverPort">8080</span>/
		<span class="contextPath">day01</span>/
		<span class="resource">ex03.jsp</span>?
		<span class="paramName">name</span>=
		<span class="paramValue">짱구</span>&
		<span class="paramName">age</span>=
		<span class="paramValue">5</span>
	</div>
</fieldset>


</body>
</html>