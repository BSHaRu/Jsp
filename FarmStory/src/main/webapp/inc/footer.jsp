<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <footer>
        <img src="${path }/images/footer_logo.png" alt="로고"/>
        <p>
            (주)팜스토리 / 사업자등록번호 123-45-67890 / 통신판매업신고 제 2013-팜스토리구-123호 / 벤처기업확인 서울지방중소기업청 제 012345678-9-01234호<br />
            등록번호 팜스토리01234 (2013.04.01) / 발행인 : 홍길동<br />
            대표 : 홍길동 / 이메일 : email@mail.mail / 전화 : 01) 234-5678 / 경기도 성남시 잘한다구 신난다동 345<br />
            <em>Copyright(C)홍길동 All rights reserved.</em>
        </p>
    </footer>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$(".btnCancel").click(function(e) {
			e.preventDefault();
			console.log("btnCancel click");
			history.go(-1);
		});
	});
</script>
</body>
</html>