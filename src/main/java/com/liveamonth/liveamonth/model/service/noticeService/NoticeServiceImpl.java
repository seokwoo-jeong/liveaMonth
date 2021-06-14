package com.liveamonth.liveamonth.model.service.noticeService;

import com.liveamonth.liveamonth.constants.EntityConstants.ENoticeType;
import com.liveamonth.liveamonth.entity.vo.*;
import com.liveamonth.liveamonth.model.mapper.noticeMapper.NoticeMapper;
import com.liveamonth.liveamonth.model.mapper.reviewMapper.ReviewMapper;
import com.liveamonth.liveamonth.model.mapper.scheduleMapper.ScheduleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import static com.liveamonth.liveamonth.constants.EntityConstants.ENoticeType.NOTICE_NO;
import static com.liveamonth.liveamonth.constants.EntityConstants.EReview.REVIEW_NO;
import static com.liveamonth.liveamonth.constants.EntityConstants.EReviewReply.REVIEW_REPLY_NO;
import static com.liveamonth.liveamonth.constants.EntityConstants.ESchedule.SCHEDULE_NO;
import static com.liveamonth.liveamonth.constants.EntityConstants.EScheduleReply.SCHEDULE_REPLY_NO;

@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeMapper noticeMapper;

    @Autowired
    private ReviewMapper reviewMapper;

    @Autowired
    private ScheduleMapper scheduleMapper;

    @Override
    public ArrayList<NoticeVO> getAllNotice(int UserNO) throws Exception{
        ArrayList<NoticeVO> noticeList = this.noticeMapper.getAllNotice(UserNO);
        String subject = null;

        for(NoticeVO notice : noticeList){
            if(notice.getReviewNO() != 0){
                ReviewVO review = this.reviewMapper.getReviewVO(notice.getReviewNO());
                subject = review.getReviewSubject();
                if(subject.length() > 5){
                    subject = subject.substring(0, 5) + "...";
                }
                notice.setNoticeType(ENoticeType.REVIEW_LIKE);

            } else if (notice.getScheduleNO() != 0) {
                ScheduleVO scheduleVO = this.scheduleMapper.getScheduleVO(notice.getScheduleNO());
                subject = scheduleVO.getScheduleSubject();
                if(subject.length() > 5){
                    subject = subject.substring(0, 5) + "...";
                }
                notice.setNoticeType(ENoticeType.SCHEDULE_LIKE);

            } else if (notice.getReviewReplyNO() != 0) {
                ReviewReplyVO reviewReply = this.reviewMapper.getReviewReply(notice.getReviewReplyNO());
                String desc = reviewReply.getReviewReplyDesc();

                if(desc.length() > 10){
                    desc = desc.substring(0, 10) + "...";
                }

                if(reviewReply.getReviewReplyRefNO() == 0){
                    ReviewVO review = this.reviewMapper.getReviewVO(reviewReply.getReviewNO());
                    subject = review.getReviewSubject();

                    if(subject.length() > 5){
                        subject = subject.substring(0, 5) + "...";
                    }

                    notice.setNoticeType(ENoticeType.REVIEW_REPLY);
                } else {
                    ReviewReplyVO reviewReplyRef = this.reviewMapper.getReviewReply(reviewReply.getReviewReplyRefNO());
                    subject = reviewReplyRef.getReviewReplyDesc();

                    if(subject.length() > 5){
                        subject = subject.substring(0, 5) + "...";
                    }

                    notice.setNoticeType(ENoticeType.REVIEW_REPLY_REF);
                }
                notice.setReviewNO(reviewReply.getReviewNO());
                notice.setNoticeContent(desc);

            } else if (notice.getScheduleReplyNO() != 0) {
                ScheduleReplyVO scheduleReplyVO = this.scheduleMapper.getScheduleReply(notice.getScheduleReplyNO());
                String desc = scheduleReplyVO.getScheduleReplyDesc();

                if(desc.length() > 10){
                    desc = desc.substring(0, 10) + "...";
                }

                if(scheduleReplyVO.getScheduleReplyRefNO() == 0){
                    ScheduleVO scheduleVO = this.scheduleMapper.getScheduleVO(scheduleReplyVO.getScheduleNO());
                    subject = scheduleVO.getScheduleSubject();

                    if(subject.length() > 5){
                        subject = subject.substring(0, 5) + "...";
                    }

                    notice.setNoticeType(ENoticeType.SCHEDULE_REPLY);
                } else {
                    ScheduleReplyVO scheduleReplyRef = this.scheduleMapper.getScheduleReply(notice.getScheduleReplyNO());
                    subject = scheduleReplyRef.getScheduleReplyDesc();

                    if(subject.length() > 5){
                        subject = subject.substring(0, 5) + "...";
                    }

                    notice.setNoticeType(ENoticeType.SCHEDULE_REPLY_REF);
                }

                notice.setScheduleNO(scheduleReplyVO.getScheduleNO());
                notice.setNoticeContent(desc);
            }
            notice.setObjectSubject(subject);
        }
        return noticeList;
    }

    @Override
    public int getNoticeCount(int userNO) throws Exception {
        return this.noticeMapper.getNoticeCount(userNO);
    }

    @Override
    public void updateReadStatus(int userNO) throws Exception {
        this.noticeMapper.updateReadStatus(userNO);
    }

    @Override
    public int addNotice(int userNO, int senderNO) throws Exception{
        long systemTime = System.currentTimeMillis();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
        String dTime = formatter.format(systemTime);

        UserVO sender = new UserVO();
        sender.setUserNO(senderNO);

        NoticeVO notice = new NoticeVO();
        notice.setNoticeDate(dTime);
        notice.setUserNO(userNO);
        notice.setSenderVO(sender);
        notice.setReadStatus(true);

        long rowCount = this.noticeMapper.addNotice(notice);
        long noticeNO = notice.getNoticeNO();
        return (int)noticeNO;
    }

    @Override
    public void addRRNotice(int noticeNO, int reviewReplyNO) throws Exception{
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put(NOTICE_NO.getText(), noticeNO);
        map.put(REVIEW_REPLY_NO.getText(), reviewReplyNO);
        this.noticeMapper.addRRNotice(map);
    }

    @Override
    public void addRLNotice(int noticeNO, int reviewNO) throws Exception{
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put(NOTICE_NO.getText(), noticeNO);
        map.put(REVIEW_NO.getText(), reviewNO);
        this.noticeMapper.addRLNotice(map);
    }

    @Override
    public void addSRNotice(int noticeNO, int scheduleReplyNO) throws Exception{
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put(NOTICE_NO.getText(), noticeNO);
        map.put(SCHEDULE_REPLY_NO.getText(), scheduleReplyNO);
        this.noticeMapper.addSRNotice(map);
    }

    @Override
    public void addSLNotice(int noticeNO, int scheduleNO) throws Exception{
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put(NOTICE_NO.getText(), noticeNO);
        map.put(SCHEDULE_NO.getText(), scheduleNO);
        this.noticeMapper.addSLNotice(map);
    }

}
