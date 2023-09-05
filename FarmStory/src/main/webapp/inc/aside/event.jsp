<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}" />

<div id="sub">
    <div><img src="${path}/images/sub_top_tit4.png" alt="CROP TALK"></div>
    <section class="event">
        <aside>
            <img src="${path}/images/sub_aside_cate4_tit.png" alt="이벤트"/>

            <ul class="lnb">
                <li class="on">
                	<a href="${path}/board/list.do?group=community&cate=grow">이벤트</a>
                </li>
            </ul>

        </aside>
        <article>
            <nav>
                <img src="${path}/images/sub_nav_tit_cate4_tit1.png" alt="이벤트"/>
                <p>
                    HOME > 이벤트 > <em>이벤트</em>
                </p>
            </nav>

            <!-- 내용 시작 -->
            <!-- 이런식으로 게시판 만들면 이쁘긴 하겠네 -->
           <%-- <img src="${path}/images/board_list.png" alt=""> --%>

           <!-- 내용 끝 -->

<!--         </article>
    </section>
</div>
 -->