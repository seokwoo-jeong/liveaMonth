package com.liveamonth.liveamonth.entity.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class ScheduleContentVO {
	// Attributes
    private int scheduleContentNO;
    private String scheduleContentSubject;
    private String scheduleContentDesc;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String scheduleContentDate;
    private int scheduleContentCost;

    private int scheduleNO;// Reference

	// Constructor
	public ScheduleContentVO() {
		this.scheduleContentNO = 0;
		this.scheduleContentSubject = null;
		this.scheduleContentDesc = null;
		this.scheduleContentDate = null;
		this.scheduleContentCost = 0;

		this.scheduleNO = 0;
	}
}
