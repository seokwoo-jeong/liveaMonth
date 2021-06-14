<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<body>
<link href="resources/css/otherSchedule.css" rel="stylesheet" type="text/css">
<section class="property-section latest-property-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-10 pr-0 mb-5">
                <div class="more-option">
                    <div class="accordion" id="accordionExample">
                        <div class="card" style="overflow: visible">
                            <div class="card-heading active">
                                <a data-toggle="collapse" data-target="#collapseOne">
                                    Filters & Order
                                </a>
                            </div>
                            <div id="collapseOne" class="collapse" data-parent="#accordionExample">
                                <form action="/otherScheduleList" class="filter-order-form mt-3 mb-5">
                                    <c:forEach items="${requestList}" var="requestData">
                                        <c:choose>
                                            <c:when test="${requestData.key eq 'userSex'}">
                                                <c:set var="userSex" value="${requestData.value}"/>
                                            </c:when>
                                            <c:when test="${requestData.key eq 'userAge'}">
                                                <c:set var="userAge" value="${requestData.value}"/>
                                            </c:when>
                                            <c:when test="${requestData.key eq 'cityNO'}">
                                                <c:set var="index" value="${requestData.value}"/>
                                            </c:when>
                                            <c:when test="${requestData.key eq 'orderBy'}">
                                                <c:set var="orderBy" value="${requestData.value}"/>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    <div class="container p-3 pl-5">
                                        <div class="row mb-3 mt-2">
                                            <div class="section-title pl-3">
                                                <span>ORDER</span>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="order-title pt-0 mr-2">
                                                    <input type="radio" name="orderBy" id="orderByLiked"
                                                           value="orderByLiked" <c:if test="${orderBy eq 'orderByLiked'}"> checked </c:if>>
                                                    <label for="orderByLiked">좋아요 순</label>
                                                    <input type="radio" name="orderBy" id="orderByView"
                                                           value="orderByView" <c:if test="${orderBy eq 'orderByView'}"> checked </c:if>>
                                                    <label for="orderByView">조회 순</label>
                                                    <input type="radio" name="orderBy" id="orderByNew"
                                                           value="orderByNew" <c:if test="${orderBy eq 'orderByNew'}"> checked </c:if>>
                                                    <label for="orderByNew">최신 순</label>
                                                    <c:if test="${empty orderBy}">
                                                        <script>  $("input:radio[name='orderBy']:radio[value='orderByNew']").prop("checked", true); </script>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="col-lg-2">
                                                <div class="order-title pt-0">
                                                    <button type="submit" name="order" class="bttn-material-flat bttn-md bttn-success">적용</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="section-title pl-3 mr-2">
                                                <span>FILTER</span>
                                            </div>
                                            <div class="col-sm-1 col-md-2">
                                                <div class="filter-title pt-0">
                                                    <h4>AGE</h4>
                                                    <div class="selectbox">
                                                        <select name="userAge" id="userAge" class="sm-width">

                                                            <option value="null" <c:if
                                                                    test="${userAge == -1}"> selected </c:if>>모두
                                                            </option>
                                                            <c:forEach var="age" begin="20" end="60" step="10">
                                                                <option value="${age}" <c:if
                                                                        test="${userAge == age}"> selected </c:if>
                                                                        style="text-align: center">
                                                                        ${age}대
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-1 col-md-2">
                                                <div class="filter-title pt-0">
                                                    <h4>GENDER</h4>
                                                    <div class="selectbox">
                                                        <select name="userSex" id="userSex" class="sm-width">
                                                            <option value="null" <c:if
                                                                    test="${userSex == -1}"> selected </c:if>>모두
                                                            </option>
                                                            <option value="0" <c:if
                                                                    test="${userSex == 0}"> selected </c:if>>남성
                                                            </option>
                                                            <option value="1" <c:if
                                                                    test="${userSex == 1}"> selected </c:if>>여성
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-1 col-md-2">
                                                <div class="filter-title pt-0">
                                                    <h4>PLACE</h4>
                                                    <div class="selectbox">
                                                        <select name="cityNO" id="cityNO" class="sm-width">
                                                            <option value="null" <c:if
                                                                    test="${index == -1}"> selected </c:if>>모두
                                                            </option>
                                                            <c:forEach var="schedulePlace" items="${schedulePlaceList}"
                                                                       varStatus="status">
                                                                <option value="${status.index}" <c:if
                                                                        test="${status.index == index}"> selected </c:if>>${schedulePlace}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="hidden" name="action" value="filter">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-10">
                <div class="section-title">
                    <h4>검색 결과</h4>
                </div>
                <div class="pc-table">
                    <table>
                        <thead>
                        <tr>
                            <th class="type">스케줄</th>
                            <th class="type">장소</th>
                            <th class="type">닉네임</th>
                            <th class="type">성별</th>
                            <th class="type">나이</th>
                            <th class="type">조회 수</th>
                            <th class="type">좋아요 수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${otherScheduleList != null}">
                            <c:forEach var="schedule" items="${otherScheduleList}" varStatus="status">
                                <tr>
                                    <td style="width: 30%">
                                        <a href="otherSchedule?userNO=${schedule.userVO.userNO}&scheduleNO=${schedule.scheduleNO}">
                                            <c:out value="${schedule.scheduleVO.scheduleSubject}"/>
                                            <c:set var="todayInformation"
                                                   value="${CalendarDTOTodayInformationList.get(status.index)}"
                                                   scope="request"/>
                                            <c:set var="dateList" value="${CalendarDTODateList.get(status.index)}"
                                                   scope="request"/>
                                            <c:set var="listIndex" value="${status.index+1}" scope="request"/>
                                            <jsp:include page="SmallSizeOfOtherSchedule.jsp">
                                                <jsp:param name="userAge" value="${userAge}"/>
                                                <jsp:param name="userSex" value="${userSex}"/>
                                                <jsp:param name="cityName" value="${cityName}"/>
                                                <jsp:param name="orderBy" value="${orderBy}"/>
                                            </jsp:include>
                                        </a>
                                    </td>
                                    <td>${schedule.cityVO.cityName}</td>
                                    <td>${schedule.userVO.userNickname}</td>
                                    <td>${schedule.userVO.getUserSexToString()}</td>
                                    <td>${schedule.userVO.getUserRealAge()}세</td>
                                    <td>${schedule.scheduleViewCount}</td>
                                    <td>${schedule.scheduleLikeCount}</td>
                                </tr>

                            </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                    <c:if test="${otherScheduleList.size() == 0}">
                        <div class="centered">
                            <h5>해당 하는 결과가 존재하지 않습니다.</h5>
                        </div>
                    </c:if>
                </div>
                <c:choose>
                    <c:when test="${userSex == -1}&&${userAge == -1}&&${cityName == -1}">
                        <c:set var="action" value="list"></c:set>
                    </c:when>
                    <c:otherwise>
                        <c:set var="action" value="filter"></c:set>
                    </c:otherwise>
                </c:choose>
                <jsp:include page="PagingForOtherScheduleList.jsp">
                    <jsp:param value="${action}" name="action"/>
                    <jsp:param value="${paging.page}" name="page"/>
                    <jsp:param value="${paging.beginPage}" name="beginPage"/>
                    <jsp:param value="${paging.endPage}" name="endPage"/>
                    <jsp:param value="${paging.prev}" name="prev"/>
                    <jsp:param value="${paging.next}" name="next"/>
                </jsp:include>
            </div  style="overflow: visible" >
        </div>
    </div>
</section>
</body>