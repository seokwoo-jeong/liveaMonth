package com.liveamonth.liveamonth.controller.noticeController;

import com.liveamonth.liveamonth.model.service.noticeService.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

import static com.liveamonth.liveamonth.constants.EntityConstants.IMAGE_URL;
import static com.liveamonth.liveamonth.constants.LogicConstants.ENotice.*;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @ResponseBody
    @RequestMapping(value = "/getAllNotice", method = RequestMethod.GET)
    public HashMap<String, Object> getAllNotice(int userNO){
        HashMap<String, Object> noticeMap = new HashMap<>();
        try {
            noticeMap.put(NOTICE_LIST.getText(), this.noticeService.getAllNotice(userNO));
            noticeMap.put(NOTICE_COUNT.getText(), this.noticeService.getNoticeCount(userNO));
            noticeMap.put(IMG_URL.getText(), IMAGE_URL +USER_DIR.getText());
        } catch (Exception e) {
            System.err.println(NOTICE_ERROR_MESSAGE.getText() + e);
        }
        return noticeMap;
    }

    @ResponseBody
    @RequestMapping(value = "/updateReadStatus", method = RequestMethod.POST)
    public void updateReadStatus(int userNO){
        try {
            this.noticeService.updateReadStatus(userNO);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
