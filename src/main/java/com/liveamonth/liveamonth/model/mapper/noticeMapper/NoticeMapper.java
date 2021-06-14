package com.liveamonth.liveamonth.model.mapper.noticeMapper;

import com.liveamonth.liveamonth.entity.vo.NoticeVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;

@Repository
@Mapper
public interface NoticeMapper {
    ArrayList<NoticeVO> getAllNotice(int UserNO) throws Exception;
    int getNoticeCount(int userNO) throws Exception;
    void updateReadStatus(int userNO) throws Exception;
    int addNotice(NoticeVO notice) throws Exception;

    void addRRNotice(HashMap<String, Integer> map) throws Exception;
    void addRLNotice(HashMap<String, Integer> map) throws Exception;
    void addSRNotice(HashMap<String, Integer> map) throws Exception;
    void addSLNotice(HashMap<String, Integer> map) throws Exception;
}
