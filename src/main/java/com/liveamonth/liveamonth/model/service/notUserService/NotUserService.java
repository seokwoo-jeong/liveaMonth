package com.liveamonth.liveamonth.model.service.notUserService;

import com.liveamonth.liveamonth.entity.vo.OneToOneAskVO;
import com.liveamonth.liveamonth.entity.vo.UserVO;

import java.util.ArrayList;

public interface NotUserService {
	ArrayList<OneToOneAskVO> getOneToOneAskReplyVOList() throws Exception;
	void addOneToOneAskReply(OneToOneAskVO oneToOneAskVO) throws Exception;
	OneToOneAskVO findOneToOneAskVO(int oneToOneAskNO) throws Exception;
}
