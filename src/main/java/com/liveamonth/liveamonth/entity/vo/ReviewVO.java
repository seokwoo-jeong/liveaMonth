package com.liveamonth.liveamonth.entity.vo;

import com.liveamonth.liveamonth.constants.EntityConstants.*;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class ReviewVO {
    // Attributes
    private int reviewNO;
    private EReviewCategoryName reviewCategory;
    private String reviewSubject;
    private String reviewDesc;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:MM:SS") 
    private String reviewDate;
    private int reviewViewCount;

    // Reference
    private int userNO;
    private UserVO userVO;

    // Constructor
    public ReviewVO() {
        this.reviewNO = 0;
        this.reviewCategory = null;
        this.reviewSubject = null;
        this.reviewDesc = null;
        this.reviewDate = null;
        this.reviewViewCount = 0;

        // Reference
        this.userNO = 0;
        this.userVO = null;
    }
}
