<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<body>
<link rel="stylesheet" href="resources/css/review.css" type="text/css">


<div class="default_review_page">
    <div class="left_section">
        <div>
            <span class="reviewCategoryName">전체글보기</span>
            <a href="categoryReviewPage?category=all" class="showMore">더보기></a>
        </div>

        <ul class="reviewMenu">
            <c:forEach var="reviewVO" items="${AllReviewList}" end="30">
                <li class="reviewCategorySubject">
                    <a href="getReview?reviewNO=${reviewVO.reviewNO}">${reviewVO.reviewSubject}</a>
                    <span class="reviewReplyCount">
                        <c:if test="${reviewVO.replyCount ne null}">
                            [${reviewVO.replyCount}]
                        </c:if>
                    </span>
                    <span class="reviewCategoryViewCount"> ${reviewVO.reviewViewCount} </span>
                </li>
            </c:forEach>
        </ul>

    </div>


    <div class="right_top_section">
        <div>
            <span class="reviewCategoryName">인기게시판</span>
            <a href="categoryReviewPage?category=popular" class="showMore">더보기></a>
        </div>


        <ul class="reviewMenu">
            <c:forEach var="reviewVO" items="${popularReviewList}" end="10">
                <li class="reviewCategorySubject">
                    <a href="getReview?reviewNO=${reviewVO.reviewNO}">${reviewVO.reviewSubject}</a>
                    <span class="reviewReplyCount">
                        <c:if test="${reviewVO.replyCount ne null}">
                            [${reviewVO.replyCount}]
                        </c:if>
                    </span>
                    <span class="reviewCategoryViewCount"> ${reviewVO.reviewViewCount} </span>
                </li>
            </c:forEach>
        </ul>

    </div>

    <div class="right_bottom_section">

        <div>
            <span class="reviewCategoryName">자유게시판</span>
            <a href="categoryReviewPage?category=free" class="showMore">더보기></a>
        </div>


        <ul class="reviewMenu">
            <c:forEach var="reviewVO" items="${freeReviewList}" end="10">
                <li class="reviewCategorySubject">
                    <a href="getReview?reviewNO=${reviewVO.reviewNO}">${reviewVO.reviewSubject}</a>
                    <span class="reviewReplyCount">
                        <c:if test="${reviewVO.replyCount ne null}">
                            [${reviewVO.replyCount}]
                        </c:if>
                    </span>
                    <span class="reviewCategoryViewCount"> ${reviewVO.reviewViewCount} </span>
                </li>
            </c:forEach>
        </ul>
    </div>

</div>
</body>

</html>