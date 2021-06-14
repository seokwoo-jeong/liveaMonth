<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" href="resources/css/schedule.css" type="text/css">
<link rel="stylesheet" href="resources/css/onOff.css" type="text/css">
<script src="resources/js/schedule.js"></script>
<script>
    var message = "${message}";
    if (message != "") {
        alert(message);
    }
</script>
<body style="background:#ffffff">
<section class="blog-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="section-title">
                    <h4>스케줄 표</h4>
                </div>
                <form name="calendarFrm" id="calendarFrm" action="schedule" method="GET">
                    <input type="hidden" name="year" value="${todayInformation.searchYear}"/>
                    <input type="hidden" name="month" value="${todayInformation.searchMonth-1}"/>
                    <div class="calendar">
                        <!--날짜 네비게이션  -->
                        <div class="navigation">
                            <a class="before_after_year"
                               href="./schedule?year=${todayInformation.searchYear-1}&month=${todayInformation.searchMonth-1}">
                                &lt;&lt; <!-- 이전해 -->
                            </a>
                            <a class="before_after_month"
                               href="./schedule?year=${todayInformation.beforeYear}&month=${todayInformation.beforeMonth}">
                                &lt; <!-- 이전달 -->
                            </a>
                            <span class="this_month">
                                &nbsp;${todayInformation.searchYear}.
                                <c:if test="${todayInformation.searchMonth<10}">0</c:if>
                                ${todayInformation.searchMonth}
				            </span>
                            <a class="before_after_month"
                               href="/schedule?year=${todayInformation.afterYear}&month=${todayInformation.afterMonth}">
                                <!-- 다음달 --> &gt;
                            </a>
                            <a class="before_after_year"
                               href="/schedule?year=${todayInformation.searchYear+1}&month=${todayInformation.searchMonth-1}">
                                <!-- 다음해 --> &gt;&gt;
                            </a>
                            <span>
				                <div>
				<button type="button" class="site-btn" data-toggle="modal" style="float: right;"
                        data-target="#addScheduleContentModal">스케줄 등록</button>
			    </div>
			                </span>
                        </div>
                        <table class="calendar_body">
                            <thead>
                            <tr bgcolor="#CECECE">
                                <td class="day sun">일</td>
                                <td class="day">월</td>
                                <td class="day">화</td>
                                <td class="day">수</td>
                                <td class="day">목</td>
                                <td class="day">금</td>
                                <td class="day sat">토</td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <c:forEach var="dateList" items="${dateList}" varStatus="dateStatus">
                                <c:choose>
                                <c:when test="${dateList.value=='today'}">
                                <c:if test="${dateStatus.index%7==0}">
                            <tr>
                                </c:if>
                                <td class="today">
                                    <div class="date"></div>
                                    </c:when>
                                    <c:when test="${dateStatus.index%7==6}">
                                <td class="sat_day">
                                    <div class="sat"></div>
                                    </c:when>
                                    <c:when test="${dateStatus.index%7==0}">
                            </tr>
                            <tr>
                                <td class="sun_day">
                                    <div class="sun">
                                        </c:when>
                                        <c:otherwise>
                                <td class="normal_day">
                                    <div class="date"></div>
                                    </c:otherwise>
                                    </c:choose>
                                        ${dateList.date}
                                    <div>
                                        <c:forEach var="scheduleList" items="${dateList.scheduleDataArray}"
                                                   varStatus="scheduleDataArrayStatus">
                                            <div class="hoverScheduleSubject">
                                                <a href="#" data-toggle="modal"
                                                   data-target="#showScheduleContentModal"
                                                   onclick="showScheduleContentList('${scheduleList.scheduleContentNO}','${scheduleList.scheduleContentSubject}','${scheduleList.scheduleContentDate}',
                                                           '${scheduleList.scheduleContentDesc}','${scheduleList.scheduleContentCost}')">
                                                    <span class="thick"> ${scheduleList.scheduleContentSubject} </span>
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </td>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
            <div class="col-lg-4">
                <%--캘린더 관리--%>
                <div class="section-title">
                    <h4>캘린더 관리</h4>
                </div>
                <div class="search-form-content mb-0" style="display: inline-block">
                    <form name="swapSchedule" action="swapSchedule" class="filter-form">
                        <select class="sm-width" name="selectSchedule" id="selectSchedule"  onchange="this.form.submit()" style="width: 100%">
                            <c:forEach var="scheduleVO" items="${scheduleVOList}">
                                <option id="${scheduleVO.scheduleNO}"
                                        value="${scheduleVO.scheduleNO}">${scheduleVO.scheduleSubject}</option>
                            </c:forEach>
                        </select>
                        <script>$('#${selectedScheduleNO}').prop("selected", true); </script>
