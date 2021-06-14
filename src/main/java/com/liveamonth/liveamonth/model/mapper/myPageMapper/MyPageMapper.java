package com.liveamonth.liveamonth.model.mapper.myPageMapper;

import com.liveamonth.liveamonth.entity.vo.OneToOneAskVO;
import com.liveamonth.liveamonth.entity.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
@Mapper
public interface MyPageMapper {
	// userInfo
	UserVO getUserInfo(String userID) throws Exception;
    void modifyUserInfo(UserVO userVO)throws Exception;
	void modifyUserImg(String saveName, String userID);
	void dropUser(String userID) throws Exception;

	// OneToOneAsk
	ArrayList<OneToOneAskVO> getOneToOneAskVOList(int userNO) throws Exception;
	int getLastOneToOneAskNO() throws Exception;
	OneToOneAskVO findOneToOneAskVO(int oneToOneAskNO) throws Exception;
	void addOneToOneAsk(OneToOneAskVO oneToOneAskVO) throws Exception;
	void deleteOneToOneAsk(int oneToOneAskNO)  throws Exception;
}
