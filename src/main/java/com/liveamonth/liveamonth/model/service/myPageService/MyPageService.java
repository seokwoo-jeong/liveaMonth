package com.liveamonth.liveamonth.model.service.myPageService;

import com.liveamonth.liveamonth.entity.vo.OneToOneAskVO;
import com.liveamonth.liveamonth.entity.vo.UserVO;

import java.util.ArrayList;

public interface MyPageService {
	// userInfo
	UserVO getUserInfo(String userID) throws Exception;
	void modifyUserInfo(UserVO userVO) throws Exception;
	void modifyUserImg(String saveName, String userID);
	void dropUser(String userID) throws Exception;

	// OneToOneAsk
	ArrayList<OneToOneAskVO> getOneToOneAskVOList(int userNO) throws Exception;
	OneToOneAskVO findOneToOneAskVO(int oneToOneAskNO) throws Exception;
	void addOneToOneAsk(OneToOneAskVO oneToOneAskVO, int userNO) throws Exception;
	void deleteOneToOneAsk(int oneToOneAskNO) throws Exception;
}
