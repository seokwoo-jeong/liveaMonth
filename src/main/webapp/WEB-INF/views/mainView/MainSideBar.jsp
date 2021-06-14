<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<body>
<div class="col-lg-4">
    <div class="blog-sidebar">
        <div class="subscribe-form">
            <c:if test="${empty userVO.userNO}">
                <div class="section-title sidebar-title-b">
                    <h6>로그인</h6>
                </div>
                <p>더욱 다양한 한달살기 정보를 제공받으세요.</p>
                <div class="hs-top">
                    <div class="ht-widget">
                        <a href="signIn" class="hw-btn">signIn</a>
                    </div>
                </div>
            </c:if>
            <c:if test="${userVO.userNO != null}">
                <div class="as-item">
                    <div class="user-pic">
                        <c:choose>
                            <c:when test="${userVO.userImage == null}">
                                <img src="https://liveamonth-resources.s3.ap-northeast-2.amazonaws.com/img/user/default.jpg"
                                     alt>
                            </c:when>
                            <c:otherwise>
                                <img src=${userVO.getUserImageURL()} alt>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="as-text">
                        <div class="at-title">
                            <h6>${userVO.userNickname}님</h6>
                        </div>
                        <ul>
                            <li>Email <span>${userVO.userEmail}</span></li>
                            <li>Sex <span>${userVO.getUserSexToString()}</span></li>
                            <li>Age <span>${userVO.getUserRealAge()}세</span></li>
                        </ul>
                        <a href="myPage" class="site-btn">MyPage</a>
                        <a href="logout" class="site-btn">Logout</a>
                    </div>
                </div>
                <div class="pd-text">
                    <div class="pd-board mb-0">
                        <div class="tab-board">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="user-service">
                                    <a class="nav-link" data-toggle="tab" href="#profile-tabs-1" role="tab"
                                       style="font-size: 16px">My
                                        Schedule</a>
                                </li>
                                <li class="user-service" style="font-size: 16px">
                                    <a class="nav-link" data-toggle="tab" href="#profile-tabs-2" role="tab"
                                       style="font-size: 16px">My
                                        Review</a>
                                </li>
                            </ul><!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane" id="profile-tabs-1" role="tabpanel">
                                    <div class="tab-desc pl-3 pr-1">
                                        <div class="row">
                                            <c:choose>
                                                <c:when test="${myScheduleList.size() == 0}">
                                                    <div class="text-center mt-2 pr-2" style="width: 100%;">
                                                        <h6 class="heading-section" style="font-size: 22px">작성하신 글이 없습니다.</h6>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="table table-hover mb-0">
                                                        <input type="hidden" name="manageScheduleCategory"
                                                               id="manageScheduleCategory"
                                                               value="${manageScheduleCategory}">
                                                        <table>
                                                            <thead style="font-size: 10px;background-color:aliceblue">
                                                            <tr>
                                                                <th>NO</th>
                                                                <th style="text-align: center">제목</th>
                                                                <th>좋아요</th>
                                                                <th>조회</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody style="font-size: 12px">
                                                            <c:forEach var="mySchedule" end="5"
                                                                       items="${myScheduleList}">
                                                                <tr>
                                                                    <td style="width:5%">${mySchedule.scheduleNO}</td>
                                                                    <input type="hidden" name="myScheduleCheckbox"
                                                                           value="${mySchedule.scheduleNO}">
                                                                    <td style="width:50%;"><a
                                                                            href="otherSchedule?scheduleNO=${mySchedule.scheduleNO}">${mySchedule.scheduleSubject}</a>
                                                                        <span class="scheduleReplyCount">
                                                                    <c:if test="${mySchedule.replyCount ne null}">
                                                                        [${mySchedule.replyCount}]
                                                                    </c:if>
                                                                     </span>
                                                                    </td>
                                                                    <td style="width:20%;padding-left: 25px">
                                                                        <c:set var="scheduleLikeCount" value="${mySchedule.scheduleLikeCount}"/>
                                                                        <c:choose>
                                                                            <c:when test="${scheduleLikeCount != null}">
                                                                                ${scheduleLikeCount}
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                0
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td style="width:15%">${mySchedule.scheduleViewCount}</td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="profile-tabs-2" role="tabpanel">
                                    <div class="tab-desc pl-3 pr-1">
                                        <div class="row">
                                            <c:choose>
                                                <c:when test="${myReviewList.size() == 0}">
                                                    <div class="text-center mt-2 pr-2" style="width: 100%;">
                                                        <h6 class="heading-section" style="font-size: 22px">작성하신 글이 없습니다.</h6>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="table table-hover mb-0">
                                                        <input type="hidden" name="manageReviewCategory"
                                                               id="manageReviewCategory"
                                                               value="${manageReviewCategory}">
                                                        <table>
                                                            <thead style="font-size: 10px;background-color:aliceblue">
                                                            <tr>
                                                                <th>NO</th>
                                                                <th style=" text-align: center">제목</th>
                                                                <th>좋아요</th>
                                                                <th>조회</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody style="font-size: 12px">
                                                            <c:forEach var="myReview" end="5" items="${myReviewList}">
                                                                <tr>
                                                                    <td style="width:5%">${myReview.reviewNO}</td>
                                                                    <input type="hidden" name="myScheduleCheckbox"
                                                                           value="${myReview.reviewNO}">
                                                                    <td style="width:50%;"><a
                                                                            href="getReview?reviewNO=${myReview.reviewNO}">${myReview.reviewSubject}</a>
                                                                        <span class="reviewReplyCount">
                                                                        <c:if test="${myReview.replyCount ne null}">
                                                                            [${myReview.replyCount}]
                                                                        </c:if>
                                                                        </span>
                                                                    </td>
                                                                    <td style="width:20%;padding-left: 25px">
                                                                        <c:set var="reviewLikeCount" value="${myReview.reviewLikeCount}"/>
                                                                        <c:choose>
                                                                            <c:when test="${reviewLikeCount != null}">
                                                                                ${reviewLikeCount}
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                0
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td style="width:15%">${myReview.reviewViewCount}</td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>
</body>