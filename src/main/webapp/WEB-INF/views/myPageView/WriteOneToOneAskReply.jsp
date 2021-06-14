<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
<section class="ftco-section pt-0">
    <div class="container">
        <form action="resultMentOneToOneAskReply" class="signup-form">
			<input type="hidden" id="oneToOneAskUserEmail" name="oneToOneAskUserEmail" value="${oneToOneAskVO.oneToOneAskUserEmail}">
			<div class="section-title">
				<h4>문의글 답변하기</h4>
			</div>
            <div class="row justify-content-center">
					<div class="col-md-12 col-lg-10 col-xl-10">
						<div class="login-wrap">
							<div class="form-group mb-3">
									<label class="label" for="oneToOneAskNO">번호</label> <input type="text"
										id="oneToOneAskNO" class="form-control" value="${oneToOneAskVO.oneToOneAskNO}"
										name="oneToOneAskNO" readonly>
								</div>

							<div class="form-group mb-3">
									<label class="label" for="oneToOneAskCategory">카테고리</label> <input type="text"
										id="oneToOneAskCategory" class="form-control" value="${oneToOneAskVO.oneToOneAskCategory}"
										name="oneToOneAskCategory" readonly>
								</div>

								<div class="form-group mb-3">
									<label class="label" for="oneToOneAskSubject">제목</label> <input type="text"
										id="oneToOneAskSubject" class="form-control" value="${oneToOneAskVO.oneToOneAskSubject}"
										name="oneToOneAskSubject" readonly>
								</div>

								<div class="form-group mb-3">
									<label class="label" for="oneToOneAskDesc">내용</label> <input type="text"
										id="oneToOneAskDesc" class="form-control" value="${oneToOneAskVO.oneToOneAskDesc}"
										name="oneToOneAskDesc" readonly>
								</div>

								<div class="form-group mb-3">
									<label class="label" for="oneToOneAskDate">작성날짜</label> <input type="text"
										id="oneToOneAskDate" class="form-control" value="${oneToOneAskVO.oneToOneAskDate}"
										name="oneToOneAskDate" readonly>
								</div>

								<div class="form-group mb-3">
									<label class="label" for="oneToOneAskReply">답변작성하기</label> <input type="text"
										id="oneToOneAskReply" class="form-control" placeholder="답변작성"
										name="oneToOneAskReply">
								</div>
								<br>
								<div class="form-group">
									<button type="submit" id="submit"
										class="form-control btn btn-primary rounded submit px-3">제출하기</button>
								</div>
						</div>
					</div>
				</div>
        </form>
    </div>
</section>
</body>