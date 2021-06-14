package com.liveamonth.liveamonth.model.service.signService;

import com.liveamonth.liveamonth.entity.vo.UserVO;


public interface SignService {
    // Sign Up
    String checkID(String userID) throws Exception;
    String checkNickName(String userNickname) throws Exception;
    String checkEmail(String userEmail) throws Exception;
    void insertUser(UserVO userVO) throws Exception;

    // Sign In
    UserVO checkSign(String userID, String userPassword) throws Exception;

    // Find
    String findID(String userName, String userEmail) throws Exception;
    boolean findPW(String userID, String userName,String userEmail) throws Exception;

    // Naver Login
    String checkNaverID(String naverID) throws Exception;
    int setNewNaverMember(UserVO newNaverUser) throws Exception;
    void updateNaverUser(UserVO userVO) throws Exception;
    UserVO getNaverUser(String naverID) throws Exception;

    // inner Method
    UserVO setTokenInfo(String access_token) throws Exception;
}
