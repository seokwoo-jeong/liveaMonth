<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<header>
    <title>reviewHeader</title>
</header>


<body>
<section class="profile-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-5">
                <div class="section-title"></div>
            </div>
            <div class="col-lg-7">
                <div class="property-controls">
                    <ul class="reviewMenu">
                        <li><a href="review">메인화면</a></li>
                        <li>
                            <a href="categoryReviewPage?category=all">전체게시판</a>
                        </li>
                        <li>
                            <a href="categoryReviewPage?category=popular">인기게시판</a>
                        </li>
                        <li>
                            <a href="categoryReviewPage?category=free">자유게시판</a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
</body>