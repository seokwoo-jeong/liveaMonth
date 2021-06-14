package com.liveamonth.liveamonth.entity.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class ScheduleReplyVO {
	// Attributes
    private int scheduleReplyNO;
    private String scheduleReplyDesc;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:MM:SS")
    private String scheduleReplyDate;

    // References
    private int scheduleReplyRefNO;
    private int userNO;
    private int scheduleNO;

    // Constructor
    public ScheduleReplyVO() {
        this.scheduleReplyNO = 0;
        this.scheduleReplyDesc = null;
        this.scheduleReplyDate = null;

        this.scheduleReplyRefNO = 0;
        this.userNO = 0;
        this.scheduleNO = 0;
    }
}
