<%@page import="dao.*"%>
<%@page import="vo.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TermsVO terms 
		= UserDAO.getInstance().selectTerms();
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>Jboard :: terms</title>
    
    <link rel="stylesheet" href="/Jboard/css/style.css">
</head>
<body>
    <div id="container">
        <header>
            <h3>Board System ver 1.0</h3>
        </header>
       
        <main>
            <section class="terms">
               	<table border="1">
                    <caption>사이트 이용약관</caption>
                    <tr>
                        <td>
                            <textarea class="textarea" readonly><%=terms.getTerms() %></textarea>
                            <p>
                                <label>
                                    <input type="checkbox" name="chk1" />동의합니다.
                                </label>
                            </p>
                        </td>
                    </tr>
               </table>
               <table border="1">
                    <caption>개인정보 취급 방침</caption>
                    <tr>
                        <td>
                            <textarea class="textarea" readonly><%=terms.getPrivacy() %></textarea>
                            <p>
                                <label>
                                    <input type="checkbox" name="chk2" />동의합니다.
                                </label>
                            </p>
                        </td>
                    </tr>
               </table>
               <div>
                    <a href="#" class="btnCancle">취소</a>
                    <a href="#" class="btnNext">다음</a>
               </div>
            </section>
        </main>

        <footer>
            <p>ⓒcopyright Haru.com</p>
        </footer>
    </div>

	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function(){
			const chk1 = document.getElementsByName('chk1')[0];
			const chk2 = document.getElementsByName('chk2')[0];
			
			const btnNext = document.querySelector('.btnNext');
			btnNext.addEventListener("click", function(e){
				console.log("click test");			
				e.preventDefault();
				
				if(!chk1.checked){
					alert("이용 약관 동의 체크 하셈");
					return;
				}else if(!chk2.checked){
					alert("개인 정보 동의 체크 하셈");
					return;
				}else{
					location.href = "/Jboard/user/register.jsp";
				}
			});
		});
	</script>
</body>
</html>
