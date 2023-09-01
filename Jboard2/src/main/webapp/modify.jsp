<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/board/header.jsp" %>
<main id="board">
    <section class="modify">
        <form action="/Jboard2/modify.do" method="post">
        	<input type="hidden" name="no" value="${article.no }" />
            <table>
                <caption>글수정</caption>
                <tr>
                    <th>제목</th>
                    <td>
                    	<input type="text" name="title" value="${article.title }" placeholder="제목을 입력하세요."/>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="content">${article.content }</textarea>
                    </td>
                </tr>
                <tr>
                    <th>파일</th>
                    <td>
                        <input type="file" name="file" value="${article.file }"/>
                    </td>
                </tr>
            </table>
            
            <div>
                <a href="./view.do?no=${article.no }" class="btn btnCancel">취소</a>
                <input type="submit" class="btn btnComplete" value="작성완료" />
            </div>
        </form>
    </section>
</main>
<%@ include file="/inc/board/footer.jsp" %>