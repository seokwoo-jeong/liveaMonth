package com.liveamonth.liveamonth.entity.vo;

import lombok.Data;

import static com.liveamonth.liveamonth.constants.EntityConstants.*;

@Data
public class CityInfoVO {
    // Attributes
    private int cityInfoNO;
    private String cityInfoCategory;
    private String cityInfoImage;
    private String cityInfoDesc;

    private CityVO cityVO; // Reference

    // Constructor
    public CityInfoVO() {
        this.cityInfoNO = 0;
        this.cityInfoCategory = null;
        this.cityInfoImage = null;
        this.cityInfoDesc = null;

        this.cityVO = null;
    }
    // Get URL
    public String getCityInfoImageURL(){
        String imageURL = "";
        for(CityInfoCategory category : CityInfoCategory.values()){
            if (category.name().equals(this.getCityInfoCategory())){
                imageURL = IMAGE_URL +category.getImgUrlPath()+this.getCityInfoImage();
            }
        }
        return imageURL;
    }
}