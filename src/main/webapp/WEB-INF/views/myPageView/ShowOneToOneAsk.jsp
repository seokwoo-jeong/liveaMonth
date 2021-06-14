<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<section class="ftco-section pt-0">
    <div class="container">
        <div class="section-title">
            <h4>문의내용</h4>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-12 col-lg-10 col-xl-10">
                <div class="login-wrap">
                    <div class="form-group mb-3 mt-0">
                        <label class="label" for="oneToOneAskNO">번호</label> <input
                            type="text" id="oneToOneAskNO" class="form-control"
                            value="${oneToOneAskVO.oneToOneAskNO}" name="oneToOneAskNO"
                            readonly>
                    </div>

                    <div class="form-group mb-3">
                        <label class="label" for="oneToOneAskCategory">카테고리</label> <input
                            type="text" id="oneToOneAskCategory" class="form-control"
                            value="${oneToOneAskVO.oneToOneAskCategory}"
                            name="oneToOneAskCategory" readonly>
                    </div>

                    <div class="form-group mb-3">
                        <label class="label" for="oneToOneAskSubject">제목</label> <input
                            type="text" id="oneToOneAskSubject" class="form-control"
                            value="${oneToOneAskVO.oneToOneAskSubject}"
                            name="oneToOneAskSubject" readonly>
                    </div>

                    <div class="form-group mb-3">
                        <label class="label" for="oneToOneAskDesc">내용</label> <input
                            type="text" id="oneToOneAskDesc" class="form-control"
                            value="${oneToOneAskVO.oneToOneAskDesc}" name="oneToOneAskDesc"
                            readonly>
                    </div>

                    <div class="form-group mb-3">
                        <label class="label" for="oneToOneAskDate">작성날짜</label> <input
                            type="text" id="oneToOneAskDate" class="form-control"
                            value="${oneToOneAskVO.oneToOneAskDate}" name="oneToOneAskDate"
                            readonly>
                    </div>
                    <div class="form-group mb-3">
                        <label class="label" for="oneToOneAskReply">답변</label> <input
                            type="text" id="oneToOneAskReply" class="form-control"
                            value="${oneToOneAskVO.oneToOneAskReply}"
                            name="oneToOneAskReply" readonly>
                    </div>
                    <br>
                    <div class="form-group">
                            <button href="oneToOneAsk" class="form-control btn btn-primary rounded submit px-3">확인
                            </button>
                    </div>
                    <div>
                        <form action="resultMent" class="signup-form" id="checkUserForm">
                            <input type="hidden" name="oneToOneAskNO"
                                   value="${oneToOneAskVO.oneToOneAskNO}">
                            <input type="hidden" name="page"
                                   value="deleteOneToOneAsk">
                            <button type="submit" id="submit"
                                    class="form-control btn btn-primary rounded submit px-3">삭제하기
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>