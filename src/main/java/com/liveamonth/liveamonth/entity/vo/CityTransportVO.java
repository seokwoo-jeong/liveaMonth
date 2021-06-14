package com.liveamonth.liveamonth.entity.vo;

import lombok.Data;

@Data
public class CityTransportVO {
	// Attributes
	private int cityTransportNO;
	private String cityTransportCategory;
	private int cityStationCount;

	private CityVO cityVO; // Reference

	// Constructor
	public CityTransportVO() {
		this.cityTransportNO = 0;
		this.cityTransportCategory = null;
		this.cityStationCount = 0;

		this.cityVO = null;
	}
}
