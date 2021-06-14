<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="resources/css/review.css" type="text/css">
<script type="text/javascript" src="resources/js/review.js"></script>

<body>

<c:choose>
    <c:when test="${reviewList.size() == 0}">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">등록된 게시글이 없습니다.</h2>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="table table-hover">
            <table>
                <thead>
                <tr>
                    <th></th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>
                        <a href="categoryReviewPage?category=${category}&selectedPage=${selectPage}&orderBy=dateOrderBy&dateDescAsc=${dateDescAsc}">작성일</a>
                    </th>
                    <th>
                        <a href="categoryReviewPage?category=${category}&selectedPage=${selectPage}&orderBy=likeOrderBy&likeDescAsc=${likeDescAsc}">좋아요</a>
                    </th>
                    <th>
                        <a href="categoryReviewPage?category=${category}&selectedPage=${selectPage}&orderBy=viewOrderBy&viewDescAsc=${viewDescAsc}">조회</a>
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="reviewList" items="${reviewList}">
                    <tr>
                        <td style="width:10%">${reviewList.reviewNO}</td>
                        <td style="width:35%"><a
                                href="getReview?reviewNO=${reviewList.reviewNO}">${reviewList.reviewSubject}</a>
                            <span class="reviewReplyCount">
                        <c:if test="${reviewList.replyCount ne null}">
                            [${reviewList.replyCount}]
                        </c:if>
                    </span>
                        </td>
                        <td style="width:10%">${reviewList.userNickName}</td>
                        <td style="width:15%"><fmt:formatDate value="${reviewList.reviewDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td style="width:15%">
                            <c:set var="reviewLikeCount" value="${reviewList.reviewLikeCount}"/>
                            <c:choose>
                                <c:when test="${reviewLikeCount != null}">
                                    ${reviewLikeCount}
                                </c:when>
                                <c:otherwise>
                                    0
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td style="width:15%">${reviewList.reviewViewCount}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <jsp:include page="Paging.jsp">
            <jsp:param value="categoryReviewPage" name="reviewPageType"/>
            <jsp:param value="${category}" name="category"/>
            <jsp:param value="${paging.page}" name="page"/>
            <jsp:param value="${paging.beginPage}" name="beginPage"/>
            <jsp:param value="${paging.endPage}" name="endPage"/>
            <jsp:param value="${paging.prev}" name="prev"/>
            <jsp:param value="${paging.next}" name="next"/>
            <jsp:param value="${orderBy}" name="orderBy"/>
            <jsp:param value="${dateDescAsc}" name="dateDescAsc"/>
            <jsp:param value="${likeDescAsc}" name="likeDescAsc"/>
            <jsp:param value="${viewDescAsc}" name="viewDescAsc"/>
        </jsp:include>
    </c:otherwise>
</c:choose>

<button type="button" class="btn btn-sm btn-primary pull-right" onclick="addReviewReply(${userVO.userNO});">
    글작성
</button>
</body>
</html>
