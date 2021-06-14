package com.liveamonth.liveamonth.model.service.signService;

import com.liveamonth.liveamonth.entity.vo.OneToOneAskVO;
import com.liveamonth.liveamonth.entity.vo.UserVO;

public interface SendMailService {
    void sendPasswordByMail(UserVO userVO);
    void sendOneToOneAskByMail(OneToOneAskVO oneToOneAskVO,UserVO userVO);
}
