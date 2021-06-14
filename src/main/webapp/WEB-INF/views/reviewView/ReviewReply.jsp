<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<div class="mar-btm">
    <a href="#" class="btn-link text-semibold media-heading box-inline"> ${param.userNickname} </a>
    <c:if test="${userVO.userNO == param.userNO}">
        <button id="deleteReply" class="btn btn-sm btn-default btn-hover-primary" style="float: right;" onclick="deleteReviewReplyButton(${param.reviewReplyNO});"> 삭제
        </button>
        <button id="modifyReply" class="btn btn-sm btn-default btn-hover-primary" style="float: right;" onclick="showModifyReplyDesc(${param.reviewReplyNO});"> 수정
        </button>
    </c:if>
    <p class="text-muted text-sm"><i class="far fa-clock"></i> ${param.reviewReplyDate} </p>
</div>

<p id="ReplyDesc${param.reviewReplyNO}" class="ReplyDesc"> ${param.reviewReplyDesc} </p>

<div id="modifyReplyDesc${param.reviewReplyNO}" class="modifyReplyDesc">
    <form id="modifyReviewReply${param.reviewReplyNO}" action="modifyReviewReply">
        <input type="hidden" name="reviewNO" id="modifyReviewNONO" value="${param.reviewNO}"/>
        <input type="hidden" name="reviewReplyNO" id="modifyReviewReplyNO" value="${param.reviewReplyNO}"/>
        <textarea name="reviewReplyDesc" id="modifyReviewReplyDescText" class="form-control" rows="2" placeholder="의견을 남겨주세요.">${param.reviewReplyDesc}</textarea>
        <div class="mar-top clearfix">
            <button type="button" class="btn btn-sm btn-primary pull-right" onclick="showModifyReplyDesc(${param.reviewReplyNO})"><i class="fa fa-pencil fa-fw"></i>취소</button>
            <button type="button" class="btn btn-sm btn-primary pull-right" style="margin-right: 8px;" onclick="modifyReviewReply(${param.reviewReplyNO})"><i class="fa fa-pencil fa-fw"></i> 수정</button>
        </div>
    </form>
</div>

<c:if test="${param.reviewReplyRefNO == null}">
    <div class="pad-ver">
        <button id="replyButton" class="btn btn-sm btn-default btn-hover-primary" onclick="showReplyDiv(${param.reviewReplyNO});">Comment &nbsp; <i class="far fa-comment-alt" style="font-size: 0.8em;"></i>
        </button>
    </div>
    <hr>
    <div id="replyDiv${param.reviewReplyNO}" class="panel replyDiv">
        <jsp:include page="ReviewReplyDesc.jsp">
            <jsp:param value="${param.reviewNO}" name="reviewNO"/>
            <jsp:param value="${param.reviewReplyNO}" name="reviewReplyNO"/>
        </jsp:include>
    </div>
</c:if>
</body>