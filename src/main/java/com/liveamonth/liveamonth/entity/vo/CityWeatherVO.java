package com.liveamonth.liveamonth.entity.vo;

import lombok.Data;

@Data
public class CityWeatherVO {
	// Attributes
	private int cityWeatherNO;
	private int cityWeatherMonth;
	private float cityWeatherMaxTemp;
	private float cityWeatherMinTemp;
	private float cityWeatherAVGTemp;

	private CityVO cityVO; // Reference

	// Constructor
	public CityWeatherVO() {
		this.cityWeatherNO = 0;
		this.cityWeatherMonth = 0;
		this.cityWeatherMaxTemp = 0;
		this.cityWeatherMinTemp = 0;
		this.cityWeatherAVGTemp = 0;

		this.cityVO = null;
	}
}
