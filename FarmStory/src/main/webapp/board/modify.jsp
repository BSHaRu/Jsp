<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
			<section class="modify">
			    <h3>글수정</h3>
			    <article>
			        <form action="/FarmStory1/board/proc/modifyProc.jsp" method="post">
			        	<input type="hidden" name="no" value="" />
			        	<input type="hidden" name="cate" value="" />
			        	<input type="hidden" name="group" value="" />
			            <table>
			                <tr>
			                    <td>제목</td>
			                    <td>
			                        <input type="text" name="title" value="" />
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
			                        <input type="file" name="file" value=""/>
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