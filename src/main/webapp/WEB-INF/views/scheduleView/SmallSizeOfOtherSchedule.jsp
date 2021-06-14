<%@ page import="com.liveamonth.liveamonth.constants.LogicConstants" %>
<%@ page import="com.liveamonth.liveamonth.constants.EntityConstants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link href="resources/css/smallSchedule.css" rel="stylesheet" type="text/css">
<div class="royal-navy p-3">
    <table class="calendar_body p-2">
        <tbody>
        <tr>
            <th class="p-0" colspan="7">
                ${monthList[todayInformation.searchMonth-1]}
            </th>
        </tr>
        <tr class="calendar-header p-0">
            <td class="calendar-header-day p-0">Sun</td>
            <td class="calendar-header-day p-0">Mon</td>
            <td class="calendar-header-day p-0">Tue</td>
            <td class="calendar-header-day p-0">Wed</td>
            <td class="calendar-header-day p-0">Thu</td>
            <td class="calendar-header-day p-0">Fri</td>
            <td class="calendar-header-day p-0">Sat</td>
        </tr>
        <c:forEach var="dateList" items="${dateList}" varStatus="dateStatus">
        <c:choose>
        <c:when test="${dateList.value=='today'}">
        <c:if test="${dateStatus.index%7==0}">
        <tr>
            </c:if>
            <td id="${listIndex}_${dateList.date}" class="today p-0">
                </c:when>
                <c:when test="${dateStatus.index%7==0}">
        </tr>
        <tr>
            <td id="${listIndex}_${dateList.date}" class="sun_day p-0">
                </c:when>
                <c:when test="${dateStatus.index%7==6}">
            <td id="${listIndex}_${dateList.date}" class="sat_day p-0">
                </c:when>
                <c:otherwise>
            <td id="${listIndex}_${dateList.date}" class="normal_day p-0">
                </c:otherwise>
                </c:choose>
                <span class="contents pl-1">${dateList.date}</span>
                <div class="scheduleContentsModal" id="${listIndex}_${dateList.date}_modal">
                    <div class="form-group mb-0">
                        <label class="scheduleContentLabel m-0 pl-3">Contents Title</label>
                        <c:forEach var="scheduleList" items="${dateList.scheduleDataArray}" varStatus="status">
                            <c:if test="${scheduleList.scheduleContentNO != null}">
                                <label id="scheduleContentSubject" class="contents-label mt-1"
                                       readonly>#${status.index+1}. ${scheduleList.scheduleContentSubject}</label>
                                <c:set value="true" var="scheduleStatus"/>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <c:if test="${scheduleStatus == true}">
                <script>
                    $('.contents').parent('td#${listIndex}_${dateList.date}').css('background-color', '#00C89E');
                    $('.contents').parent('td#${listIndex}_${dateList.date}').css('font-weight', 'bold');
                    $('.contents').parent('td#${listIndex}_${dateList.date}').css('color', '#e1edea');
                    $('.contents').parent('td#${listIndex}_${dateList.date}').attr("name", 'Contents');
                    $('td#${listIndex}_${dateList.date}').hover(function (e) {
                        $('td#${listIndex}_${dateList.date}').css('color', '#00C89E');
                        $('td#${listIndex}_${dateList.date}').css('background-color', '#e1edea');
                        $("#${listIndex}_${dateList.date}_modal").css('left', e.offsetX + 20);
                        $("#${listIndex}_${dateList.date}_modal").css('top', e.offsetY + 5);
                        $("#${listIndex}_${dateList.date}_modal").css('display', 'block');
                    }, function (e) {
                        $('td#${listIndex}_${dateList.date}').css('color', '#e1edea');
                        $('td#${listIndex}_${dateList.date}').css('background-color', '#00C89E');
                        $("#${listIndex}_${dateList.date}_modal").css('display', 'none');
                    });
                </script>
                    <c:set value="false" var="scheduleStatus"/>
                </c:if>
                </c:forEach>
        </tbody>
    </table>
</div>

