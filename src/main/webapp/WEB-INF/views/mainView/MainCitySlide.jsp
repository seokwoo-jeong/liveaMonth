<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<section class="hero-section">
    <div class="container">
        <div class="hs-slider owl-carousel">
            <c:forEach var="cityIntro" items="${randomCityIntroList}">
                <div class="hs-item set-bg"
                     data-setbg="${cityIntro.getCityInfoImageURL()}">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="hc-inner-text">
                                <div class="hc-text">
                                    <h4>${cityIntro.cityVO.cityName}</h4>
                                    <p><span class="icon_pin_alt"></span> 대한민국, ${cityIntro.cityVO.cityName}</p>
                                </div>
                                <div class="hc-widget">
                                    <ul>
                                        <li><i class="fa fa-bed"></i> 05</li>
                                        <li><i class="fa fa-automobile"></i> 01</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>