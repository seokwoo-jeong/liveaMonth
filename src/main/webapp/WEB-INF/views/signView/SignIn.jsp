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
                        <button type="submit" class="form-control btn btn-primary rounded submit px-3">�α���</button>
                    </div>
                    <div class="form-group">
                        <a href= ${apiURL}><img src="resources/img/naverLogin_btn.png" height="50px"/></a>
                    </div>
                    <c:if test="${!firstIn}">
                        <p class="text-center" style="color:#ff0000">�������� ���� ���̵��̰ų�, �߸��� ��й�ȣ�Դϴ�.</p>
                    </c:if>

                    <div class="form-group d-md-flex">
                        <div class="w-50 text-left">
                            <label class="checkbox-wrap checkbox-primary mb-0">Remember Me
                                <input type="checkbox" name="userCookie" checked>
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="w-50 text-md-right">
                            <a href="findID">���̵� ã��</a>
                        </div>

                        <div class="w-50 text-md-right">
                            <a href="findPW">��й�ȣ ã��</a> 
                        </div>
                    </div>
                </form>
                <p class="text-center">���� ȸ���� �ƴϽŰ���? <a href="signUp">ȸ������</a></p>
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
                    $(".nickNameResult .nickNameMsg").text("���Ұ�");
                    $(".nickNameResult .nickNameMsg").attr("style", "color:#f00");
                    $("#submit").attr("disabled", "disabled");
                } else {
                    $(".nickNameResult .nickNameMsg").text("��밡��");
                    $(".nickNameResult .nickNameMsg").attr("style", "color:#00f");

                    $("#submit").removeAttr("disabled");
                }
            }
        });  // ajax ??
    });

    $("#userNickname").keyup(function () {
        $(".nickNameResult .nickNameMsg").text("�ߺ�Ȯ���� ���ּ���");
        $(".nickNameResult .nickNameMsg").attr("style", "color:#000");
        $("#submit").attr("disabled", "disabled");
    });
</script>
</body>
</html>