<%--                        <input type="button" class="search-btn sm-width" value="확인">--%>
                    </form>
                </div>
                <div class="pd-text" style="overflow: visible;">
                    <div class="pd-board mb-3" style="overflow: visible;">
                        <div class="tab-board" style="overflow: visible;">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="user-service">
                                    <a class="nav-link active" data-toggle="tab" href="#calendar-tabs-1" role="tab"
                                       aria-selected="false">켈린더 등록</a>
                                </li>
                                <li class="user-service">
                                    <a class="nav-link" data-toggle="tab" href="#calendar-tabs-2" role="tab"
                                       aria-selected="true">캘린더 수정</a>
                                </li>
                            </ul><!-- Tab panes -->
                            <div class="tab-content" style="overflow: visible;">
                                <div class="tab-pane active" id="calendar-tabs-1" role="tabpanel"
                                     style="overflow: visible;">
                                    <div class="tab-desc" style="overflow: visible;">
                                        <div class="row" style="overflow: visible;">
                                            <div class="blog-item" style="overflow: visible;border-bottom: none;">
                                                <form name="addSchedule" action="/addSchedule"
                                                      class="agent-search-form mb-0">
                                                    <div class="item-box mt-2 mb-2">
                                                        <span class="item-title pt-1">제목</span>
                                                        <input type="text" name="scheduleSubject" class="text_type1">
                                                    </div>
                                                    <div class="item-box mb-2">
                                                        <span class="item-title mb-2 pt-2">지역</span>
                                                        <div class="item-desc">
                                                            <select class="sm-width" name="cityNO">
                                                                <c:forEach var="schedulePlace"
                                                                           items="${schedulePlaceList}"
                                                                           varStatus="status">
                                                                    <option value="${status.index+1}">${schedulePlace}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="item-box mb-2">
                                                        <span class="item-title pt-1">공개여부</span>
                                                        <label class="switch">
                                                            <input type="checkbox" name="scheduleStatus"
                                                                   id="scheduleStatus">
                                                            <span class="slider round"></span>
                                                        </label>
                                                    </div>
                                                    <div class="item-box mb-2">
                                                        <button type="button" class="site-btn"
                                                                onclick="addScheduleButton();">추가
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="calendar-tabs-2" role="tabpanel">
                                    <div class="tab-desc" style="overflow: visible;">
                                        <div class="row" style="overflow: visible;">
                                            <div class="blog-item" style="overflow: visible;border-bottom: none;">
                                                <c:forEach var="scheduleVO" items="${scheduleVOList}">
                                                    <c:if test="${scheduleVO.scheduleNO == selectedScheduleNO}">
                                                        <form name="modifySchedule" action="modifySchedule"
                                                              class="agent-search-form mb-0">
                                                            <div class="item-box mt-2 mb-2">
                                                                <span class="item-title pt-1">제목</span>
                                                                <input type="text" name="scheduleSubject"
                                                                       class="text_type1"
                                                                       value="${scheduleVO.scheduleSubject}"/>
                                                            </div>
                                                            <div class="item-box mb-2">
                                                                <span class="item-title mb-2 pt-2">지역</span>
                                                                <div class="item-desc">
                                                                    <select class="sm-width" name="cityNO"
                                                                            id="modifyPlace">
                                                                        <c:forEach var="schedulePlace"
                                                                                   items="${schedulePlaceList}"
                                                                                   varStatus="status">
                                                                            <option value="${status.index+1}">${schedulePlace}</option>
                                                                            <script> $("#modifyPlace").val("${scheduleVO.cityVO.cityNO}").prop("selected", true); </script>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="item-box mb-2">
                                                                <span class="item-title pt-1">공개여부</span>
                                                                <label class="switch">
                                                                    <input type="checkbox" name="scheduleStatus"
                                                                           <c:if test="${scheduleVO.scheduleStatus}">checked</c:if>>
                                                                    <span class="slider round"></span>
                                                                </label>
                                                                <script>
                                                                    if (${scheduleVO.scheduleStatus}) {
                                                                        $("input:checkbox[id='modifyScheduleStatus']").prop("checked", true);
                                                                    } else {
                                                                        $("input:checkbox[id='modifyScheduleStatus']").prop("checked", false);
                                                                    }
                                                                </script>
                                                            </div>
                                                            <div class="item-box mb-2">
                                                                <button type="button" class="site-btn"
                                                                        onclick="modifyScheduleButton();">수정
                                                                </button>
                                                                <button type="button" class="site-btn"
                                                                        onclick="deleteScheduleButton();">삭제
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--스케줄 관리--%>
                <div class="section-title mt-0">
                    <h4>스케줄 관리</h4>
                </div>
                <div class="pd-text">
                    <div class="pd-board mb-1">
                        <div class="tab-board">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="user-service">
                                    <a class="nav-link active" data-toggle="tab" href="#schedule-tabs-1" role="tab">금액
                                        확인하기</a>
                                </li>
                            </ul><!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="schedule-tabs-1" role="tabpanel">
                                    <div class="tab-desc">
                                        <div class="row">
                                            <div class="blog-item">
                                                <div class="search-form-content">
                                                    <form action="knowScheduleDurationPay" class="filter-form"
                                                          id="knowScheduleDurationPay">
                                                        <div class="item-box mt-2 mb-2">
                                                            <span class="item-title pt-1">시작일</span>
                                                            <input type="date" id="schedulePayStartDay"
                                                                   name="schedulePayStartDay">
                                                        </div>
                                                        <div class="item-box mb-2">
                                                            <span class="item-title mb-2 pt-1">종료일</span>
                                                            <input type="date" id="schedulePayFinishDay"
                                                                   name="schedulePayFinishDay">
                                                        </div>

                                                        <c:if test="${durationPayMsg != null}">
                                                            <div class="item-box mt-2 mb-2">
                                                                <span class="item-title mb-2 pt-1">비용</span>
                                                                <span class="item-title pt-1"
                                                                      style="width: auto;color: #01d28e">${durationPayMsg}</span>
                                                            </div>
                                                        </c:if>
                                                        <div class="item-box mb-2" id="scheduleDurationPay">
                                                            <button type="submit" class="site-btn">금액확인하기</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="ScheduleModal.jsp"/>
</body>
