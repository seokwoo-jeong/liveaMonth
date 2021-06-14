package com.liveamonth.liveamonth.model.mapper.signMapper;

import com.liveamonth.liveamonth.entity.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
@Mapper
public interface SignMapper {
    // Sign Up
    String checkID(String userID) throws Exception;
    String checkNickName(String userNickName) throws Exception;
    String checkEmail(String userEmail)  throws Exception;
    void insertUser(UserVO userVO) throws Exception;

    // Sign In
    UserVO checkSign(HashMap<String, Object> hash) throws Exception;

    // Find User
    String findID(String userName, String userEmail) throws Exception;
    String findPW(String userID, String userName, String userEmail) throws Exception;
    void updatePW(String userID, String password) throws Exception;

    // Naver Login
    String checkNaverID(String naverID) throws Exception;
    int setNewNaverMember(UserVO newNaverUser) throws Exception;
    void updateNaverUser(UserVO userVO) throws Exception;
    UserVO getNaverUser(String naverID) throws Exception;

    // Be used in SignService
    UserVO searchUserById(String userID);
}
