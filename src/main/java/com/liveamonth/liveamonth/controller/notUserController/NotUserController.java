package com.liveamonth.liveamonth.controller.notUserController;

import com.liveamonth.liveamonth.entity.vo.OneToOneAskVO;
import com.liveamonth.liveamonth.entity.vo.UserVO;
import com.liveamonth.liveamonth.model.service.notUserService.NotUserService;
import com.liveamonth.liveamonth.model.service.signService.MimeMessageService;
import com.liveamonth.liveamonth.model.service.signService.SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

import static com.liveamonth.liveamonth.constants.ControllerPathConstants.EMyPagePath.*;
import static com.liveamonth.liveamonth.constants.EntityConstants.EOneToOneAsk.*;
import static com.liveamonth.liveamonth.constants.EntityConstants.EUser.USER_VO;

@Controller
public class NotUserController {
    @Autowired
    private MimeMessageService mimeMessageService;
    @Autowired
    private NotUserService notUserService;

    @GetMapping("/oneToOneAskReply")
    public String oneToOneAskReply(Model model) throws Exception {
        model.addAttribute(ONE_TO_ONE_ASK_VO_LIST.getText(), notUserService.getOneToOneAskReplyVOList());
        return ONE_TO_ONE_ASK_REPLY.getPath();
    }

    @GetMapping("/writeOneToOneAskReply")
    public String oneToOneAskReplyWrite(Model model, HttpServletRequest request) throws Exception {
        OneToOneAskVO oneToOneAskVO = notUserService.findOneToOneAskVO(Integer.parseInt(request.getParameter(ONE_TO_ONE_ASK_NO.getText())));
        model.addAttribute(ONE_TO_ONE_ASK_VO.getText(), oneToOneAskVO);
        return WRITE_ONE_TO_ONE_ASK_REPLY.getPath();
    }

    @GetMapping("/resultMentOneToOneAskReply")
    public String resultMentOneToOneAskReply(OneToOneAskVO oneToOneAskVO, HttpSession session, Model model) throws Exception {
        UserVO userVO = (UserVO) session.getAttribute(USER_VO.getText());
        notUserService.addOneToOneAskReply(oneToOneAskVO);
        mimeMessageService.sendOneToOneAskByMail(oneToOneAskVO, userVO);
        model.addAttribute(USER_VO.getText(), userVO);
        return RESULT_MENT_ONE_TO_ONE_ASK_REPLY.getPath();
    }


}
