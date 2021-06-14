<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body>
<script src="resources/js/myPage.js"></script>
<section class="contact-form-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="cf-content">
                    <div class="cc-title">
                        <h4>회원탈퇴확인</h4>
                        <p>확인을 누를 시 회원탈퇴가 진행됩니다.</p>
                    </div>
                    <div>
                        <form action="resultMent" class="cc-form" id="checkUserForm">
                            <input type="hidden" name="page" value="${page}">
                            <button type="submit" class="site-btn">확인</button>
                            <button type="button" class="site-btn" href="reCheckPassword?page=dropUser">취소
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>