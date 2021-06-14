<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!-- Footer Section Begin -->
<footer class="footer-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="fs-about">
                    <div class="fs-logo">
                        <a href="#">
                            <img src="resources/img/f-logo.png" alt="">
                        </a>
                    </div>
                    <p> '한달 살기'를 위한 정보를 공유하는 사이트입니다</p>
                    <div class="fs-social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-youtube-play"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-pinterest-p"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-sm-6">
                <div class="fs-widget">
                    <h5>Help</h5>
                    <ul>
                        <c:if test="${userVO.userNO != null}">
                            <li><a href="oneToOneAsk">1:1 문의하기</a></li>
                        </c:if>
                        <li><a href="selectedCustomerCenterMenu?menu=Faq">FAQ</a></li>
                        <li><a href="selectedCustomerCenterMenu?menu=PersonalTerms">개인정보 처리방침</a></li>
                        <li><a href="selectedCustomerCenterMenu?menu=TermsAndConditions">이용약관</a></li>
                        <li><a href="selectedCustomerCenterMenu?menu=Notice">공지사항</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-sm-6">
                <div class="fs-widget">
                    <h5>Links</h5>
                    <ul>
                        <li><a href="cityInfo?cityName=all">도시 소개</a></li>
                        <li><a href="otherScheduleList?action=list">다른 사람 스케줄</a></li>
                        <li><a href="review">후기 게시판</a></li>
                        <c:if test="${empty userVO.userNO}">
                            <li><a href="signIn">로그인</a></li>
                            <li><a href="signUp">회원가입</a></li>
                        </c:if>
                        <c:if test="${userVO.userNO != null}">
                            <li><a href="logout">로그아웃</a></li>
                            <li><a href="myPage">마이페이지</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="fs-widget">
                    <h5>Newsletter</h5>
                    <p>더 많은 한달살기 정보를 메일로 받아보세요~!</p>
                    <form action="#" class="subscribe-form">
                        <input type="text" placeholder="Email">
                        <button type="submit" class="site-btn">Subscribe</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="copyright-text">
            <p> &copy;<script>document.write(new Date().getFullYear());</script>
            </p>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/mixitup.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/jquery.slicknav.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/jquery.richtext.min.js"></script>
<script src="resources/js/image-uploader.min.js"></script>
<script src="resources/js/main.js"></script>
<script src="resources/js/TweenMax.min.js"></script>

</body>
</html>