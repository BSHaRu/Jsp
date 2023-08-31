<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/board/header.jsp" %>
<main id="board">
    <section class="write">
        <form action="/Jboard2/write.do" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="writer" value="${sessUser.uid }" />
            <table>
                <caption>글쓰기</caption>
                <tr>
                    <th>제목</th>
                    <td>
                    	<input type="text" name="title" value="${article.title }" autofocus required placeholder="제목을 입력하세요."/>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="content" required>${article.content }</textarea>
                    </td>
                </tr>
                <tr>
                    <th>파일</th>
                    <td>
                        <input type="file" name="file" value="${article.file }" />
                    </td>
                </tr>
            </table>
            
            <div>
                <a href="./list.do" class="btn btnCancel">취소</a>
                <input type="submit" value="작성완료" class="btn btnComplete"/>
            </div>
        </form>
    </section>
</main>
<%@ include file="/inc/board/footer.jsp" %>