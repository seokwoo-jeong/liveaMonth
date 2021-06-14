package com.liveamonth.liveamonth.controller;

import com.liveamonth.liveamonth.entity.dto.CalendarDTO;
import com.liveamonth.liveamonth.entity.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

import static com.liveamonth.liveamonth.constants.ControllerPathConstants.ETemplatePath.MAIN;
import static com.liveamonth.liveamonth.constants.EntityConstants.EUser.USER_VO;

@Controller
public class MainController extends SuperController{

    @RequestMapping(value = "/")
    public String main(Model model,HttpSession session,CalendarDTO calendarDTO) throws Exception {
        // MainPage Attributes
        this.setMainPageAttributes(model,calendarDTO);

        // MainSideBar Attributes
        UserVO userVO = (UserVO)session.getAttribute(USER_VO.getText());
        if(userVO != null)this.setMainSideBarAttributes(model, userVO);
        return MAIN.getPath();
    }


}
