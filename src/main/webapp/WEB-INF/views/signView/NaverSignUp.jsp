<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>
<script src="resources/js/signUp.js"></script>

<section class="ftco-section">
    <div class="container">
        <form action=resultMentNaverSignUp method="post" class="signup-form" name="SignInfo" onsubmit="return naverLoginCheckValue()">
            <div class="row justify-content-center">
                <div class="col-md-12 col-lg-12 col-xl-8">
                    <div class="login-wrap p-4 p-md-5">
                        <div class="icon d-flex align-items-center justify-content-center">
                            <span class="fa fa-edit"></span>
                        </div>
                        <h3 class="text-center mb-4">네이버 회원 추가 정보 입력</h3>

                        <form action="#" class="signup-form">
                            <%-- naverID--%>
                            <input type="hidden" name="userID" value = "${naverUser.userID}">
                            <%-- 이름 --%>
                            <div class="form-group mb-5">
                                <label class="label mb-0" for="userName"><h5>NAME</h5></label> <input
                                    type="text" id="userName" class="form-control" onpaste="return false;"
                                    placeholder="이름(한글만 입력가능)" name="userName" onkeypress="koreanCheck()">
                            </div>

                            <%-- 닉네임 --%>
                            <div class="form-group mb-4">
                                <label class="label mb-0" for="userNickname"><h5>NICKNAME</h5></label>
                                <input type="text" id="userNickname" class="form-control mb-1" placeholder="닉네임"
                                       onpaste="return false;" name="userNickname">
                                <c:if test="${naverUser.userNickname == null}">
                                    <button type="button" class="checkNickName">중복확인</button>
                                    <p class="nickNameResult">
                                        <span class="nickNameMsg">중복확인을 해주세요.</span>
                                    </p>
                                </c:if>
                            </div>
                            <%--성별--%>
                            <div class="form-group mb-3" id="userSexBlock">
                                <label class="label mb-0" for="userSex"><h5>GENDER</h5></label>
                                <select name="userSex" id="userSex" class="form-control mb-4"
                                        onpaste="return false;">
                                    <option value=0>남성</option>
                                    <option value=1>여성</option>
                                </select>
                            </div>

                            <%--이메일--%>
                            <label class="label mb-0" for="userEmail"><h5>E-Mail</h5></label>
                            <c:choose>
                                <c:when test="${naverUser.userEmail == null}">
                                    <div class="form-group">
                                        <input type="text" id="userEmail" class="form-control result-email"
                                               onpaste="return false;" name="userEmail" onfocus="this.value='';"
                                               style="width: 44%;float: left">
                                        <h3 style="float: left;margin-left: 11px;margin-right: 11px">@</h3>
                                        <input type="text" id="email" name="email" class="form-control" readOnly="true"
                                               style="width: 48%;float: left">
                                    </div>
                                    <div class="form-group" id="emailBlock">
                                        <select name="emailSelected" id="emailSelected" class="form-control"
                                                onchange="email_change()">
                                            <c:forEach var="email" items="${email}">
                                                <option value="${email.label}">${email.label}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                <div class="form-group">
                                    <input type="text"class="form-control result-email"
                                           onpaste="return false;" name="userEmail" onfocus="this.value='';">
                                </div>
                                </c:otherwise>
                            </c:choose>

                            <%--출생년도--%>
                            <div class="form-group mb-5" style="margin-top: 100px">
                                <label class="label mt-3 mb-0" for="userAge"><h5>BIRTH</h5></label>
                                <input type="number" class="int form-control" id="userAge"
                                       min="1900" max="2021" maxlength="4" placeholder="생년(4자)" onpaste="return false;"
                                       name="userAge" oninput="maxLengthCheck(this)">
                            </div>

                            <div class="form-group mb-3">
                                <label class="label mb-0"><h5>TERMS & CONDITIONS</h5></label>
                                <div class="scroll-pane" style="overflow: scroll;height: 200px">
                                    <div><span class="msg">수집, 이용할 정보의 내용</span></div>
                                    <div><span class="msg">이름, 성별, 출생년도, 이메일 </span></div>
                                    <div><span class="msg">수집, 이용 목적</span></div>
                                    <div><span class="msg">한달살기 일정 추천 및 마케팅</span></div>
                                    <div><span class="msg">개인정보의 보유, 이용기간</span></div>
                                    <div><span class="msg">수집, 이용에 관한 동의일로부터 회원 탈퇴시 까지</span></div>
                                    <div><span class="msg">동의를 거부할 권리 및 동의를 거부할 경우의 불이익을 받을 수 있습니다.</span></div>
                                    <div><span class="msg">귀하는 위 사항에 대하여 동의를 거부할 수 있습니다.
                              다만 위 개인정보 수집에 관한 동의는 한달살기 사이트 회원가입을 위하여
                              필수적이므로, 위 사항에 동의하여야만 회원이 될 수 있습니다.</span></div>
                                </div>
                            </div>
                            <div class="form-group d-md-flex">
                                <div class="w-100 text-left">
                                    <label class="checkbox-wrap checkbox-primary">
                                        한달살기 이용약관 동의(필수)
                                        <input type="checkbox" name="agreeCheck">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <button type="submit" id="submit" class="form-control btn btn-primary rounded submit px-3">
                                    Sign Up
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
</html>

<script>
    function naverLoginCheckValue() {
        if (!document.SignInfo.userSex.value) {
            alert("성별을 선택하세요.");
            return false;
        }
        if (!document.SignInfo.userName.value) {
            alert("이름을 입력하세요.");
            return false;
        }
        if (!document.SignInfo.userNickname.value) {
            alert("닉네임을 입력하세요.");
            return false;
        }
        if (!document.SignInfo.userEmail.value) {
            alert("이메일을 입력하세요.");
            return false;
        }
        if (!document.SignInfo.userAge.value) {
            alert("출생일을 입력하세요.");
            return false;
        }
        if (!document.SignInfo.agreeCheck.checked) {
            alert("동의에 체크하세요.");
            return false;
        }
    };
    <c:if test="${naverUser.userEmail != null}">
        $("input[name=userEmail]").attr("readonly",true);
        $("input[name=userEmail]").val("${naverUser.userEmail}");
        $("#userAge").parent("div").attr("style","margin-top:-5px");
    </c:if>
    <c:if test="${naverUser.userName != null}">
        $("input[name=userName]").val("${naverUser.userName}");
        $("input[name=userName]").attr("readonly",true);
    </c:if>
    <c:if test="${naverUser.userNickname != null}">
        $("input[name=userNickname]").val("${naverUser.userNickname}");
        $("input[name=userNickname]").attr("readonly",true);
    </c:if>
    <c:if test="${naverUser.userAge != 0}">
        $("input[name=userAge]").val("${naverUser.userAge}");
        $("input[name=userAge]").attr("readonly",true);
    </c:if>
    <c:if test="${naverUser.userSex != null}">
        $("input[name=userSex]").val("${naverUser.userSex}");
        $("select[name=userSex]").attr("disable",true);
    </c:if>

    $(".checkNickName").click(function () {
        var query = {userNickname: $("#userNickname").val()};
        $.ajax({
            url: "checkNickName",
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
        });  // ajax ��
    });
    $("#userNickname").keyup(function () {
        $(".nickNameResult .nickNameMsg").text("중복확인을 해주세요");
        $(".nickNameResult .nickNameMsg").attr("style", "color:#000");
        $("#submit").attr("disabled", "disabled");
    });
</script>