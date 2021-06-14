<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<section class="contact-form-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="cf-content">
                    <div class="cc-title">
                        <h4>${title}</h4>
                        <p>${text}</p>
                    </div>
                    <c:choose>
                        <c:when test="${page == \"modify\"}">
                            <a class="site-btn" href="reCheckPassword?page=${page}">마이페이지로 돌아가기</a>
                        </c:when>
                        <c:when test="${page == \"oneToOneAsk\" || page == \"deleteOneToOneAsk\"}">
                            <a class="site-btn" href="oneToOneAsk">1:1문의 페이지로 돌아가기</a>
                        </c:when>
                        <c:otherwise>
                            <a class="site-btn" href="logout">메인으로 돌아가기</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</section>