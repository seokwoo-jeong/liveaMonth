package com.liveamonth.liveamonth.model.service.myPageService;

import com.liveamonth.liveamonth.entity.vo.OneToOneAskVO;
import com.liveamonth.liveamonth.entity.vo.UserVO;
import com.liveamonth.liveamonth.model.mapper.myPageMapper.MyPageMapper;
import com.liveamonth.liveamonth.model.service.signService.MimeMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

@Service
public class MyPageServiceImpl implements MyPageService {
    @Autowired
    private MyPageMapper myPageMapper;


    @Override
    public UserVO getUserInfo(String userID) throws Exception {return myPageMapper.getUserInfo(userID);}

    @Override
    public void modifyUserInfo(UserVO userVO) throws Exception {myPageMapper.modifyUserInfo(userVO);}

	@Override
	public void modifyUserImg(String saveName,String userID) {
		myPageMapper.modifyUserImg(saveName,userID);
	}

    @Override
	public void dropUser(String userID) throws Exception {myPageMapper.dropUser(userID);}

	@Override
	public ArrayList<OneToOneAskVO> getOneToOneAskVOList(int userNO) throws Exception {
		return myPageMapper.getOneToOneAskVOList(userNO);

	}

	@Override
	public OneToOneAskVO findOneToOneAskVO(int oneToOneAskNO) throws Exception {
		return myPageMapper.findOneToOneAskVO(oneToOneAskNO);
	}

	@Override
	public void addOneToOneAsk(OneToOneAskVO oneToOneAskVO, int userNO) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Date currentTime = new Date();
		String dTime = formatter.format(currentTime);
		System.out.println(dTime);

		oneToOneAskVO.setOneToOneAskNO(myPageMapper.getLastOneToOneAskNO() + 1);
		oneToOneAskVO.setOneToOneAskDate(dTime);
		oneToOneAskVO.setUserNO(userNO);
		myPageMapper.addOneToOneAsk(oneToOneAskVO);
	}

	@Override
	public void deleteOneToOneAsk(int oneToOneAskNO) throws Exception {
		myPageMapper.deleteOneToOneAsk(oneToOneAskNO);
		
	}


}
