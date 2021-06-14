package com.liveamonth.liveamonth.model.mapper.scheduleMapper;

import com.liveamonth.liveamonth.entity.vo.ScheduleContentVO;
import com.liveamonth.liveamonth.entity.vo.ScheduleLikeVO;
import com.liveamonth.liveamonth.entity.vo.ScheduleReplyVO;
import com.liveamonth.liveamonth.entity.vo.ScheduleVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository
@Mapper
public interface ScheduleMapper {
    // Schedule - select
    List<HashMap<String, Object>> getPopularScheduleListForMain() throws Exception;
    ArrayList<ScheduleVO> getScheduleList(int userNO)throws Exception;
    ArrayList<HashMap<String, Object>> getOtherScheduleList(HashMap<String, Object> filtersAndOrder) throws Exception;
    int getScheduleLikeStatus(ScheduleLikeVO scheduleLikeVO) throws Exception;
    HashMap<String, String> getScheduleAndLikeCount(int scheduleNO) throws Exception;
    ArrayList<HashMap<String, Object>> getMyScheduleList(HashMap<String, Object> myScheduleAndPage)throws Exception;

    // Schedule - insert, update, delete
    boolean addSchedule(HashMap<String, Object> scheduleVO) throws Exception;
    boolean modifySchedule(HashMap<String, Object> scheduleVO) throws Exception;
    boolean deleteSchedule(int scheduleNO) throws Exception;
    void increaseScheduleViewCount(int scheduleNO);
    void deleteScheduleList(HashMap<String, Object> listAndCategory)throws Exception;

    // Schedule Content
    int beforeScheduleAddSearch(ScheduleContentVO scheduleContentVO)  throws Exception;
    int getScheduleDurationPay(HashMap<String, Object> hash) throws Exception;
    void addScheduleContent(ScheduleContentVO scheduleContentVO) throws Exception;
    void deleteScheduleContent(int scheduleContentNO)  throws Exception;
    void modifyScheduleContent(ScheduleContentVO scheduleContentVO)  throws Exception;

    // Schedule Reply
    ArrayList<HashMap<String, Object>> getScheduleReplyList(HashMap<String, Integer> scheduleNOAndPage) throws Exception;
    int addScheduleReplyVO(ScheduleReplyVO scheduleReplyVO) throws Exception;
    boolean deleteScheduleReply(int scheduleReplyNO) throws Exception;
    boolean modifyScheduleReply(ScheduleReplyVO scheduleReplyVO) throws Exception;

    // Be used in ScheduleService
    Object getLastScheduleContentNO() throws Exception;
    ArrayList<ScheduleContentVO> scheduleContentList(HashMap<String, Object> scheduleCalendarDTO) throws Exception;
    String getManyContentsYear(int scheduleNO);
    String getManyContentsMonth(int scheduleNO);
    int getScheduleReplyCount(int scheduleNO) throws Exception;
    int getOtherScheduleCount(HashMap<String, Object> filtersAndOrder) throws Exception;
    boolean deleteScheduleLike(ScheduleLikeVO scheduleLikeVO)throws Exception;
    int getScheduleLikeCount(int scheduleNO)throws Exception;
    boolean addScheduleLike(ScheduleLikeVO scheduleLikeVO)throws Exception;
    int getScheduleWriterNO(int scheduleNO) throws Exception;
    int getMyScheduleListCount(HashMap<String, Object> myScheduleAndPage) throws Exception;

    // Be used in NoticeService
    ScheduleVO getScheduleVO(int scheduleNO) throws Exception;
    ScheduleReplyVO getScheduleReply(int scheduleReplyNO) throws Exception;


}
