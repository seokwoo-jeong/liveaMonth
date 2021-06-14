<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
      rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,900&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

<%--메인 화면의 지역버튼 하얀색 글시체--%>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="resources/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<link rel="stylesheet" href="resources/css/loginstyle.css" type="text/css">
<link rel="stylesheet" href="resources/css/ihover.min.css" type="text/css">

<link rel="stylesheet" href="resources/css/notice.css" type="text/css">
<script src="resources/js/notice.js"></script>

<%--해당 js가 Footer에 있을 시 script에서 쿼리가 실행이 안됨. 그래서 위로 올림.--%>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<!-- Header Section Begin -->
<header class="header-section">
    <div class="hs-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo">
                        <a href="/"><img src="resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <c:if test="${userVO.userNO != null}">
                        <script>
                            window.onload = function () {
                                $.ajax({
                                    url: "getAllNotice",
                                    type: "GET",
                                    data: {userNO: ${userVO.userNO}},
                                    success:
                                        function (noticeMap) {
                                            writeDropDwon(noticeMap);
                                        },
                                    error:
                                        function (request, status, error) {
                                        }
                                });
                            }
                            $(function () {
                                timer = setInterval(function () {
                                    if ($(":focus").attr("id") != "alertsDropdown") {
                                        $.ajax({
                                            url: "getAllNotice",
                                            type: "GET",
                                            data: {userNO: ${userVO.userNO}},
                                            success:
                                                function (noticeMap) {
                                                    writeDropDwon(noticeMap);
                                                },
                                            error:
                                                function (request, status, error) {
                                                }
                                        });
                                    }
                                }, 1000);
                            });

                            $(document).ready(function () {
                                $(".dropdown").on("hidden.bs.dropdown", function () {
                                    $.ajax({
                                        url: "updateReadStatus",
                                        type: "POST",
                                        data: {userNO: ${userVO.userNO}},
                                        success: function (data) {
                                            $.ajax({
                                                url: "getAllNotice",
                                                type: "GET",
                                                data: {userNO: ${userVO.userNO}},
                                                success:
                                                    function (noticeMap) {
                                                        writeDropDwon(noticeMap);
                                                    },
                                                error:
                                                    function (request, status, error) {
                                                    }
                                            });
                                        },
                                        error: function (request, status, error) {
                                        }
                                    });
                                })
                            });

                        </script>
                        <div class="ht-widget navbar navbar-expand navbar-light bg-white topbar">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item dropdown no-arrow mx-1">
                                    <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i id="noticeIcon" class="fas fa-bell fa-fw"></i>
                                        <span class="badge badge-danger badge-counter" id="noticeCount"></span>
                                    </a>
                                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" id="noticeDropdown" aria-labelledby="alertsDropdown">
                                    </div>
                                </li>
                            </ul>
                            <a href="logout" class="hw-btn">Logout</a>
                        </div>
                    </c:if>
                    <c:if test="${empty userVO.userNO}">
                        <div class="ht-widget">
                            <a href="signUp" class="hw-btn">SignUp</a>
                            <a href="signIn" class="hw-btn">signIn</a>
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="canvas-open">
                <span class="icon_menu"></span>
            </div>
        </div>
    </div>

    <div class="hs-nav">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <nav class="nav-menu">
                        <ul>
                            <li><a href="cityInfo?cityName=all">CITY</a>
                                <ul class="dropdown">
                                    <li><a href="cityInfo?cityName=서울">서울</a></li>
                                    <li><a href="cityInfo?cityName=강릉">강릉</a></li>
                                    <li><a href="cityInfo?cityName=경주">경주</a></li>
                                    <li><a href="cityInfo?cityName=부산">부산</a></li>
                                    <li><a href="cityInfo?cityName=여수">여수</a></li>
                                    <li><a href="cityInfo?cityName=제주">제주</a></li>
                                </ul>
                            </li>
                            <li><a href="schedule">Schedule</a>
                                <ul class="dropdown">
                                    <li><a href="schedule">내 스케줄 보기</a></li>
                                    <li><a href="otherScheduleList?action=list">다른 사람 스케줄 보기</a></li>
                                </ul>
                            </li>
                            <li><a href="review">Review</a></li>
                            <li><a href="myPage">MyPage</a></li>
                            <li><a href="customerCenter">Customer Center</a>
                                <ul class="dropdown">
                                    <li><a href="selectedCustomerCenterMenu?menu=Faq">FAQ</a></li>
                                    <li><a href="selectedCustomerCenterMenu?menu=PersonalTerms">개인정보 처리방침</a></li>
                                    <li><a href="selectedCustomerCenterMenu?menu=TermsAndConditions">이용약관</a></li>
                                    <li><a href="selectedCustomerCenterMenu?menu=Notice">공지사항</a></li>
                                </ul>
                            </li>

                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="hn-social">
                        <c:if test="${userVO.userName != null}">
                            <p>환영합니다 ${userVO.userName}님.</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header End -->