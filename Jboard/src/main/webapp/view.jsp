<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>글보기</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <div id="container">
        <header>
            <h3>Board System v1.0</h3>
            <p>
                OOO님 반갑습니다.
                <a href="#" class="logout">[로그아웃]</a>
            </p>
        </header>
        <main>
            <section class="view">
                <h3>글보기</h3>
                <table>
                    <tr>
                        <td>제목</td>
                        <td>
                       		<input type="text" name="title" value="제목입니다." readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td>첨부파일</td>
                        <td>
                            <a href="#">2020년 상반기 매출자료.xls</a>
                            <span>7회 다운로드</span>
                        </td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea class="textarea" name="content" readonly>내용 샘플입니다.</textarea>
                        </td>
                    </tr>
                </table>
                <div>
                    <a href="#" class="btnDelete">삭제</a>
                    <a href="#" class="btnModify">수정</a>
                    <a href="#" class="btnList">목록</a>
                </div>  
                
                <!-- 댓글리스트 -->
                <section class="commentList">
                    <h3>댓글목록</h3>
                    <article class="comment">
                        <span>
                            <span>길동이</span>
                            <span>20-05-13</span>
                        </span>
                        <textarea class="textarea" name="comment" readonly>댓글 샘플입니다.</textarea>
                        <div>
                            <a href="#">삭제</a>
                            <a href="#">수정</a>
                        </div>
                    </article>
                    <p class="empty">
                        등록된 댓글이 없습니다.
                    </p>
                </section> <!-- commentList end -->
    
                <!-- 댓글입력폼 -->
                <section class="commentForm">
                    <h3>댓글쓰기</h3>
                    <form action="#">
                        <textarea class="textarea" name="comment"></textarea>
                        <div>
                            <a href="#" class="btnCancel">취소</a>
                            <input type="submit" class="btnWrite" value="작성완료"/>
                        </div>
                    </form>
                </section> <!-- commentForm end -->
    
            </section> <!-- view end -->
        </main>

        <footer>
            <p>ⓒcopyright Haru.com</p>
        </footer>
	</div>
</body>
</html>