<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<form id="addReviewReply${param.reviewReplyNO}" action="addReviewReply">
    <div class="panel-body">
        <textarea name="reviewReplyDesc" id="reviewReplyDesc" class="form-control" rows="4" placeholder="의견을 남겨주세요."></textarea>
        <input type="hidden" name="reviewReplyRefNO" id="reviewReplyRefNO" value="${param.reviewReplyNO}"/>
        <input type="hidden" name="reviewNO" id="reviewNO" value="${param.reviewNO}"/>
        <div class="mar-top clearfix">
            <button type="button" class="btn btn-sm btn-primary pull-right" onclick="addReviewReply(${param.reviewReplyNO});"><i class="fa fa-pencil fa-fw"></i> 등록</button>
        </div>
    </div>
</form>
</body>