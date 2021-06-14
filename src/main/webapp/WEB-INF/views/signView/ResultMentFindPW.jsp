<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">비밀번호 찾기 발급결과</h2>
            </div>
        </div>
        <form action="/resultMentFindPW" method="post">
            <div class="row justify-content-center">
                <div class="col-md-7 col-lg-5">
                    <div class="d-flex">
                        <div class="w-100">
                            <h5 class="mb-4">회원님의 이메일로 임시비밀번호가 발급되었습니다.</h5>
                        </div>
                    </div>
                    <div class="form-group">
                        <a href="signIn" type="button" class="form-control btn btn-primary rounded submit px-3">로그인 하러가기</a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>