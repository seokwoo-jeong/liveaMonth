package com.liveamonth.liveamonth.entity.vo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
@Data
public class ReviewReplyVO {
	// Attributes
    private int reviewReplyNO;
    private String reviewReplyDesc;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String reviewReplyDate;

    // References
    private int reviewReplyRefNO;
    private int userNO;
    private int reviewNO;

    // Constructor
    public ReviewReplyVO() {
        this.reviewReplyNO = 0;
        this.reviewReplyDesc = null;
        this.reviewReplyDate = null;

        this.reviewReplyRefNO = 0;
        this.userNO = 0;
        this.userNO = 0;
    }
}
