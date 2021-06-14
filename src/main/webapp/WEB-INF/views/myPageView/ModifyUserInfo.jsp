<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body>
<script src="resources/js/signUp.js"></script>
<section class="ftco-section p-0">
    <div class="container">
        <form id="checkUserForm" action="resultMent" class="signup-form">
            <div class="row justify-content-center">
                <div class="col-xl-8">
                    <div class="login-wrap p-0">
                        <div class="icon d-flex align-items-center justify-content-center mt-0">
                            <span class="fa fa-edit"></span>
                        </div>
                        <h3 class="text-center">회원정보 수정</h3>

                        <form action="checkUserForm" class="signup-form">
                            <%--아이디--%>
                            <div class="form-group mb-4">
                                <label class="label mb-0" for="userID"><h5>ID</h5></label>
                                <input type="text" id="userID" class="form-control" placeholder="ID" name="userID"
                                       value="${userVO.userID}" readonly>
                            </div>
                            <%--비밀번호--%>
                            <div class="form-group mb-1">
                                <label class="label mb-0" for="userPassword"><h5>PASSWORD</h5></label>
                                <input type="password" id="userPassword"
                                       class="form-control" placeholder="Password" onpaste="return false;"
                                       oncopy="return false;" onchange="checkPassword()"
                                       name="userPassword">
                                <span id="showPassword" class="fa fa-fw fa-eye field-icon mt-3"></span>
                            </div>
                            <%--비밀번호 중복확인--%>
                            <div class="form-group">
                                <label class="label mb-0" for="checkUserPassword"><h5>CHECK PASSWORD</h5></label>
                                <input type="password" id="checkUserPassword"
                                       class="form-control" placeholder="checkPassword" onpaste="return false;"
                                       oncopy="return false;" onchange="checkPassword()" name="checkUserPassword">
                                <span id="showCheckPassword" class="fa fa-fw fa-eye field-icon mt-1"></span>
                                <span class="checkPassword" id="checkPassword">비밀번호 확인</span>
                            </div>
                            <%-- 이름 --%>
                            <div class="form-group mb-5">
                                <label class="label mb-0" for="userName"><h5>NAME</h5></label>
                                <input type="text" id="userName" class="form-control" name="userName"
                                       value="${userVO.userName}" readonly>
                            </div>
                            <%-- 닉네임 --%>
                            <div class="form-group mb-4">
                                <label class="label mb-0" for="userNickname"><h5>NICKNAME</h5></label>
                                <input type="text" id="userNickname" class="form-control"
                                       placeholder="${userVO.userNickname}"
                                       name="userNickname">
                                <button type="button" class="checkNickName">중복확인</button>
                                <p class="nickNameResult">
                                    <span class="nickNameMsg">중복확인을 해주세요.</span>
                                </p>
                            </div>

                            <div class="form-group mb-3">
                                <label class="label mb-0" for="userEmail"><h5>E-Mail</h5></label>
                                <input type="text" id="userEmail" class="form-control" name="userEmail"
                                       value="${userVO.userEmail}" readonly>
                            </div>

                            <input type="hidden" name="page" value="${page}">
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary rounded submit px-3">
                                    회원정보 변경
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
</body>
