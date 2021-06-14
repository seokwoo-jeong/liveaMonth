<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="resources/css/faqStyle.css">
<script src="resources/js/TweenMax.min.js"></script>
<div class="notice">
    <div class="section-title">
        <h4>공지사항</h4>
    </div>
    <script>
        var qnaNum = -1;
        $(document).ready(function () {
            $('.qa_li .question').click(function () {
                q = $(".qa_li .question").index(this);
                if (q != qnaNum) {
                    $('.qa_li .answer').stop(true, true).slideUp(400);
                    $('.qa_li').removeClass('open');
                    TweenMax.to($('.qa_li .question').eq(qnaNum).find('.iconDiv'), 0.4, {rotation: 0});
                    qnaNum = q;
                    $('.qa_li').eq(qnaNum).addClass('open');
                    $('.qa_li .answer').eq(qnaNum).stop(true, true).slideDown(400);
                    //TweenMax.to($('.qa_li .question').eq(qnaNum).find('.iconDiv'), 0.4, {rotation:180});
                    TweenMax.to($('.qa_li .question').eq(qnaNum).find('.iconDiv'), 0.4, {rotation: 0});
                } else {
                    $('.qa_li .answer').eq(qnaNum).stop(true, true).slideUp(400);
                    $('.qa_li').eq(qnaNum).removeClass('open');
                    TweenMax.to($('.qa_li').eq(qnaNum).find('.question p'), 0.4, {rotation: 0});
                    qnaNum = -1;
                }
            });
        });
    </script>
    <ul class="listWrap">
        <li class="qa_li">
            <div class="question">
                <p class="tit">1.&nbsp; 홈페이지 오픈 안내</p>
                <p class="iconDiv"><img src="resources/img/notice.png"></p>
            </div>
            <div class="answer">안녕하세요.^^<br/>
                6월 7일, '한달살기' 홈페이지가 새롭게 문을 열었습니다.<br/>
                우리나라의 각 도시들과 한달살기를 하는 사람들의 정보를 손쉽게 얻고, 공유할 수 있는 사이트입니다.<br/>
                앞으로 많은 관심과 사랑 부탁드립니다.<br/>
                감사합니다.
            </div>
        </li>
        <li class="qa_li">
            <div class="question">
                <p class="tit">2.&nbsp; 네이버 연동 로그인 추가 안내</p>
                <p class="iconDiv"><img src="resources/img/notice.png"></p>
            </div>
            <div class="answer">안녕하세요.^^<br/>
                기존 사이트내 로그인만 가능하던 시스템에서, 네이버 연동 로그인 시스템이 추가되었습니다. 네이버와 아이디와 연동하고 싶으신 고객께서는 연동하여 회원가입 해주세요.<br/>
                감사합니다.
            </div>
        </li>
        <li class="qa_li">
            <div class="question">
                <p class="tit">3. &nbsp;5/31 긴급점검안내</p>
                <p class="iconDiv"><img src="resources/img/notice.png"></p>
            </div>
            <div class="answer">안녕하세요.^^<br/>
                사이트 개발내용 통합에 따라 5/31일 20:00~21:00, 약 60분 동안 긴급점검이 있을 예정입니다. 사이트 이용에 참고하시길 바랍니다.<br/>
                감사합니다.
            </div>
        </li>
        <li class="qa_li">
            <div class="question">
                <p class="tit">4. &nbsp;CITY 메뉴 이용안내</p>
                <p class="iconDiv"><img src="resources/img/notice.png"></p>
            </div>
            <div class="answer">안녕하세요.^^<br/>
                메인메뉴 CITY 이용에 대해서 안내드립니다.<br/>
                '한달살기' 사이트에서는 추천도시로 서울/강릉/경주/부산/여수/제주를 소개하고 있습니다. 각 도시별로 VIEW와 FOOD를 추천하고 있으며,
                교통정보와 전년도 기온정보를 조회하실 수 있습니다.<br/>
                '한달살기' 추천도시정보를 통해 한달살기 장소를 결정해보세요!<br/>
                감사합니다.
            </div>
        </li>
        <li class="qa_li">
            <div class="question">
                <p class="tit">5.&nbsp; SCHEDULE 메뉴 이용안내</p>
                <p class="iconDiv"><img src="resources/img/notice.png"></p>
            </div>
            <div class="answer"> 안녕하세요.^^<br/>
                메인메뉴 SCHEDULE 이용에 대해서 안내드립니다.<br/>
                내 스케줄 추가 버튼을 클릭하여 내 한달살기 일정을 추가하실 수 있습니다. 공개버튼을 누르면 다른사람들이 내 일정을 보고, 공유하고, 댓글 달 수 있습니다.
                한달동안 한달살기하며 사용한 금액을 계산하고 조회할 수도 있습니다. <br/>고객님들의 많은 이용 바랍니다!<br/>
                감사합니다.<br/>
            </div>
        </li>
        <li class="qa_li">
            <div class="question">
                <p class="tit">6. &nbsp;REVIEW 메뉴 이용안내</p>
                <p class="iconDiv"><img src="resources/img/notice.png"></p>
            </div>
            <div class="answer"> 안녕하세요.^^<br/>
                메인메뉴 REVIEW 이용에 대해서 안내드립니다.<br/>
                전체게시판/인기게시판/자유게시판이 있고, 도시별로 숙박시설/가볼만한곳/먹을만한곳/솔직후기를 작성할 수 있습니다.<br/>
                작성하신 글이 사이트 이용 규칙에 위배된다면 통보 없이 삭제처리되니 유의해주시기 	바랍니다.<br/>
                고객님들의 많은 리뷰글 참여를 바랍니다!<br/>
                감사합니다.<br/>
            </div>
        </li>

    </ul>
</div>

