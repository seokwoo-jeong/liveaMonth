package com.liveamonth.liveamonth.entity.vo;

import lombok.Data;

@Data
public class ScheduleLikeVO {
	// Attributes
	private int scheduleLikeUserNO;

	private int scheduleNO; // Reference

	// Constructor
	public ScheduleLikeVO() {
		this.scheduleLikeUserNO = 0;

		this.scheduleNO = 0;
	}

}
