<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>글쓰기</title>
    <style>

    </style>

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
            <section class="write">
                <h3>글쓰기</h3>
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
                            <input type="submit" class="btnWrite" value="작성완료">
                        </div>
                    </form>
                </article>
            </section>
        </main>

        <footer>
            <p>ⓒcopyright Haru.com</p>
        </footer>
	</div>
</body>
</html>