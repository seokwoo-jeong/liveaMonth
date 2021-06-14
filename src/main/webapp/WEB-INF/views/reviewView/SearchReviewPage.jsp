<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/review.css" type="text/css">

<body>

<section class="property-section ">
    <div class="container">
        <form action="searchReviewPage" class="filter-form">
            <div class="row">
                <div class="col-lg-10">
                    <div class="pd-text">
                        <div class="row">
                            <div class="col-lg-2">
                                <div class="pd-title">

                                    <select name="searchDate" id="searchDate" class="sm-width">
                                        <c:forEach var="reviewSearchDate" items="${reviewSearchDate}">
                                            <option id="${reviewSearchDate}" value="${reviewSearchDate}">${reviewSearchDate.nameKR}</option>
                                        </c:forEach>
                                    </select>
                                    <script> $('#${selectedDate}').prop("selected",true); </script>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="pd-title">
                                    <select name="searchCategory" id="searchCategory" class="sm-width">
                                        <option id="all" value="all">전체게시판</option>
                                        <option id="popular" value="popular">인기게시판</option>
                                        <option id="free" value="free">자유게시판</option>
                                        <c:forEach var="reviewCategory" items="${reviewCategoryList}">
                                            <option id="${reviewCategory}" value="${reviewCategory}">${reviewCategory.nameKR}</option>
                                        </c:forEach>
                                    </select>
                                    <script> $('#${selectedCategory}').prop("selected",true); </script>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="pd-title">
                                    <select name="searchDetail" id="searchDetail" class="sm-width">
                                        <c:forEach var="reviewSearchDetail" items="${reviewSearchDetail}">
                                            <option id="${reviewSearchDetail}" value="${reviewSearchDetail}">${reviewSearchDetail.nameKR}</option>
                                        </c:forEach>
                                    </select>
                                    <script> $('#${selectedDetail}').prop("selected",true); </script>
                                </div>
                            </div>
                            <div>
                                <div class="col-lg-2">
                                    <div class="pd-title">
                                        <input type="text" style="width:200px; height:40px;" id="search" name="search" value="${search}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="pd-title">
                                    <input type="submit" name="order" value="검색"
                                           class="btn btn-sm btn-primary pull-right">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>

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
            <th >제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>좋아요</th>
            <th>조회</th>
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
                <td style="width:15%">${reviewList.reviewDate}</td>
                <td style="width:15%">${reviewList.reviewLikeCount}</td>
                <td style="width:15%">${reviewList.reviewViewCount}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
        <jsp:include page="Paging.jsp">
            <jsp:param value="${search}" name="search"/>
            <jsp:param value="${paging.page}" name="page"/>
            <jsp:param value="${paging.beginPage}" name="beginPage"/>
            <jsp:param value="${paging.endPage}" name="endPage"/>
            <jsp:param value="${paging.prev}" name="prev"/>
            <jsp:param value="${paging.next}" name="next"/>
        </jsp:include>
    </c:otherwise>
</c:choose>




<button type="button" class="btn btn-sm btn-primary pull-right" onclick="addScheduleReply(${param.scheduleReplyNO});">
    글작성
</button>
</body>
<script>
    function addScheduleReply(scheduleReplyNO) {
        var userNO = "${userVO.userNO}";
        if (userNO == "" || userNO == null) {
            alert("로그인 후 이용해주세요.");
            return false;
        }
        location.replace("/reviewWrite")
    }
</script>
</html>
