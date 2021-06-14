<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<div class="container">
    <div class="section-title">
        <h4>1:1문의 작성하기</h4>
    </div>
    <form action="resultMent" id="checkUserForm" class="signup-form" name="SignInfo">
        <div class="row justify-content-center">
            <div class="col-md-12 col-lg-10 col-xl-10">
                <div class="login-wrap p-4 p-md-5">
                    <div class="icon d-flex align-items-center justify-content-center">
                        <span class="fa fa-edit"></span>
                    </div>
                    <h3 class="text-center mb-4">문의 작성</h3>
                    <div class="form-group mb-3" id="oneToOneAskCategoryBlock">
                        <label class="label" for="oneToOneAskCategory">목록</label><br>
                        <select name="oneToOneAskCategory" id="oneToOneAskCategory" class="form-control">
                            <c:forEach var="oneToOneAskCategory" items="${oneToOneAskCategory}">
                                <option value="${oneToOneAskCategory}">${oneToOneAskCategory.label}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group mb-3">
                        <label class="label" for="oneToOneAskSubject">제목</label>
                        <input type="text"
                               id="oneToOneAskSubject"
                               class="form-control"
                               placeholder="제목"
                               name="oneToOneAskSubject">
                    </div>

                    <div class="form-group mb-3">
                        <label class="label" for="oneToOneAskDesc">내용</label>
                        <input type="text"
                               id="oneToOneAskDesc"
                               class="form-control"
                               placeholder="내용"
                               name="oneToOneAskDesc">
                    </div>

                    <div class="form-group mb-3">
                        <label class="label" for="oneToOneAskUserEmail">이메일</label>
                        <input type="text"
                               id="oneToOneAskUserEmail"
                               class="form-control result-email"
                               placeholder="email"
                               name="oneToOneAskUserEmail">
                    </div>
                    <br>
                    <div class="form-group">
                        <input type="hidden" name="page" value="oneToOneAsk">
                        <button type="submit" id="submit"
                                class="form-control btn btn-primary rounded submit px-3">제출하기
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</body>