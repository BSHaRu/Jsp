<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String strNo = request.getParameter("no");
	int no = Integer.parseInt(strNo);
	
	ArticleDAO dao = new ArticleDAO();
	
	// 게시판 글 조회
	ArticleVO vo = dao.selectArticle(no);
	
	// 댓글 조회(목록 확인)
	List<ArticleVO> comments = dao.selectComments(no);
	
%>
<main>
    <section class="view">
        <h3>글보기</h3>
        <table>
            <tr>
                <td>제목</td>
                <td>
               		<input type="text" name="title" value="<%= vo.getTitle() %>" readonly/>
                </td>
            </tr>
            <% if(vo.getFile() > 0){ %>
            <tr>
                <td>첨부파일</td>
                <td>
                    <a href="#">2020년 상반기 매출자료.xls</a>
                    <span>7회 다운로드</span>
                </td>
            </tr>
            <% } %>
            <tr>
                <td>내용</td>
                <td>
                    <textarea class="textarea" name="content" readonly><%= vo.getContent() %></textarea>
                </td>
            </tr>
        </table>
        <div>
        	<%if(sessUser.getUid().equals(vo.getWriter())){ %>
            <a href="/Jboard/delete.jsp?no=<%= no %>" class="btnDelete">삭제</a>
            <a href="/Jboard/modify.jsp?no=<%= no %>" class="btnModify">수정</a>
            <%} %>
            <a href="/Jboard/list.jsp" class="btnList">목록</a>
        </div>  
        
        <!-- 댓글리스트 -->
        <section class="commentList">
            <h3>댓글목록</h3>
            <% for(ArticleVO content : comments){ %>
            <article class="comment">
            	<form action="/Jboard/proc/contentUpdate.jsp" method="post">
	                <span>
	                    <span><%= content.getNick() %></span>
	                    <span><%= content.getRegDate() %></span>
	                </span>
	                <textarea class="textarea" name="comment" readonly><%= content.getContent() %></textarea>
	                <% if(sessUser.getUid().equals(content.getWriter())){ %>
	                <div>
	                    <a href="/Jboard/proc/contentDelete.jsp?no=<%= content.getNo() %>&parent=<%= content.getParent() %>" class="del">삭제</a>
	                    <a href="#" class="cancel">취소</a>
	                    <a href="#" class="modify">수정</a>
	                </div>
	                <%} %> <!-- sessUser if end -->
	            </form>
            </article>
            <%} %> <!-- content for end -->
            
            <%if(comments.isEmpty()){ %>
            <p class="empty">
                등록된 댓글이 없습니다.
            </p>
            <%} %>
        </section> <!-- commentList end -->

        <!-- 댓글입력폼 -->
        <section class="commentForm">
            <h3>댓글쓰기</h3>
            <form action="/Jboard/proc/commentProc.jsp" method="post">
            	<input type="hidden" name="parent" value="<%= no %>"/>
            	<input type="hidden" name="writer" value="<%= sessUser.getUid() %>" />
                <textarea class="textarea" name="content"></textarea>
                <div>
                    <a href="#" class="btnCancel">취소</a>
                    <input type="reset" class="btnWrite" value="reset버튼"/>
                    <input type="submit" class="btnWrite" value="작성완료"/>
                </div>
            </form>
        </section> <!-- commentForm end -->

    </section> <!-- view end -->
</main>

<%@ include file="/inc/footer.jsp" %>
<script>
	$(function(){
		// 댓글 수정
		$('.modify').click(function(e){
			e.preventDefault();
			const txt = $(this).text();
			if(txt == "수정"){
				$(this).parent().prev().addClass('mod');
				$(this).parent().prev().attr('readonly', false);
				$(this).parent().prev().focus();
				$(this).text("수정완료");
				// 취소 버튼
				$(this).prev().show();
				// 삭제 버튼
				$(this).prev().prev().hide();
			}else{
				//수정 데이터 전송
				// this : 수정완료 버튼
				// closest : 가장 근접한 태그
				$(this).closest('form').submit();
				
				$(this).parent().prev().removeClass('mod');
				$(this).parent().prev().attr('readonly', true);
				
				$(this).text("수정");
				// 취소 버튼
				$(this).prev().hide();
				// 삭제 버튼
				$(this).prev().prev().show();
			}
		});
		
		// 댓글 삭제
		$('.del').click(function(){
			const reuslt = confirm("정말 삭제 하시겠습니까?");
			if(result) 
				return true;
			else
				return false;
		});
		
		// 댓글 쓰기 취소 - form태그 안이면 type= reset 해주면 됨
		const commentContent 
			= document.querySelector('form > textarea[name=content]');
		const btnCancel = document.querySelector('.btnCancel');
		btnCancel.onclick = function(e){
			e.preventDefault();
			commentContent.value = "";
		}
		
	});
	// 게시글 삭제
	const btnDelete 
		= document.getElementsByClassName('btnDelete')[0];
	btnDelete.onclick = function(){
		if(confirm("정말 삭제 하시겠습니까?")) 
			return true;
		else
			return false;
	};
	
</script>