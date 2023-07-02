<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-action.jsp</title>
</head>
<body>
<%
	// request에서는 파일을 다룰 수 없어서 MultipartRequest가 필요하다
	// com.oreilly.servlets.MultipartRequest 클래스
	// 이 클래스는 생성자에서 다음 요소들을 전달해야 한다
	// 1) 내장 객체 request
	// 2) 업로드 파일을 저장할 디렉토리 경로
	// 3) 첨부파일 크기
	// 4) 파일 이름 인코딩 규칙
	// 5) 이름이 중복될 경우 이름을 재설정할 정책 

	// MultipartRequest객체를 생성하기만 해도 파일은 이미 업로드 되어있다
	// 업로드 파일의 이름 혹은 다른 요소들을 DB테이블에 저장해두었다가
	// 다음에 필요할 때 불러서 쓸수 있게끔 준비하기

	String saveDirectory = application.getRealPath(".");
	int maxPostSize = 1024 * 1024 * 10;
	String encoding = "UTF-8";
	
	System.out.println("saveDirectory : " + saveDirectory);

	MultipartRequest mpRequest = new MultipartRequest(
				request,
				saveDirectory,
				maxPostSize,
				encoding,
				new DefaultFileRenamePolicy()
			);
	
	String contentType = mpRequest.getContentType("uploadFile");
	File uploadFile = mpRequest.getFile("uploadFile");
	long length = uploadFile.length();
	String fileName = uploadFile.getName();
	
	System.out.println("fileName : " + fileName);
	System.out.println("length : " + length);
	System.out.println("contentType : " + contentType);
	System.out.println();
%>

</body>
</html>