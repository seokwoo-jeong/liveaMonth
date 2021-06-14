<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="resources/css/faqStyle.css">
<script src="resources/js/TweenMax.min.js"></script>
<div class="faq">
    <div class="section-title">
        <h4>FAQ: 자주묻는 질문</h4>
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
                <p class="tit">Q1. 내 계정정보를 변경하고 싶으면 어떻게 해야 하나요?.</p>
                <p class="iconDiv"><img src="resources/img/q.png"></p>
            </div>
            <div class="answer">우선, 한달살기사이트에서 아이디와 비밀번호를 입력하고 [로그인]버튼을 클릭하여 로그인해주세요. 다음, 마이페이지메뉴로 이동하여 사이드바에서
                [계정>회원정보수정]을 클릭합니다.
                아이디와 비밀번호를 입력하여 비밀번호 재확인 후, ID/비밀번호/닉네임/이메일을 수정할 수 있습니다.
            </div>
        </li>
        <li class="qa_li">
            <div class="question">
                <p class="tit">Q2. 한달살기사이트와 연동한 SNS 계정을 어떻게 해제하나요?.</p>
                <p class="iconDiv"><img src="resources/img/q.png"></p>
            </div>
            <div class="answer">우선, 한달살기사이트에서 아이디와 비밀번호를 입력하여 로그인해주세요.
                다음, 마이페이지로 이동하여 [SNS계정연동 해제하기]버튼을 클릭하면 연동을 해제할 수 있습니다.
            </div>
        </li>
        <li class="qa_li">
            <div class="question">
                <p class="tit">Q3. 휴면계정은 어떻게 해제하나요?</p>
                <p class="iconDiv"><img src="resources/img/q.png"></p>
            </div>
            <div class="answer">12개월 동안 로그인한 이력이 없는 아이디는 휴면 계정으로 지정되며, 정보보호를 위해 잠금상태가 됩니다.
                잠금상태에서는 이메일 인증을 통하여 비밀번호를 변경하여야 정상적인 서비스 이용이 가능합니다.
            </div>
        </li>
        <li class="qa_li">
            <div class="question">
                <p class="tit">Q4. 고객센터 이용시간은 어떻게 되나요? (1:1 상담을 원합니다)</p>
                <p class="iconDiv"><img src="resources/img/q.png"></p>
            </div>
            <div class="answer">한달살기사이트의 고객센터는 09~06시 운영되고 있습니다. 1:1문의는 마이페이지의 메뉴를 참고하여 주시고, 서비스장애 및
                긴급내용 신고는 심야시간대에도 상담가능하니 이메일로 연락하여 주세요. 1:1문의 답변은 3시간이내로 응답됩니다.
            </div>
        </li>
        <li class="qa_li">
            <div class="question">
                <p class="tit">Q5. 내가 가입하지 않은 아이디가 확인된다면 어떻게해야 하나요?</p>
                <p class="iconDiv"><img src="resources/img/q.png"></p>
            </div>
            <div class="answer"> 직접 가입하지 않은 아이디가 확인되었다면, 아이디찾기 페이지에서 본인 이메일로 인증하여 탈퇴하실 수 있습니다.</div>
        </li>
        <li class="qa_li">
            <div class="question">
                <p class="tit">Q6. 이메일 및 비밀번호 변경 인증메일이 오지 않았어요.</p>
                <p class="iconDiv"><img src="resources/img/q.png"></p>
            </div>
            <div class="answer"> 각 메일 서비스에 따라 메일 도착시간이 조금 지연될 수 있습니다. 메일이 도착하지 않을 경우, 스팸메일함을 확인해 보시거나
                한달살기사이트의 메일주소가 수신거부 되어있지 않은지 확인부탁드립니다.
            </div>
        </li>
        <li class="qa_li">
            <div class="question">
                <p class="tit">Q7. 아이디를 여러개 사용할 수 있나요?</p>
                <p class="iconDiv"><img src="resources/img/q.png"></p>
            </div>
            <div class="answer"> 인증을 받지 않은 아이디는 여러 개 보유할 수 있지만,정확한 안내와 활동을 하기 위해서는 1인당 1개의 아이디를 권장드립니다.</div>
        </li>
        <li class="qa_li">
            <div class="question">
                <p class="tit">Q8. 스케줄과 리뷰 작성 후, 수정 또는 삭제가 가능한가요?</p>
                <p class="iconDiv"><img src="resources/img/q.png"></p>
            </div>
            <div class="answer"> 스케줄과 리뷰는 각 페이지에서 [삭제]버튼을 통해 직접 삭제하실 수 있습니다.</div>
        </li>
        <li class="qa_li">
            <div class="question">
                <p class="tit">Q9. 내 캘린더를 [공개]로 적용해도 [다른사람 스케줄 보기]에 나타나지 않아요.</p>
                <p class="iconDiv"><img src="resources/img/q.png"></p>
            </div>
            <div class="answer"> 왜 안나타날까요?!?
        </li>
        <li class="qa_li">
            <div class="question">
                <p class="tit">Q10. 회원가입할때 설정한 나이와 성별은 변경하지 못하나요?</p>
                <p class="iconDiv"><img src="resources/img/q.png"></p>
            </div>
            <div class="answer"> 아쉽지만, 나이와 성별은 변경할 수 없습니다.</div>
        </li>
    </ul>
</div>
