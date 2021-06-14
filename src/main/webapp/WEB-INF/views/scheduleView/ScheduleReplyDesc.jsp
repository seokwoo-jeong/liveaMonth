<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<form id="addScheduleReply${param.scheduleReplyNO}" action="addScheduleReply">
    <div class="panel-body">
        <textarea name="scheduleReplyDesc" id="scheduleReplyDesc" class="form-control" rows="4" placeholder="의견을 남겨주세요."></textarea>
        <input type="hidden" name="scheduleReplyRefNO" id="scheduleReplyRefNO" value="${param.scheduleReplyNO}"/>
        <input type="hidden" name="scheduleNO" id="scheduleNO" value="${param.scheduleNO}"/>
        <div class="mar-top clearfix">
            <button type="button" class="btn btn-sm btn-primary pull-right"
                    onclick="addScheduleReply(${param.scheduleReplyNO});"><i class="fa fa-pencil fa-fw"></i> 등록
            </button>
        </div>
    </div>
</form>
</body>