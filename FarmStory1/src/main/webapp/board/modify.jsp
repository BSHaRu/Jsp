<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<%
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
	
	pageContext.include("/inc/aside/"+group+".jsp");
%>       
			<section class="modify">
			    <h3>글수정</h3>
			    <article>
			        <form action="/FarmStory1/board/proc/modifyProc.jsp" method="post">
			        	<input type="hidden" name="no" value="<%= no %>" />
			        	<input type="hidden" name="cate" value="<%= cate %>" />
			        	<input type="hidden" name="group" value="<%= group %>" />
			            <table>
			                <tr>
			                    <td>제목</td>
			                    <td>
			                        <input type="text" name="title" value="<%= dto.getTitle() %>" />
			                    </td>
			                </tr>
			                <tr>
			                    <td>내용</td>
			                    <td>
			                        <textarea class="textarea" name="content"><%= dto.getContent() %></textarea>                                
			                    </td>
			                </tr>
			                <tr>
			                    <td>첨부</td>
			                    <td>
			                        <input type="file" name="file" value="<%= dto.getFile()%>"/>
			                    </td>
			                </tr>
			            </table>
			            <div>
			                <a href="#" class="btnCancel">취소</a>
			                <input type="submit" class="btnWrite" value="수정완료" />
			            </div>
			        </form>
			    </article>
			</section>
			<!-- modify end -->
		</article>
	</section>
</div>
<%@ include file="/inc/footer.jsp"%>