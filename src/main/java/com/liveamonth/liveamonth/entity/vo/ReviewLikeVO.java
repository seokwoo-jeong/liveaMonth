package com.liveamonth.liveamonth.entity.vo;

import lombok.Data;

@Data
public class ReviewLikeVO {
	// Attributes
	private int reviewLikeUserNO;

	private int reviewNO; // Reference

	// Constructor
	public ReviewLikeVO() {
		this.reviewNO = 0;

		this.reviewLikeUserNO = 0;
	}
}
