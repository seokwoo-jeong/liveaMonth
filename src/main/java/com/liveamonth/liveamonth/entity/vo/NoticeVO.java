package com.liveamonth.liveamonth.entity.vo;

import com.liveamonth.liveamonth.constants.EntityConstants.*;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class NoticeVO {

    private int noticeNO;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String noticeDate;
    private int userNO;
    private boolean readStatus;

    private int reviewReplyNO;
    private int scheduleReplyNO;
    private int reviewNO;
    private int scheduleNO;

    private ENoticeType noticeType;
    private String objectSubject;
    private String noticeContent;

    private UserVO senderVO;

    public NoticeVO(){
        this.noticeNO = 0;
        this.noticeDate = null;
        this.userNO = 0;
        this.readStatus = true;

        this.reviewReplyNO = 0;
        this.scheduleReplyNO = 0;
        this.reviewNO = 0;
        this.scheduleNO = 0;

        this.noticeType = null;
        this.objectSubject = null;
        this.noticeContent = null;

        this.senderVO = null;
    }
}
