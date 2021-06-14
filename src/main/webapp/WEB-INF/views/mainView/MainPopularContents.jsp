<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<body>
<div class="col-lg-8">
    <div class="pd-text">
        <div class="pd-board">
            <div class="tab-board">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">SCHEDULE</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">REVIEW</a>
                    </li>
                </ul>
                <!-- Tab Contents -->
                <div class="tab-content">
                    <%--다른사람 스케줄--%>
                    <div class="tab-pane active" id="tabs-1" role="tabpanel" >
                        <div class="tab-desc" style="overflow: visible">
                            <div class="row" style="overflow: visible">
                                <c:if test="${otherScheduleList != null}">
                                    <c:forEach var="scheduleContent" items="${otherScheduleList}"
                                               varStatus="status">
                                        <div class="blog-item pl-0 pt-0" style="overflow: visible">
                                            <div class="pc-table m-0" style="width: 32%;float: left;">
                                                <a href="otherSchedule?userNO=${scheduleContent.userVO.userNO}&scheduleNO=${scheduleContent.scheduleNO}">
                                                    <c:out value="${scheduleContent.scheduleVO.scheduleSubject}"/>
                                                    <c:set var = "todayInformation" value = "${CalendarDTOTodayInformationList.get(status.index)}" scope = "request"/>
                                                    <c:set var = "dateList" value = "${CalendarDTODateList.get(status.index)}" scope = "request"/>
                                                    <c:set var = "listIndex" value = "${status.index+1}" scope = "request"/>
                                                    <jsp:include page="/WEB-INF/views/scheduleView/SmallSizeOfOtherSchedule.jsp"/>
                                                </a>
                                            </div>
                                            <div class="bi-text pt-4 pl-3">
                                                <h5><a href="/otherSchedule?userNO=${scheduleContent.userVO.userNO}&scheduleNO=${scheduleContent.scheduleNO}">${scheduleContent.scheduleSubject}</a></h5>
                                                <ul>
                                                    <li>by <span>${scheduleContent.userVO.userNickname}</span>
                                                    </li>
                                                    <li><span>${scheduleContent.userVO.getUserRealAge()}세</span>
                                                    </li>
                                                    <li>
                                                        <span>${scheduleContent.userVO.getUserSexToString()}</span>
                                                    </li>
                                                    <li>
                                                        <i class="icon_like mr-1"></i><span>${scheduleContent.scheduleLikeCount}</span>
                                                    </li>
                                                </ul>
                                                <p>${scheduleContent.userVO.userNickname}님의 ${scheduleContent.cityVO.cityName}에서
                                                    한달살기 스케줄 입니다!!</p>
                                                <a href="/otherSchedule?userNO=${scheduleContent.userVO.userNO}&scheduleNO=${scheduleContent.scheduleNO}"
                                                   class="read-more">스케줄 보러가기 <span class="arrow_right"></span></a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <%--인기 게시글--%>
                    <div class="tab-pane" id="tabs-2" role="tabpanel">
                        <div class="tab-desc">
                            <div class="row">
                                <c:forEach var="reviewVO" items="${popularReviewList}"
                                           varStatus="status">
                                    <div class="blog-item">
                                        <div class="pr-pic">
                                            <img src="${reviewVO.userVO.getUserImageURL()}" alt="">
                                        </div>
                                        <div class="bi-text">
                                            <h5><a href="getReview?reviewNO=${reviewVO.reviewNO}">${reviewVO.reviewSubject}</a></h5>
                                            <ul>
                                                <li>by <span>${reviewVO.userVO.userNickname}</span>
                                                </li>
                                                <li><span><fmt:formatDate value="${reviewVO.reviewDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                                </li>
                                                <li>
                                                    <i class="icon_like mr-1"></i><span>${reviewVO.reviewLikeCount}</span>
                                                </li>
                                                <li>
                                                    <i class="fa fa-eye mr-1"></i><span>${reviewVO.reviewViewCount}</span>
                                                </li>
                                            </ul>
                                            <p>${reviewVO.userVO.userNickname}님이 작성한 게시글입니다!!</p>
                                            <a href="getReview?reviewNO=${reviewVO.reviewNO}" class="read-more">
                                                게시글 보러가기 <span class="arrow_right"></span></a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
