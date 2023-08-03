<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "";
	try{
		Context init = new InitialContext();
		DataSource ds 
			= (DataSource) init.lookup("java:comp/env/jdbc/Jboard");
		conn = ds.getConnection();
		stmt = conn.createStatement();
		sql = "SELECT * FROM terms";
		rs = stmt.executeQuery(sql);
		// rs 값은 아래에서 스크립틀릿으로 해결함
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
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
				<% if(rs.next()) {%>
               	<table border="1">
                    <caption>사이트 이용약관</caption>
                    <tr>
                        <td>
                            <textarea class="textarea" readonly><%=rs.getString(1) %></textarea>
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
                            <textarea class="textarea" readonly><%=rs.getString(2) %></textarea>
                            <p>
                                <label>
                                    <input type="checkbox" name="chk2" />동의합니다.
                                </label>
                            </p>
                        </td>
                    </tr>
               </table>
               <%} %> <!-- if end -->
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
    <%
    	if(rs !=null) rs.close();
    	if(stmt !=null) stmt.close();
    	if(conn !=null) conn.close();
    %>
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
