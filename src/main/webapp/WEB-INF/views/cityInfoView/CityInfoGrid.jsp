<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <div class="container">
        <div class="row">
            <div class="col-lg-5">
                <div class="section-title">
                    <h4>도시 정보</h4>
                </div>
            </div>
        </div>
        <div class="row property-filter">
            <c:forEach var="cityIntro" items="${cityIntroList}" varStatus="status">
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
