<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="snack.SnackDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<style>
	#root{
		display: flex;
		flex-flow : wrap;
		width: 700px;
		margin: 20px auto;
		border: 2px solid black;
	}
	.item{
		box-sizing:border-box;
		width: 150px;
		margin: 10px;
		padding: 10px;
		cursor: pointer;
		
		display: flex;
		flex-direction : column;
		justify-content: center;
		
		text-align: center;
	}
	.item:hover{
		background-color: #eee;
	}
	.image > img {
		width: 100px;
	}
	#menu{
		width: 700px;
		margin: 20px auto;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
</style>
</head>
<body>

<h1>상품 관리(대문 페이지)</h1>
<hr>
<%
	List<SnackDTO> list = null;
	Object tmp = application.getAttribute("list");
	if(tmp != null){	// 이미 사용중인 리스트가 있으면 기존 리스트를 불러와서 list에 저장한다
		list = (List<SnackDTO>) tmp;
	}
	else{	// 기존 사용중인 리스트가 없으면 새로 만들고 더미 데이터를 추가한다
		list = new ArrayList<SnackDTO>();
		list.add(new SnackDTO("꼬깔콘",1400,"꼬깔콘.jpg"));
		list.add(new SnackDTO("새우깡",2000,"새우깡.jpg"));
		list.add(new SnackDTO("뺴빼로",1200,"빼빼로.jpg"));
		list.add(new SnackDTO("초코샌드",3000,"초코샌드.jpg"));
		list.add(new SnackDTO("약과",1800,"약과.jpg"));
		application.setAttribute("list", list);
		// 새로 만든 리스트를 application에 등록한다
	}
%>

<div id = "menu">
	<!-- 왼쪽 -->
	<div>
		<form>
			<p>
				<input type="search" name = "search" placeholder="검색">
				<input type="submit" value="검색">
		</form>
	</div>
	<!-- 오른쪽 -->
	<div>
		<a href="add.jsp"><button>추가</button></a>
	</div>
</div>

<div id="root">
	<%for(SnackDTO dto : list) {%>
	<div class="item">
	<div class="image"><img src="image/<%=dto.getImage() %>"></div>
	<div class="name"><%=dto.getName() %></div>
	<div class="price"><%=String.format("%,d",dto.getPrice()) %>원</div>
	</div>
	<% } %>
</div>
<div id = "contextMenu" style="background-color: skyblue;
								position: absolute;
								display: none;
								width: 70px;
								padding: 10px;
								text-align: center;">
		<a href="delete.jsp"><button>삭제</button></a>
</div>
<script>
	const itemList = document.querySelectorAll('div.item')
	const contextMenu = document.getElementById('contextMenu')
	
	const contextMenuHandler = function(event) {	// 우클릭 이벤트
		event.preventDefault() 		// 기본 작동을 막는다(원래 뜨는 브라우저 메뉴 막기)
		contextMenu.style.display = 'block'	// 숨겨뒀던 메뉴를 보여준다
		contextMenu.style.top = event.clientY + 'px'	// 위치를 수정한다(마우스 클릭 위치)
		contextMenu.style.left = event.clientX + 'px'
		
		let target = event.target	// 우클릭 대상(div.item or .name or .price or .image)
		while(target.classList.contains('item') == false){	// 대상이 div.item이 아니면
			target = target.parentNode	// div.item이 될때까지 상위 노드를 대입한다
		}
		const name = target.querySelector('div.name').innerText 	//상품이름 글자를 문자열 저장
		contextMenu.querySelector('a').href = 'delete.jsp?name='+name	// a태그의 속성에 추가
	}
	itemList.forEach(item => item.oncontextmenu = contextMenuHandler)
	document.body.onclick = () => contextMenu.style.display = 'none'
</script>

</div>

</body>
</html>