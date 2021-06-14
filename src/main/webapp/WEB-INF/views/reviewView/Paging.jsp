<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<div id="paging" class="col-lg-12">
    <div class="property-pagination">
        <c:choose>
            <c:when test="${param.reviewPageType=='categoryReviewPage'}">
                <c:url var="action" value="categoryReviewPage?category=${param.category}&orderBy=${param.orderBy}&dateDescAsc=${param.dateDescAsc}&likeDescAsc=${param.likeDescAsc}&viewDescAsc=${param.viewDescAsc}&clickPage=clickPage"/>
            </c:when>
            <c:otherwise>
                <c:url var="action" value="searchReviewPage?search=${param.search}"/>
            </c:otherwise>
        </c:choose>

        <c:if test="${param.prev}">
            <a href="${action}&selectedPage=${param.beginPage-1}"><-</a>
        </c:if>
        <c:forEach begin="${param.beginPage}" end="${param.endPage}" step="1" var="index">
            <c:choose>
                <c:when test="${param.page==index}">
                    <a id="selectPage">${index}</a>
                </c:when>
                <c:otherwise>
                    <a href="${action}&selectedPage=${index}">${index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${param.next}">
            <a href="${action}&selectedPage=${param.endPage+1}">-></a>
        </c:if>
    </div>
</div>
</body>