package com.liveamonth.liveamonth.entity.vo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import static com.liveamonth.liveamonth.constants.EntityConstants.*;

@Data
public class OneToOneAskVO {

    // Attributes
    private int oneToOneAskNO;
    private OneToOneAskCategory oneToOneAskCategory;
    private String oneToOneAskSubject;
    private String oneToOneAskDesc;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String oneToOneAskDate;
    String oneToOneAskImage;
    String oneToOneAskUserEmail;
    String oneToOneAskReply;

    int userNO; // Reference

    // Constructor
    public OneToOneAskVO() {
        this.oneToOneAskNO = 0;
        this.oneToOneAskCategory = null;
        this.oneToOneAskSubject = null;
        this.oneToOneAskDesc = null;
        this.oneToOneAskDate = null;
        this.oneToOneAskImage = null;
        this.oneToOneAskUserEmail = null;
        this.oneToOneAskReply = null;

        this.userNO = 0;
    }

    // Get URL
    public String getOneToOneAskImageURL(){
        return IMAGE_URL +"onetooneask/"+this.getOneToOneAskImage();
    }
}
