<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>
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
		<c:forEach var="oneToOneAskVO" items="${oneToOneAskVOList}">
				<tr>
					<td>${oneToOneAskVO.oneToOneAskNO}</td>
					<td>${oneToOneAskVO.oneToOneAskCategory}</td>
					<td><a href="writeOneToOneAskReply?oneToOneAskNO=${oneToOneAskVO.oneToOneAskNO}">${oneToOneAskVO.oneToOneAskSubject}</a></td>
					<td>${oneToOneAskVO.oneToOneAskDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>