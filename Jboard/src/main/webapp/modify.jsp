<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String strNo = request.getParameter("no");
	int no = Integer.parseInt(strNo);

	ArticleDAO dao = new ArticleDAO();
	ArticleVO vo = dao.selectArticle(no);
%>
<main>
    <section class="modify">
        <h3>글수정</h3>
        <article>
            <form action="/Jboard/proc/updateProc.jsp" method="post">
            	<input type="hidden" name="no" value="<%= vo.getNo()%>" />
                <table>
                    <tr>
                        <td>제목</td>
                        <td>
                            <input type="text" name="title" value="<%= vo.getTitle() %>" placeholder="제목을 입력하세요."/>
                        </td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea class="textarea" name="content"><%= vo.getContent() %></textarea>                                
                        </td>
                    </tr>
                    <tr>
                        <td>첨부</td>
                        <td>
                            <input type="file" name="file" value="<%= vo.getFile() %>"/>
                        </td>
                    </tr>
                </table>
                <div>
                    <a href="/Jboard/view.jsp?no=<%=no %>" class="btnCancel">취소</a>
                    <input type="submit" class="btnWrite" value="수정완료" />
                </div>
            </form>
        </article>
    </section>
</main>
<%@ include file="/inc/footer.jsp" %>