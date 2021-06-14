package com.liveamonth.liveamonth.model.mapper.notUserMapper;

import com.liveamonth.liveamonth.entity.vo.OneToOneAskVO;
import com.liveamonth.liveamonth.entity.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
@Mapper
public interface NotUserMapper {
	ArrayList<OneToOneAskVO> getOneToOneAskReplyVOList() throws Exception;
	void addOneToOneAskReply(OneToOneAskVO oneToOneAskVO) throws Exception;
	OneToOneAskVO findOneToOneAskVO(int oneToOneAskNO)throws Exception;
}
