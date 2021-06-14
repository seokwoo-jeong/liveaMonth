<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="modal fade" id="addScheduleContentModal" role="dialog" aria-labelledby="addScheduleContentLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addScheduleContentLabel">스케줄 등록</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="info">&#8251;하루에 최대 4개의 스케줄만 등록할 수 있습니다.</div>
                <form name="addScheduleContent" action="addScheduleContent">
                    <input type="hidden" name="year" value="${todayInformation.searchYear}"/>
                    <input type="hidden" name="month" value="${todayInformation.searchMonth-1}"/>
                    <%--제목--%>
                    <div class="form-group mb-4 mt-2">
                        <label class="label mb-0"><h5>제목</h5></label>
                        <input type="text" id="scheduleContentSubject" name="scheduleContentSubject"
                               class="form-control mb-1"/>
                    </div>

                    <%--날짜 --%>
                    <div class="form-group mb-1">
                        <label class="label mb-0"><h5>날짜</h5></label>
                        <input type="date" id="scheduleContentDate" name="scheduleContentDate"
                               class="form-control mb-1"
                               id="testDatepicker"/>
                    </div>

                    <%-- 내용 --%>
                    <div class="form-group">
                        <label class="label mb-0"><h5>내용</h5></label>
                        <div class="text_area_desc">
                            <textarea name="scheduleContentDesc" id="scheduleContentDesc" class="form-control mb-1"
                                      rows="6"></textarea>
                        </div>
                    </div>

                    <%-- 금액 --%>
                    <div class="form-group mb-5">
                        <label class="label mb-0" style="display: block"><h5>금액</h5></label>
                        <input type="number" id="scheduleContentCost" name="scheduleContentCost"
                               class="form-control mb-2" style="width: 90%;float: left"/>
                        <h5 class="pt-2 pr-2" style="float: right;">원</h5>
                    </div>

                    <div>
                        <button type="button" class="form-control btn btn-primary rounded submit px-3 mb-2"
                                onclick="addScheduleContentButton();">
                            일정등록
                        </button>
                        <button type="button" class="form-control btn btn-primary rounded submit px-3"
                                data-dismiss="modal">취소
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="showScheduleContentModal" role="dialog"
     aria-labelledby="showScheduleLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="showScheduleLabel">스케줄</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="info"></div>
                <form name="deleteScheduleContent" action="deleteScheduleContent">
                    <input type="hidden" name="year" value="${todayInformation.searchYear}"/>
                    <input type="hidden" name="month" value="${todayInformation.searchMonth-1}"/>
                    <div class="form-group mb-4 mt-2">
                        <label class="label mb-0"><h5>제목</h5></label>
                        <label id="scheduleContentSubjectMessage" class="form-control mb-1" readonly></label>
                    </div>
                    <%--날짜 --%>
                    <div class="form-group mb-1">
                        <label class="label mb-0"><h5>내용</h5></label>
                        <textarea id="scheduleContentDescMessage"
                                  class="form-control mb-1"
                                  rows="6" readonly></textarea>
                    </div>
                    <div class="form-group mb-1">
                        <label class="label mb-0"><h5>금액</h5></label>
                        <label id="scheduleContentCostMessage" class="form-control mb-1" readonly></label>
                    </div>

                    <div>
                        <button type="button" class="form-control btn btn-primary rounded submit px-3  mb-2"
                                data-toggle="modal"
                                data-target="#modifyScheduleContentModal" data-dismiss="modal">수정하기
                        </button>
                        <button type="button" class="form-control btn btn-primary rounded submit px-3"
                                onclick="deleteScheduleContentButton();">
                            일정 삭제
                        </button>
                    </div>
            </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="modifyScheduleContentModal" role="dialog"
     aria-labelledby="modifyScheduleContentLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modifyScheduleContentLabel">스케줄 수정</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form name="modifyScheduleContent" action="modifyScheduleContent">
                    <input type="hidden" name="year" value="${todayInformation.searchYear}"/>
                    <input type="hidden" name="month" value="${todayInformation.searchMonth-1}"/>
                    <%--제목--%>
                    <div class="form-group mb-4 mt-2">
                        <label class="label mb-0"><h5>제목</h5></label>
                        <input type="text" id="modifyScheduleContentSubject" name="modifyScheduleContentSubject"
                               class="form-control mb-1"/>
                    </div>

                    <%--날짜 --%>
                    <div class="form-group mb-1">
                        <label class="label mb-0"><h5>날짜</h5></label>
                        <input type="date" id="modifyScheduleContentDate" name="modifyScheduleContentDate"
                               class="form-control mb-1"
                               readonly/>
                    </div>

                    <%-- 내용 --%>
                    <div class="form-group">
                        <label class="label mb-0"><h5>내용</h5></label>
                        <div class="text_area_desc">
                            <textarea name="modifyScheduleContentDesc" id="modifyScheduleContentDesc"
                                      class="form-control mb-1"
                                      rows="6"></textarea>
                        </div>
                    </div>

                    <%-- 금액 --%>
                    <div class="form-group mb-5">
                        <label class="label mb-0" style="display: block"><h5>금액</h5></label>
                        <input type="number" id="modifyScheduleContentCost" name="modifyScheduleContentCost"
                               class="form-control mb-2" style="width: 90%;float: left"/><h5 class="pt-2 pr-2"
                                                                                             style="float: right;">
                        원</h5>
                    </div>

                    <div>
                        <button type="button" class="form-control btn btn-primary rounded submit px-3 mb-2"
                                onclick="modifyScheduleContentButton();">
                            일정 수정
                        </button>
                        <button type="button" class="form-control btn btn-primary rounded submit px-3"
                                data-dismiss="modal">취소
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>