<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link rel="stylesheet" href="resources/css/myPage.css" type="text/css">
<script type="text/javascript" src="resources/js/myPage.js"></script>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-5">
            <div class="section-title"></div>
        </div>
        <div class="col-lg-7">
            <div class="property-controls">
                <ul class="scheduleMenu">
                    <li><a href="manageSchedule?manageScheduleCategory=writeSchedule">작성글</a></li>
                    <li>
                        <a href="manageSchedule?manageScheduleCategory=writeScheduleReply">댓글단글</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<form id="deleteMyScheduleForm" action="manageSchedule">
    <c:choose>
        <c:when test="${myScheduleList.size() == 0}">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section">작성하신 글이 없습니다.</h2>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="table table-hover">
                <input type="hidden" name="manageScheduleCategory" id="manageScheduleCategory"
                       value="${manageScheduleCategory}">
                <table>
                    <thead>
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th style="text-align: center">제목</th>
                        <th style="text-align: center">좋아요</th>
                        <th style="text-align: center">조회</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="mySchedule" items="${myScheduleList}" varStatus="status">
                        <tr>
                            <td style="width:10%">${mySchedule.scheduleNO}</td>
                            <c:choose>
                                <c:when test="${manageScheduleCategory eq 'writeScheduleReply'}">
                                    <td><input type="checkbox" name="myScheduleCheckbox"
                                               value="${mySchedule.scheduleReplyNO}"></td>
                                </c:when>
                                <c:otherwise>
                                    <td><input type="checkbox" name="myScheduleCheckbox"
                                               value="${mySchedule.scheduleNO}"></td>
                                </c:otherwise>
                            </c:choose>
                            <td>
                                <div class="pc-table m-0" style="width: 35%;float: left;">
                                    <a href="otherSchedule?scheduleNO=${mySchedule.scheduleNO}">
                                        <c:set var = "todayInformation" value = "${CalendarDTOTodayInformationList.get(status.index)}" scope = "request"/>
                                        <c:set var = "dateList" value = "${CalendarDTODateList.get(status.index)}" scope = "request"/>
                                        <c:set var = "listIndex" value = "${status.index+1}" scope = "request"/>
                                        <jsp:include page="/WEB-INF/views/scheduleView/SmallSizeOfOtherSchedule.jsp"/>
                                    </a>
                                </div>
                            </td>
                            <td style="width:35%">
                                <a href="otherSchedule?scheduleNO=${mySchedule.scheduleNO}">${mySchedule.scheduleSubject}</a>
                                <span class="scheduleReplyCount">
                                    <c:if test="${mySchedule.replyCount ne null}">
                                        [${mySchedule.replyCount}]
                                    </c:if>
                                </span>
                            </td>
                            <c:set var="scheduleLikeCount" value="${mySchedule.scheduleLikeCount}"/>
                            <c:choose>
                                <c:when test="${scheduleLikeCount != null}">
                                    <td style="width:15%;text-align: center">${scheduleLikeCount}</td>
                                </c:when>
                                <c:otherwise>
                                    <td style="width:15%;text-align: center">0</td>
                                </c:otherwise>
                            </c:choose>
                            <td style="width:15%;text-align: center">${mySchedule.scheduleViewCount}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>

            <jsp:include page="Paging.jsp">
                <jsp:param value="${manageScheduleCategory}" name="manageScheduleCategory"/>
                <jsp:param value="${paging.page}" name="page"/>
                <jsp:param value="${paging.beginPage}" name="beginPage"/>
                <jsp:param value="${paging.endPage}" name="endPage"/>
                <jsp:param value="${paging.prev}" name="prev"/>
                <jsp:param value="${paging.next}" name="next"/>
            </jsp:include>
        </c:otherwise>
    </c:choose>
    <button type="button" class="btn btn-sm btn-primary pull-right" onclick="deleteMySchedule();">글삭제</button>
</form>
<c:if test="${myScheduleList.size() != 0}">
    <input type='checkbox' name='myScheduleCheckbox' value='scheduleSelectAll' onclick='scheduleSelectAll(this)'/> 전체선택
</c:if>
</body>