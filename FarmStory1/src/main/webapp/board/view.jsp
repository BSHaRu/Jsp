<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<%
	//로그인 여부 확인
	if(sessUser == null){
		out.print("<script>");
		out.print("alert('로그인 부터 해주세요');");
		out.print("location.href='/FarmStory1/user/login.jsp';");
		out.print("</script>");
		return;
	}

	request.setCharacterEncoding("UTF-8");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String strNo = request.getParameter("no");
	int no = Integer.parseInt(strNo);
	
	ArticleDAO dao = new ArticleDAO();
	ArticleDTO dto = dao.selectArticle(no);
	
	List<ArticleDTO> contents = dao.selectContents(no);
	
	pageContext.include("/inc/aside/"+group+".jsp");
%>          
			<section class="view">
			    <h3>글보기</h3>
			    <table>
			        <tr>
			            <td>제목</td>
			            <td>
			           		<input type="text" name="title" value="<%= dto.getTitle() %>" readonly/>
			            </td>
			        </tr>
			        <% if(dto.getFile() > 1){ %>
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
			                <textarea class="textarea" name="content" readonly><%=dto.getContent() %></textarea>
			            </td>
			        </tr>
			    </table>
			    <div>
			    <% if(dto.getWriter().equals(sessUser.getUid())) { %>
			        <a href="#" class="btnDelete">삭제</a>
			        <a href="modify.jsp?group=<%= group %>&cate=<%= cate %>&no=<%= no %>" class="btnModify">수정</a>
		        <% } %>
			        <a href="list.jsp?group=<%= group %>&cate=<%= cate %>" class="btnList">목록</a>
			    </div>  
			    
			    <!-- 댓글리스트 -->
			    <section class="commentList">
			        <h3>댓글목록</h3>
			        <% for(ArticleDTO content : contents){ %>
			        <article class="comment">
			        	<form action="#" method="post">
			        		<input type="hidden" name="no" value="" />
			        		<input type="hidden" name="parent" value="" />
			        		<span>
			        			<span style="font-weight: bold;"><%= content.getNick() %></span>
			        			<span style="font-weight: lighter;"><%= content.getRegDate() %></span>
			        		</span>
			             	<textarea class="textarea" name="comment" readonly><%= content.getContent() %></textarea>
			             <% if(sessUser.getUid().equals(content.getWriter())){ %>	
			             <div>
			                 <a href="#" class="del">삭제</a>
			                 <a href="#" class="cancel">취소</a>
			                 <a href="#" class="modify">수정</a>
			             </div>
			             <% } %>
			         	</form>
			        </article>
			        <% } %> <!-- for end -->
			        
		       		<% if(contents.isEmpty()){ %>
			        <p class="empty">
			            등록된 댓글이 없습니다.
			        </p>
		        	<% } %>
			    </section> <!-- commentList end -->
			
			    <!-- 댓글입력폼 -->
			    <section class="commentForm">
			        <h3>댓글쓰기</h3>
			        <form action="/FarmStory1/board/proc/contentProc.jsp" method="post">
			        	<input type="hidden" name="parent" value="<%= no %>" />
			        	<input type="hidden" name="writer" value="<%= sessUser.getUid() %>" />
			        	<input type="hidden" name="cate" value="<%= cate %>" />
			        	<input type="hidden" name="group" value="<%= group %>" />
			            <textarea class="textarea" name="content"></textarea>
			            <div>
			                <input type="reset" class="btnCancel" value="취소"/>
			                <input type="submit" class="btnWrite" value="작성완료"/>
			            </div>
			        </form>
			    </section> <!-- commentForm end -->
			
			</section> <!-- view end -->

		</article>
	</section>
</div>
<%@ include file="/inc/footer.jsp"%>
<script>
	$(function(){
		$(".cancel").click(function(e){
			e.preventDefault();
			location.reload();
		});
		
	});
</script>