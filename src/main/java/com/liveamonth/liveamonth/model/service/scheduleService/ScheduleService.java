package com.liveamonth.liveamonth.model.service.scheduleService;

import com.liveamonth.liveamonth.entity.dto.CalendarDTO;
import com.liveamonth.liveamonth.entity.dto.PagingDTO;
import com.liveamonth.liveamonth.entity.vo.ScheduleContentVO;
import com.liveamonth.liveamonth.entity.vo.ScheduleLikeVO;
import com.liveamonth.liveamonth.entity.vo.ScheduleReplyVO;
import com.liveamonth.liveamonth.entity.vo.ScheduleVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public interface ScheduleService {
    // Schedule - select
    List<HashMap<String, Object>> getPopularScheduleListForMain() throws Exception;
    ArrayList<ScheduleVO> getScheduleList(int userNO) throws Exception;
    List<HashMap<String, Object>> getOtherScheduleList(HashMap<String, Object> filtersAndOrder, int selectPage) throws Exception;
    int getScheduleLikeStatus(ScheduleLikeVO scheduleLikeVO) throws Exception;
    HashMap<String, String> getScheduleAndLikeCount(int scheduleNO) throws Exception;
    ArrayList<HashMap<String, Object>> getMyScheduleList(int selectPage, int userNO, String manageScheduleCategory)throws Exception;

    // Schedule - insert, update, delete
    boolean addSchedule(HashMap<String, Object> scheduleVO) throws Exception;
    boolean modifySchedule(HashMap<String, Object> scheduleVO) throws Exception;
    boolean deleteSchedule(int scheduleNO) throws Exception;
    void increaseScheduleViewCount(int scheduleNO);
    void deleteScheduleList(int[] scheduleNO_or_scheduleReplyNOList, String manageScheduleCategory)throws Exception;

    // Schedule Content
    int beforeScheduleAddSearch(ScheduleContentVO scheduleContentVO) throws Exception;
    int getScheduleDurationPay(String schedulePayStartDay, String schedulePayFinishDay, int scheduleNO) throws Exception;
    void addScheduleContent(ScheduleContentVO scheduleContentVO) throws Exception;
    void deleteScheduleContent(int scheduleContentNO) throws Exception;
    void modifyScheduleContent(int scheduleContentNO, String scheduleContentSubject, String scheduleContentDesc, int scheduleContentCost) throws Exception;

    // Schedule Reply
    ArrayList<HashMap<String, Object>> getScheduleReplyList(int scheduleNO, int page) throws Exception;
    boolean addScheduleReplyVO(ScheduleReplyVO scheduleReplyVO, int userNO) throws Exception;
    boolean deleteScheduleReply(int scheduleReplyNO) throws Exception;
    boolean modifyScheduleReply(ScheduleReplyVO scheduleReplyVO) throws Exception;

    // user getOtherScheduleCount()
    PagingDTO showOtherScheduleListPaging(HashMap<String, Object> filtersAndOrder, int selectPage) throws Exception;
    // use scheduleContentList()
    CalendarDTO showCalendar(CalendarDTO calendarDTO, int scheduleNO) throws Exception;
    /*
     * use getScheduleLikeStatus(), getScheduleWriterNO(), addScheduleLike(), deleteScheduleLike(), getReviewLikeCount()
     * Autowired : NoticeService - addNotice(), addSLNotice(),
     */
    HashMap<String, Integer> getScheduleLikeAndCount(ScheduleLikeVO scheduleLikeVO) throws Exception;
    // use getScheduleReplyCount()
    PagingDTO showPaging(int selectPage, int scheduleNO) throws Exception;
    // use getMyScheduleListCount()
    PagingDTO showMySchedulePaging(int selectPage, String manageScheduleCategory, int userNO)throws Exception;
    // use getOtherScheduleList()
    List<HashMap<String, Object>> getMainOtherScheduleList(int selectPage) throws Exception;
    // use getManyContentsYear(), getManyContentsMonth()
    CalendarDTO setManyContentsDate(int scheduleNO,CalendarDTO calendarDTO);
    // inner Method
    HashMap<String, Object> setCalendarDTOForScheduleList(List<HashMap<String, Object>> otherScheduleList,CalendarDTO calendarDTO) throws Exception;
    CalendarDTO otherCalendar(CalendarDTO calendarDTO, int scheduleNO) throws Exception;
}
