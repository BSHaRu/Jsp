<%@page import="vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<main>
    <section class="modify">
        <h3>글수정</h3>
        <article>
            <form action="#">
                <table>
                    <tr>
                        <td>제목</td>
                        <td>
                            <input type="text" name="title" placeholder="제목을 입력하세요."/>
                        </td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea class="textarea" name="content"></textarea>                                
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
                    <a href="#" class="btnCancel">취소</a>
                    <input type="submit" class="btnWrite" value="수정완료">
                </div>
            </form>
        </article>
    </section>
</main>
<%@ include file="/inc/footer.jsp" %>