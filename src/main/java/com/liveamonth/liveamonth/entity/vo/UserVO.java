package com.liveamonth.liveamonth.entity.vo;

import lombok.Data;

import java.util.Calendar;

import static com.liveamonth.liveamonth.constants.EntityConstants.IMAGE_URL;

@Data
public class UserVO {
	// Attributes
	private int userNO;
	private String userID;
	private String userPassword;
	private String userName;
	private String userNickname;
	private int userAge;
	//null 넣기 위해 참조형 type 수정
	private Boolean userSex;
	private String userEmail;
	private String userImage;

	// Constructor
	public UserVO() {
		this.userNO = 0;
		this.userID = null;
		this.userPassword = null;
		this.userName = null;
		this.userNickname = null;
		this.userAge = 0;
		this.userSex = null;
		this.userEmail = null;
		this.userImage = null;
	}

	// Getter & Setter
	public int getUserRealAge(){
		return Calendar.getInstance().get(Calendar.YEAR) - this.userAge;
	}
	public String getUserSexToString() {
		if (this.userSex) return "여성";
		else return "남성";
	}
	// Get URL
	public String getUserImageURL(){
		return IMAGE_URL +"user/"+this.getUserImage();
	}
}



