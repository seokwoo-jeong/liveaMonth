<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="ftco-section">
    <div class="container">
        <form action="/resultMentFindID" method="post">
            <div class="row justify-content-center">
                <div class="col-md-7 col-lg-5">
                    <div class="d-flex">
                        <div class="w-100">
                            <h3 class="mb-4">아이디 찾기</h3>
                        </div>
                    </div>
                    <div class="form-group mt-3">
                        <input type="text" class="form-control" id="userName" name="userName" required>
                        <label class="form-control-placeholder" for="userName">Name</label>
                    </div>
                    <div class="form-group mt-3">
                        <input type="text" class="form-control" id="userEmail" name="userEmail" required>
                        <label class="form-control-placeholder" for="userEmail">Email</label>
                    </div>
                    <div class="form-group">
                        <button type="submit" id=findBtn class="form-control btn btn-primary rounded submit px-3">아이디 찾기
                        </button>
                        <p></p>
                    </div>
                    <c:if test="${!firstIn}">
                        <p class="text-center" style="color:#ff0000">등록되지 않은 회원정보입니다. 이름과 이메일을 다시 확인해주세요.</p>
                    </c:if>
                </div>
            </div>
        </form>
    </div>