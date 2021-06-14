<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body>
<script src="resources/js/myPage.js"></script>
<div class="check-pw">
    <div class="section-title">
        <c:if test="${page == null}">
            <c:set var="page" value="modify"/>
            <c:set var="title" value="회원정보 수정 : 비밀번호 재확인"/>
            <c:set var="text" value="개인정보 변경에서는 비밀번호 변경, 이메일 변경 등의 정보를 확인, 수정하실 수 있습니다."/>
        </c:if>
        <h4>${title}</h4>
        <p><span>보안을 위해서</span> 회원님의 <span>비밀번호</span>를 다시한번 입력해주세요.</p>
        <p>${text}</p>
    </div>
    <form id="checkUserForm" action="confirmPassword">
        <div class="tab-content">
            <ul class="cp-table">
                <li>
                    <label class="type-name">아이디</label>
                    <input id="id-field" type="text"
                           class="form-control" name="userID" value="${userVO.userID}" readonly>
                </li>
                <li>
                    <label class="type-name">비밀번호</label>
                    <input id="password-field" type="password"
                           class="form-control" placeholder="Password" onpaste="return false;"
                           oncopy="return false;" name="userPassword">
                </li>
            </ul>
        </div>
        <c:if test="${!checkUser}">
            <p class="text-center" style="color:#ff0000">잘못된 비밀번호입니다. 다시 확인해 주세요</p>
        </c:if>
        <input type="hidden" name="page" value="${page}">
        <button class="site-btn" type="submit">확인</button>
    </form>
</div>
</body>
