<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<!-- login -->
<script src="resources/js/signUp.js"></script>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <a href="/"><img src="resources/img/logo.png" alt=""></a>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <form action="checkSign" class="signin-form">
                    <div class="form-group mt-3">
                        <input type="text" class="form-control" id="userID" name="userID" required>
                        <label class="form-control-placeholder" for="userID">ID</label>
                    </div>
                    <div class="form-group">
                        <input type="password" id="userPassword" class="form-control" name="userPassword" required>
                        <label class="form-control-placeholder" for="userPassword">Password</label>
                        <span id="password-field" class="fa fa-fw fa-eye field-icon"></span>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="form-control btn btn-primary rounded submit px-3">로그인</button>
                    </div>
                    <div class="form-group">
                        <a href= ${apiURL}><img src="resources/img/naverLogin_btn.png" height="50px"/></a>
                    </div>
                    <c:if test="${!firstIn}">
                        <p class="text-center" style="color:#ff0000">가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</p>
                    </c:if>

                    <div class="form-group d-md-flex">
                        <div class="w-50 text-left">
                            <label class="checkbox-wrap checkbox-primary mb-0">Remember Me
                                <input type="checkbox" name="userCookie" checked>
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="w-50 text-md-right">
                            <a href="findID">아이디 찾기</a>
                        </div>

                        <div class="w-50 text-md-right">
                            <a href="findPW">비밀번호 찾기</a> 
                        </div>
                    </div>
                </form>
                <p class="text-center">아직 회원이 아니신가요? <a href="signUp">회원가입</a></p>
            </div>
        </div>
    </div>
</section>
<!-- login End -->
<script>
    $(".checkNickName").click(function () {
        var query = {userID: $("#userNickname").val()};
        $.ajax({
            url: "checkSign",
            type: "post",
            data: query,
            success: function (data) {
                if (data == 1) {
                    $(".nickNameResult .nickNameMsg").text("사용불가");
                    $(".nickNameResult .nickNameMsg").attr("style", "color:#f00");
                    $("#submit").attr("disabled", "disabled");
                } else {
                    $(".nickNameResult .nickNameMsg").text("사용가능");
                    $(".nickNameResult .nickNameMsg").attr("style", "color:#00f");

                    $("#submit").removeAttr("disabled");
                }
            }
        });  // ajax ??
    });

    $("#userNickname").keyup(function () {
        $(".nickNameResult .nickNameMsg").text("중복확인을 해주세요");
        $(".nickNameResult .nickNameMsg").attr("style", "color:#000");
        $("#submit").attr("disabled", "disabled");
    });
</script>
</body>
</html>