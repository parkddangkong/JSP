<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	border-collapse:collapse;
	border : 2px solid blick;
}
td, th{
	border : 1px solid grey;
}
thead> tr > th{
	background-color : black;
	color : white;
}
tbody > tr > td:first-child{
	font-weight:bold;
	font-family : 'consolas';
}
tbody > tr:nth-child(-n+5){
	background-color: lightgreen;
}

</style>
</head>
<body>

<h1>jsp 내장 객체</h1>
<hr>

<h3>기존의 자바 코드와 달리, 객체를 직접 생성하지 않아도 사용할 수 있는 객체</h3>
<%
	// attribute를 저장할 수 있는 상단 4개의 내장 객체는 아래와 같은 해시맵 필드로 가지고 있다고 생각하자
	HashMap<String, Object> attributes = new HashMap<>();
	// 쿼리스트링 : 사용자가 전달하는 데이터
	attributes.put("name","짱구");

	// 단, 내장 객체마다 생성되는 시점이 달라서, 유효범위가 다르다
	
	// pageContext : jsp 페이지가 생성될 때 마다 생성된다. 페이지를 젓어나면 유지되지 않는다
	// request : 사용자의 요청을 받을때 마다 생성된다. 새로운 요청을 유지되지 않는다
	// session : 각각의 사용자를 전담하는 객체이므로, 서로 다른 사용자끼리는 공유되지 않는다
	// application : 서버 내부의 프로그램을 나타내는 객체이므로, 서버를 재시작하면 유지되지 않는다
	
	pageContext.setAttribute("name", "이지은");
	// 범위 : 현재 페이지, 지금 저장했다가 나중에 불러 써야지, 공유의 느낌은 없음
	request.setAttribute("name", "홍진호");
	
	session.setAttribute("name", "김도기");
	// 페이지가 바껴도 로그인이 유지가 됨 클라이언트의 브라우저를 봄
	application.setAttribute("name", "진양철");
	
	String name1 = (String)attributes.get("name");
	String name2 = (String)pageContext.getAttribute("name");
	String name3 = (String)request.getAttribute("name");
	String name4 = (String)session.getAttribute("name");
	String name5 = (String)application.getAttribute("name");
	
	System.out.println("name1 : "+name1);
	System.out.println("name2 : "+name2);
	System.out.println("name3 : "+name3);
	System.out.println("name4 : "+name4);
	System.out.println("name5 : "+name5);
	
	// attribute : 서버에서 사용하기 위한 객체
	
%>
<table>
	<thead>
		<tr>
			<th>내장객체</th>
			<th>역할</th>
			<th>attribute</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>pageContext</td>
			<td>jsp 페이지를 가리키는 내장객체.<br>
			다른 내장객체로 연결하지 위한 연결점을 제공하기도 한다</td>
			<td>o</td>
		</tr>
		<tr>
			<td>request</td>
			<td>현재 client에 대한 정보를 유지할 수 있는 서버의 객체</td>
			<td>o</td>
		</tr>
		<tr>
			<td>application</td>
			<td>웹 프로그램(=서블릿)에 관한 내장 객체</td>
			<td>o</td>
		</tr>
		<tr>
			<td>response</td>
			<td>response에 기록할 내용을 보낼 수 있는 출력 객체</td>
			<td>o</td>
		</tr>
		<tr>
			<td>out</td>
			<td>response에 기록할 내용을 보낼 수 있는 출력 객체</td>
			<td>x</td>
		</tr>
		<tr>
			<td>page</td>
			<td>jsp페이지 그 자체</td>
			<td>x</td>
		</tr>
		<tr>
			<td>config</td>
			<td>jsp 페이지의 설정 정보를 담고 있는 개체</td>
			<td>x</td>
		</tr>
		<tr>
			<td>execption</td>
			<td>예외 발생 시 사용하는 객체</td>
			<td>x</td>
		</tr>
	</tbody>

</table>

</body>
</html>