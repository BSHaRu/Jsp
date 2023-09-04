<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
			<section class="write">
				<h3>글쓰기</h3>
				<article>
					<form action="/FarmStory1/board/proc/writeProc.jsp" method="post">
						<input type="hidden" name="writer" value="" />
						<!-- 해당 2개를 보내는 이유 proc에 적어둠 -->
						<input type="hidden" name="group" value="" />
						<input type="hidden" name="cate" value="" />
						<table>
							<tr>
								<td>제목</td>
								<td>
									<!-- required : 반드시 입력해달라고 해줌 --> 
									<input type="text" name="title" required placeholder="제목을 입력하세요." />
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
								<td><input type="file" name="file" /></td>
							</tr>
						</table>
						<div>
							<a href="#" class="btnCancel">취소</a> 
							<input type="submit" class="btnWrite" value="작성완료">
						</div>
					</form>
				</article>
			</section>
		<!-- write end -->
		</article>
	</section>
</div>
<%@ include file="/inc/footer.jsp"%>
