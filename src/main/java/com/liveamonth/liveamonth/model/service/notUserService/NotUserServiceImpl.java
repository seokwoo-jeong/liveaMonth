package com.liveamonth.liveamonth.model.service.notUserService;


import com.liveamonth.liveamonth.entity.vo.OneToOneAskVO;
import com.liveamonth.liveamonth.entity.vo.UserVO;
import com.liveamonth.liveamonth.model.mapper.notUserMapper.NotUserMapper;
import com.liveamonth.liveamonth.model.mapper.signMapper.SignMapper;
import com.liveamonth.liveamonth.model.service.signService.MimeMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import java.util.ArrayList;


@Service
public class NotUserServiceImpl implements NotUserService{
	@Autowired
	private NotUserMapper notUserMapper;

	@Override
	public ArrayList<OneToOneAskVO> getOneToOneAskReplyVOList() throws Exception {
		return notUserMapper.getOneToOneAskReplyVOList();
	}

	@Override
	public void addOneToOneAskReply(OneToOneAskVO oneToOneAskVO) throws Exception {
		notUserMapper.addOneToOneAskReply(oneToOneAskVO);
	}

	@Override
	public OneToOneAskVO findOneToOneAskVO(int oneToOneAskNO) throws Exception {
		return notUserMapper.findOneToOneAskVO(oneToOneAskNO);
	}

}
