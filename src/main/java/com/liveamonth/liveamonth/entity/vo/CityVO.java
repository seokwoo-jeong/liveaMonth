package com.liveamonth.liveamonth.entity.vo;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
public class CityVO {
    // Attributes
    private int cityNO;
    private String cityName;

    // Constructor
    public CityVO() {
        this.cityNO = 0;
        this.cityName = null;
    }
}
