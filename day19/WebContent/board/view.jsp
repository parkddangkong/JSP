<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<c:set var="dto" value="${boardDAO.selectOne(param.idx) }" />

<fieldset class="frame">

	<h3>글 읽기</h3>
	
	<h4>${dto.title }</h4>
	<h5>
		${dto.userid } 
		| <fmt:formatDate value="${dto.writeDate }" pattern="yyyy-MM-dd a hh:mm"/> 
		| ${dto.ipaddr }
	</h5>
	<c:if test="${not empty dto.fileName }">
		<img src="${cpath }/upload/${dto.fileName}" width="500">
	</c:if>
	<pre>${dto.content }</pre>

</fieldset>

<div class="flex">
	<div>
		<a href="${cpath }/board/list.jsp"><button>목록</button></a>
	</div>
	<div>
		<a href=""><button>수정</button></a>
		
		<a class="delete" href="${cpath }/board/delete.jsp?idx=${dto.idx}">
			<button>삭제</button></a>
	</div>
</div>

<script>
	const link = document.querySelector('a.delete')
	
	function deleteHandler(event) {
		event.preventDefault()	// 이벤트 대상 요소의 기본 작동을 막는다
		const login = '${login.userid}'	// 현재 로그인 사용자의 userid
		const writer = '${dto.userid}'	// 게시글 작성자의 userid
		
		if(login != writer) {						// 일치하지 않으면	
			alert('본인의 게시글만 삭제할 수 있습니다 !!')	// 경고를 출력한다
			return				// 이벤트 함수 종료 (더이상 진행하지 않는다)
		}
		
		if(confirm('정말 삭제하시겠습니까')) {	// 일치하면 삭제여부를 다시 확인하고
			location.href = link.href		// 링크의 주소대로 이동시킨다
		}
	}	// end of deleteHandler
	
	link.onclick = deleteHandler
</script>


</body>
</html>












