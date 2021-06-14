<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<div class="section-title">
    <h4>1:1 문의내역</h4>
</div>
<c:choose>
    <c:when test="${oneToOneAskVOList.size() == 0}">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">문의한 글이 존재하지 않습니다.</h2>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="pc-table">
            <table>
                <thead>
                <tr>
                    <th>번호</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>날짜</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="oneToOneAskVOList" items="${oneToOneAskVOList}">
                    <tr>
                        <td>${oneToOneAskVOList.oneToOneAskNO}</td>
                        <td>${oneToOneAskVOList.oneToOneAskCategory}</td>
                        <td>
                            <a href="showOneToOneAsk?oneToOneAskNO=${oneToOneAskVOList.oneToOneAskNO}">${oneToOneAskVOList.oneToOneAskSubject}</a>
                        </td>
                        <td>${oneToOneAskVOList.oneToOneAskDate}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:otherwise>
</c:choose>
<a class="site-btn" href="writeOneToOneAsk">문의 하기</a>
</body>