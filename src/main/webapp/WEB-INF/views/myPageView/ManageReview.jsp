<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="resources/css/review.css" type="text/css">
<script type="text/javascript" src="resources/js/myPage.js"></script>

<body>
<div class="container">
    <div class="row">
        <div class="col-lg-5">
            <div class="section-title"></div>
        </div>
        <div class="col-lg-7">
            <div class="property-controls">
                <ul class="reviewMenu">
                    <li><a href="manageReview?manageReviewCategory=writeReview">작성글</a></li>
                    <li>
                        <a href="manageReview?manageReviewCategory=writeReviewReply">댓글단글</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<form id="deleteMyReviewForm" action="manageReview">
    <c:choose>
        <c:when test="${myReviewList.size() == 0}">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section">작성하신 글이 없습니다.</h2>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="table table-hover">
                <input type="hidden" name="manageReviewCategory" id="manageReviewCategory"
                       value="${manageReviewCategory}">
                <table>
                    <thead>
                    <tr>
                        <th></th>
                        <th></th>
                        <th style="text-align: center">제목</th>
                        <th style="text-align: center">작성일</th>
                        <th style="text-align: center">좋아요</th>
                        <th style="text-align: center">조회</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="myReview" items="${myReviewList}">
                        <tr>
                            <td style="width:10%">${myReview.reviewNO}</td>
                            <c:choose>
                                <c:when test="${manageReviewCategory eq 'writeReviewReply'}">
                                    <td><input type="checkbox" name="myReviewCheckbox"
                                               value="${myReview.reviewReplyNO}"></td>
                                </c:when>
                                <c:otherwise>
                                    <td><input type="checkbox" name="myReviewCheckbox"
                                               value="${myReview.reviewNO}"></td>
                                </c:otherwise>
                            </c:choose>
                            <td style="width:35%">
                                <a href="getReview?reviewNO=${myReview.reviewNO}">${myReview.reviewSubject}</a>
                                <span class="reviewReplyCount">
                                    <c:if test="${myReview.replyCount ne null}">
                                        [${myReview.replyCount}]
                                    </c:if>
                                </span>
                            </td>
                            <td style="width:15%;text-align: center"><fmt:formatDate value="${myReview.reviewDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <c:set var="reviewLikeCount" value="${myReview.reviewLikeCount}"/>
                            <c:choose>
                                <c:when test="${scheduleLikeCount != null}">
                                    <td style="width:15%;text-align: center">${reviewLikeCount}</td>
                                </c:when>
                                <c:otherwise>
                                    <td style="width:15%;text-align: center">0</td>
                                </c:otherwise>
                            </c:choose>
                            <td style="width:15%;text-align: center">${myReview.reviewViewCount}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <jsp:include page="Paging.jsp">
                <jsp:param value="${manageReviewCategory}" name="manageReviewCategory"/>
                <jsp:param value="${paging.page}" name="page"/>
                <jsp:param value="${paging.beginPage}" name="beginPage"/>
                <jsp:param value="${paging.endPage}" name="endPage"/>
                <jsp:param value="${paging.prev}" name="prev"/>
                <jsp:param value="${paging.next}" name="next"/>
            </jsp:include>
        </c:otherwise>
    </c:choose>
    <button type="button" class="btn btn-sm btn-primary pull-right" onclick="deleteMyReview();">글삭제</button>

</form>
<c:if test="${myReviewList.size() != 0}">
    <input type='checkbox' name='myReviewCheckbox' value='reviewSelectAll' onclick='reviewSelectAll(this)'/>
    전체선택
</c:if>
</body>
