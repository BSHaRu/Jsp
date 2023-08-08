<%@page import="vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<main>
    <section class="write">
        <h3>글쓰기</h3>
        <article>
            <form action="/Jboard/proc/writerProc.jsp" method="post">
            	<input type="hidden" name ="writer" value="<%=sessUser.getUid() %>" />
                <table>
                    <tr>
                        <td>제목</td>
                        <td>
                        	<!-- required : 반드시 입력해달라고 해줌 -->
                        	<input type="text" name="title" required placeholder="제목을 입력하세요."/>
                        </td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea class="textarea" required name="content"></textarea>                                
                        </td>
                    </tr>
                    <tr>
                        <td>첨부</td>
                        <td>
                            <input type="file" name="file"/>
                        </td>
                    </tr>
                </table>
                <div>
                    <a href="/Jboard/list.jsp" class="btnCancel">취소</a>
                    <input type="submit" class="btnWrite" value="작성완료">
                </div>
            </form>
        </article>
    </section>
</main>
<%@ include file="/inc/footer.jsp" %>