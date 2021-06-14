<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="resources/css/reply.css" rel="stylesheet" type="text/css">
    <script src="resources/js/review.js"></script>
    <script src="resources/js/reply.js"></script>
</head>
<body>
<input type="hidden" id="userNO" name="userNO" value="${userVO.userNO}"/>
<input type="hidden" id="selectedReviewNO" name="selectedReviewNO" value="${reviewVO.reviewNO}"/>
<section class="blog-details-section pt-0 spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="blog-item-list">
                    <div class="blog-item large-blog pb-0">
                        <div class="bi-text">
                            <c:if test="${userVO.userNO == reviewVO.userVO.userNO}">
                                <button type="button" class="btn btn-sm btn-primary pull-right" onclick="deleteReviewButton(${reviewVO.reviewNO});"> 삭제 </button>
                                <button type="button" class="btn btn-sm btn-primary pull-right" style="margin-right: 1%;" onclick="moveModifyReviewPage(${reviewVO.reviewNO});"> 수정 </button>
                            </c:if>

                            <h2 style = "font-weight: bold; text-align: center; margin-bottom: 5%;">${reviewVO.reviewSubject}</h2>
                            <ul style="float: right;">
                                <li>by <span>${reviewVO.userVO.userNickname}</span></li>
                                <li>${reviewVO.reviewDate}</li>
                                <li>조회수 ${reviewVO.reviewViewCount}</li>
                            </ul>

                        </div>
                        <span id="likeCount" class="likeSpan" style="float: right;"> &nbsp;${reviewLikeCount} </span>
                        <a href="#" class="heart-icon pt-2" onclick="updateReviewLike(); return false;" style="float: right">
                            <c:choose>
                                <c:when test="${likeStatus == 1}">
                                    <span id="like" class="icon_heart dis-none"></span>
                                </c:when>
                                <c:otherwise>
                                    <span id="like" class="icon_heart_alt"></span>
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <span class="likeSpanText" style="float: right;"> 좋아요&nbsp;&nbsp; </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 m-auto p-0">
                <div class="blog-details-content">
                    <div class="bc-top">
                        <div>
                            ${reviewVO.reviewDesc}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="blog-details-section spad">
    <div class="container bootdey">
        <div class="col-lg-7">
            <div class="section-title">
                <h4>Comments</h4>
            </div>
        </div>
        <div class="col-md-12 bootstrap snippets">
            <div class="panel">
                <jsp:include page="ReviewReplyDesc.jsp">
                    <jsp:param value="${reviewVO.reviewNO}" name="reviewNO"/>
                    <jsp:param value="0" name="reviewReplyNO"/>
                </jsp:include>
            </div>
            <div class="panel">
                <div class="panel-body">
                    <c:forEach var="reviewReplyMap" items="${reviewReplyList}">
                        <c:if test="${reviewReplyMap.reviewReplyVO.reviewReplyRefNO == 0 || reviewReplyMap.NO == reviewReplyList[0].NO}">
                            <div class="media-block">
                                <a class="media-left" href="#">
                                    <c:choose>
                                        <c:when test="${reviewReplyMap.userVO.userImage == null}">
                                            <img class="img-circle img-sm" alt="Profile Picture"
                                                 src="https://liveamonth-resources.s3.ap-northeast-2.amazonaws.com/img/user/default.jpg">
                                        </c:when>
                                        <c:otherwise>
                                            <img class="img-circle img-sm" alt="Profile Picture"
                                                 src="${reviewReplyMap.userVO.getUserImageURL()}">
                                        </c:otherwise>
                                    </c:choose>
                                <div class="media-body">
                                    <c:choose>
                                        <c:when test="${reviewReplyMap.reviewReplyVO.reviewReplyRefNO == 0}">
                                            <jsp:include page="ReviewReply.jsp">
                                                <jsp:param value="${reviewReplyMap.reviewReplyVO.reviewNO}" name="reviewNO"/>
                                                <jsp:param value="${reviewReplyMap.userVO.userNickname}" name="userNickname"/>
                                                <jsp:param value="${reviewReplyMap.reviewReplyVO.reviewReplyNO}" name="reviewReplyNO"/>
                                                <jsp:param value="${reviewReplyMap.reviewReplyVO.reviewReplyDate}" name="reviewReplyDate"/>
                                                <jsp:param value="${reviewReplyMap.reviewReplyVO.reviewReplyDesc}" name="reviewReplyDesc"/>
                                                <jsp:param value="${reviewReplyMap.userVO.userNO}" name="userNO"/>
                                            </jsp:include>
                                        </c:when>
                                        <c:when test="${reviewReplyMap.NO == reviewReplyList[0].NO}">
                                            <c:set var="beforePageReviewReplyNO"
                                                   value="${reviewReplyMap.reviewReplyVO.reviewReplyRefNO}"></c:set>
                                            <div class="media-body">
                                                <p>
                                                    <br>
                                                    &nbsp;&nbsp;이전 페이지의 대댓글입니다.
                                                </p>
                                            </div>
                                            <hr>
                                        </c:when>
                                    </c:choose>

                                    <c:forEach var="reviewReplyRefMap" items="${reviewReplyList}">
                                        <c:if test="${reviewReplyMap.reviewReplyVO.reviewReplyNO == reviewReplyRefMap.reviewReplyVO.reviewReplyRefNO || beforePageReviewReplyNO == reviewReplyRefMap.reviewReplyVO.reviewReplyRefNO}">
                                            <div>
                                                <div class="media-block">
                                                    <a class="media-left" href="#">
                                                        <c:choose>
                                                            <c:when test="${reviewReplyRefMap.userVO.userImage == null}">
                                                                <img class="img-circle img-sm" alt="Profile Picture"
                                                                     src="https://liveamonth-resources.s3.ap-northeast-2.amazonaws.com/img/user/default.jpg">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img class="img-circle img-sm" alt="Profile Picture"
                                                                     src="${reviewReplyRefMap.userVO.getUserImageURL()}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </a>
                                                    <div class="media-body">
                                                        <jsp:include page="ReviewReply.jsp">
                                                            <jsp:param value="${reviewReplyRefMap.reviewReplyVO.reviewNO}" name="reviewNO"/>
                                                            <jsp:param value="${reviewReplyRefMap.userVO.userNickname}" name="userNickname"/>
                                                            <jsp:param value="${reviewReplyRefMap.reviewReplyVO.reviewReplyNO}" name="reviewReplyNO"/>
                                                            <jsp:param value="${reviewReplyRefMap.reviewReplyVO.reviewReplyRefNO}" name="reviewReplyRefNO"/>
                                                            <jsp:param value="${reviewReplyRefMap.reviewReplyVO.reviewReplyDate}" name="reviewReplyDate"/>
                                                            <jsp:param value="${reviewReplyRefMap.reviewReplyVO.reviewReplyDesc}" name="reviewReplyDesc"/>
                                                            <jsp:param value="${reviewReplyRefMap.userVO.userNO}" name="userNO"/>
                                                        </jsp:include>
                                                        <hr>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                    <c:set var="beforePageReviewReplyNO" value="-1"></c:set>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                    <jsp:include page="../scheduleView/Paging.jsp">
                        <jsp:param value="${reviewReplyList[0].reviewReplyVO.reviewNO}" name="reviewNO"/>
                        <jsp:param value="${paging.page}" name="page"/>
                        <jsp:param value="${paging.beginPage}" name="beginPage"/>
                        <jsp:param value="${paging.endPage}" name="endPage"/>
                        <jsp:param value="${paging.prev}" name="prev"/>
                        <jsp:param value="${paging.next}" name="next"/>
                        <jsp:param value="reviewReplyPage" name="replyPageType"/>
                    </jsp:include>

                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
