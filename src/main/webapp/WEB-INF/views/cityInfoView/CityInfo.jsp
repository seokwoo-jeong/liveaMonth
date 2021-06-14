<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<section class="property-details-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="pd-text">
                    <div class="row">
<%--City 제목 및 도시 이름 리스트--%>
                        <div class="col-lg-6">
                            <div class="pd-title">
                                <h3>'한달살기' 추천 도시</h3>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="pd-social">
                                <a href="cityInfo?cityName=all">전체</a>
                                <c:forEach var="cityIntro" items="${cityIntroList}">
                                    <a href="cityInfo?cityName=${cityIntro.cityVO.cityName}">${cityIntro.cityVO.cityName}</a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
<%--선택 도시가 ALL인 경우 CityGrid 출력!!--%>
<c:if test="${cityName == 'all'}">
                    <div class="row property-filter">
                        <c:forEach var="cityIntro" items="${cityIntroList}"
                        varStatus="status">
                            <div class="col-lg-4 col-md-6">
                                <div class="ih-item square effect13 left_to_right property-item">
                                    <a href="cityInfo?cityName=${cityIntro.cityVO.cityName}">
                                        <div class="pi-pic set-bg" data-setbg="${cityIntro.getCityInfoImageURL()}">
                                            <div class="label">${cityIntro.cityVO.cityName}</div>
                                        </div>
                                        <div class="info">
                                            <h3>${cityIntro.cityVO.cityName}</h3>
                                            <p>
                                                ${currentMonthTempList[status.index].cityWeatherMonth}월 평균기온 : ${currentMonthTempList[status.index].cityWeatherAVGTemp}&#8451;
                                                <br><br>교통 등급 : ${cityTransportGradeList.get(cityIntro.cityVO.cityName)}
                                            </p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</c:if>
<%--선택한 도시가 있는 경우--%>
<c:if test="${cityName != 'all'}">
<%--INTRO 부분 Tab으로 출력!!!--%>
                    <div class="pd-board">
                        <div class="tab-board">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">도시 소개</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">교통 정보</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">전년도 기온 정보</a>
                                </li>
                            </ul><!-- Tab panes -->
                            <div class="tab-content">
                                <%--도시 소개--%>
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <div class="tab-desc">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-6 mix">
                                                <div class="cityImg set-bg" data-setbg="${selectedCityInfos.cityIntro[0].getCityInfoImageURL()}">
                                                    <div class="label">${selectedCityInfos.cityIntro[0].cityVO.cityName}</div>
                                                </div>
                                            </div>
                                            <div class="col-lg-8">
                                                <p class="cityText">${selectedCityInfos.cityIntro[0].cityInfoDesc}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--교통 정보--%>
                                <div class="tab-pane" id="tabs-2" role="tabpanel">
                                        <div class="tab-details">
                                            <ul class="left-table">
                                                <li>
                                                    <span class="type-title">정류장 및 노선 개수 :: ${selectedCityInfos.cityIntro[0].cityVO.cityName}</span>
                                                </li>
                                                <c:set var="cityTransport" value="${selectedCityInfos.cityTransportList}"/>
                                                <c:forEach var="i" begin="0" end="2">
                                                    <li>
                                                        <span class="type-name">${cityTransport[i].cityTransportCategory}</span>
                                                        <span class="type-value">${cityTransport[i].cityStationCount}</span>
                                                    </li>
                                                </c:forEach>
                                                <li><span class="type-footer"> &nbsp;</span></li>
                                            </ul>
                                            <ul class="right-table">
                                                <li><span class="type-title"> &nbsp;</span></li>
                                                <c:forEach var="i" begin="3" end="5">
                                                    <li>
                                                        <span class="type-name">${cityTransport[i].cityTransportCategory}</span>
                                                        <span class="type-value">${cityTransport[i].cityStationCount}</span>
                                                    </li>
                                                </c:forEach>
                                                <li class="type-footer">출처 : 교통정보
                                            </ul>
                                        </div>
                                </div>
                                <%--전년도 기온 정보--%>
                                <div class="tab-pane" id="tabs-3" role="tabpanel">
                                    <div class="tab-details">
                                        <ul class="left-table">
                                            <li>
                                                <span class="type-title">전년도 월 평균 기온 :: ${selectedCityInfos.cityIntro[0].cityVO.cityName}</span>
                                            </li>
                                            <c:set var="cityWeather" value="${selectedCityInfos.cityWeatherList}"/>
                                            <c:forEach var="i" begin="0" end="5">
                                            <li>
                                                <span class="type-name">${cityWeather[i].cityWeatherMonth}월</span>
                                                <span class="type-value">평균 : ${cityWeather[i].cityWeatherAVGTemp}&#8451; | 최저 : ${cityWeather[i].cityWeatherMinTemp}&#8451; | 최고 : ${cityWeather[i].cityWeatherMaxTemp}&#8451;</span>
                                            </li>
                                            </c:forEach>
                                            <li><span class="type-footer"> &nbsp;</span></li>
                                        </ul>
                                        <ul class="right-table">
                                            <li><span class="type-title"> &nbsp;</span></li>
                                            <c:forEach var="i" begin="6" end="11">
                                                <li>
                                                    <span class="type-name">${cityWeather[i].cityWeatherMonth}월</span>
                                                    <span class="type-value">평균 : ${cityWeather[i].cityWeatherAVGTemp}&#8451; | 최저 : ${cityWeather[i].cityWeatherMinTemp}&#8451; | 최고 : ${cityWeather[i].cityWeatherMaxTemp}&#8451;</span>
                                                </li>
                                            </c:forEach>
                                            <li class="type-footer">출처 : 기상청 홈페이지
                                            </li>
                                        </ul>
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
<%--Food 및 View 부분 Slide로 출력!!!--%>
<section class="agent-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-9">
                <div class="section-title">
                    <h4>VIEW & FOOD</h4>
                </div>
            </div>
        </div>
        <div class="as-slider owl-carousel">
            <div class="row">
                <c:forEach var="cityView" items="${selectedCityInfos.cityViewList}">
                    <div class="col-lg-4 col-md-6">
                        <div class="as-item">
                            <div class="as-pic set-bg" data-setbg="${cityView.getCityInfoImageURL()}">
                                <div class="label">${cityView.cityInfoDesc}</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="cityFood" items="${selectedCityInfos.cityFoodList}">
                    <div class="col-lg-4 col-md-6">
                        <div class="as-item">
                            <div class="as-pic set-bg" data-setbg="${cityFood.getCityInfoImageURL()}">
                                <div class="label">${cityFood.cityInfoDesc}</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
</c:if>
