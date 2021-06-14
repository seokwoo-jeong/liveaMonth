<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="resources/css/myPage.css" type="text/css">
<section class="profile-section spad">
    <div class="container">
        <div class="profile-agent-content">
            <div class="row">
                <div class="col-lg-2">
                    <c:choose>
                        <c:when test="${userVO.userImage == null}">
                            <div class="ih-item circle effect13 top_to_bottom"><a data-toggle="modal" href="#modifyScheduleContentModal">
                                <div class="img"><img src="https://liveamonth-resources.s3.ap-northeast-2.amazonaws.com/img/user/default.jpg"
                                                      alt="img">
                                </div>
                                <div class="info">
                                    <div class="info-back">
                                        <h3>${userVO.userNickname}</h3>
                                        <p>프로필 이미지 변경</p>
                                    </div>
                                </div>
                            </a></div>
                        </c:when>
                        <c:otherwise>
                            <div class="ih-item circle effect13 top_to_bottom"><a data-toggle="modal" href="#modifyScheduleContentModal">
                                <div class="img"><img src="${userVO.getUserImageURL()}" alt="img"></div>
                                <div class="info">
                                    <div class="info-back">
                                        <h3>${userVO.userNickname}</h3>
                                        <p>프로필 이미지 변경</p>
                                    </div>
                                </div>
                            </a></div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="col-lg-3">
                    <div class="profile-agent-widget">
                        <ul>
                            <li>이름 <span>${userVO.userName}</span></li>
                            <li>닉네임 <span>${userVO.userNickname}</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="profile-agent-widget">
                        <ul>
                            <li>나이 <span>${userVO.getUserRealAge()}세</span></li>
                            <li>성별 <span>${userVO.getUserSexToString()}</span></li>
                            <li>Email <span>${userVO.userEmail}</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="ModifyUserImgModal.jsp"/>
