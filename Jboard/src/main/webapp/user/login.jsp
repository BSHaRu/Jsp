<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String success = request.getParameter("success");

%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>Jboard :: login</title>
    <style>

    </style>
    <link rel="stylesheet" href="/Jboard/css/style.css">
</head>
<body>
    <div id="container">
        <header>
            <h3>Board System ver 1.0</h3>
        </header>

        <main>
            <section class="login">
                <form action="/Jboard/user/loginProc.jsp" method="post">
                    <table>
                        <tr>
                            <td>
                                <img alt="id" src="/Jboard/img/login.png" class="icon">
                            </td>
                            <td>
                                <input type="text" name="uid" placeholder="아이디 입력" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="pw" src="/Jboard/img/password.png" class="icon">
                            </td>
                            <td>
                                <input type="password" name="pass" placeholder="비밀번호 입력" />
                            </td>
                        </tr>
                    </table>
                    <input type="submit" value="로그인" class="btnLogin" />
                </form>
                <div>
                    <h3>회원 로그인 안내</h3>
                    <p>
                        아직 회원이 아니시면 회원가입 ㄱㄱ
                    </p>
                    <a href="/Jboard/user/terms.jsp">회원가입</a>
                </div>
            </section>
        </main>

        <footer>
            <p>ⓒcopyright Haru.com</p>
        </footer>
    </div>
	<script>
		const success = <%= success %>;
		if(success == 100){
			// 로그인 실패
			alert("로그인 실패");
			
		}else if (success == 101){
			// 로그인 없이 list page 보려는 경우
			alert("로그인부터 해주시기 바랍니다.");
		}
	</script>
</body>
</html>