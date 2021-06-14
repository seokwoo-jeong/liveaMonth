<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<div class="mar-btm">
    <a href="#" class="btn-link text-semibold media-heading box-inline"> ${param.userNickname} </a>
    <c:if test="${userVO.userNO == param.userNO}">
        <button id="deleteReply" class="btn btn-sm btn-default btn-hover-primary" style="float: right;"
                onclick="deleteScheduleReplyButton(${param.scheduleReplyNO});"> 삭제
        </button>
        <button id="modifyReply" class="btn btn-sm btn-default btn-hover-primary" style="float: right;"
                onclick="showModifyReplyDesc(${param.scheduleReplyNO});"> 수정
        </button>
    </c:if>
    <p class="text-muted text-sm"><i class="far fa-clock"></i> ${param.scheduleReplyDate} </p>
</div>

<p id="ReplyDesc${param.scheduleReplyNO}" class="ReplyDesc">
    ${param.scheduleReplyDesc}
</p>

<div id="modifyReplyDesc${param.scheduleReplyNO}" class="modifyReplyDesc">
    <form id="modifyScheduleReply${param.scheduleReplyNO}" action="modifyScheduleReply">
        <input type="hidden" name="scheduleReplyNO" id="modifyScheduleReplyNO" value="${param.scheduleReplyNO}"/>
        <input type="hidden" name="scheduleNO" id="modifyScheduleNO" value="${param.scheduleNO}"/>
        <textarea name="scheduleReplyDesc" id="modifyScheduleReplyDescText" class="form-control" rows="2"
                  placeholder="의견을 남겨주세요.">${param.scheduleReplyDesc}</textarea>
        <div class="mar-top clearfix">
            <button type="button" class="btn btn-sm btn-primary pull-right"
                    onclick="showModifyScheduleReplyDesc(${param.scheduleReplyNO})"><i class="fa fa-pencil fa-fw"></i>
                취소
            </button>
            <button type="button" class="btn btn-sm btn-primary pull-right" style="margin-right: 8px;"
                    onclick="modifyScheduleReply(${param.scheduleReplyNO})"><i class="fa fa-pencil fa-fw"></i> 수정
            </button>
        </div>
    </form>
</div>

<c:if test="${param.checkScheduleReplyRefNO == null}">
    <div class="pad-ver">
        <button id="replyButton" class="btn btn-sm btn-default btn-hover-primary"
                onclick="showReplyDiv(${param.scheduleReplyNO});">Comment &nbsp; <i class="far fa-comment-alt"
                                                                                    style="font-size: 0.8em;"></i>
        </button>
    </div>
    <hr>
    <div id="replyDiv${param.scheduleReplyNO}" class="panel replyDiv">
        <jsp:include page="ScheduleReplyDesc.jsp">
            <jsp:param value="${param.scheduleNO}" name="scheduleNO"/>
            <jsp:param value="${param.scheduleReplyNO}" name="scheduleReplyNO"/>
        </jsp:include>
    </div>
</c:if>
</body>