package com.liveamonth.liveamonth.entity.vo;

import lombok.Data;

@Data
public class ScheduleVO {
    // Attributes
    private int scheduleNO;
    private String scheduleSubject;
    private int scheduleViewCount;
    private boolean scheduleStatus;

    // Reference
    private int userNO;
    private CityVO cityVO;

    // Constructor
    public ScheduleVO() {
        this.scheduleNO = 0;
        this.scheduleSubject = null;
        this.scheduleViewCount = 0;
        this.scheduleStatus = false;

        this.cityVO = null;
        this.userNO = 0;
    }
}
