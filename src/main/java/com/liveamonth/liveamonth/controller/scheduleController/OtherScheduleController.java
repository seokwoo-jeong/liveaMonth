package com.liveamonth.liveamonth.controller.scheduleController;


import com.liveamonth.liveamonth.controller.SuperController;
import com.liveamonth.liveamonth.entity.dto.CalendarDTO;
import com.liveamonth.liveamonth.entity.dto.PagingDTO;
import com.liveamonth.liveamonth.entity.vo.ScheduleLikeVO;
import com.liveamonth.liveamonth.entity.vo.ScheduleReplyVO;
import com.liveamonth.liveamonth.entity.vo.UserVO;
import com.liveamonth.liveamonth.model.service.cityInfoService.CityService;
import com.liveamonth.liveamonth.model.service.scheduleService.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import static com.liveamonth.liveamonth.constants.ControllerPathConstants.ESchedulePath.*;
import static com.liveamonth.liveamonth.constants.EntityConstants.ESchedule.SCHEDULE_NO;
import static com.liveamonth.liveamonth.constants.EntityConstants.EScheduleReply.SCHEDULE_REPLY_NO;
import static com.liveamonth.liveamonth.constants.EntityConstants.EUser.USER_VO;
import static com.liveamonth.liveamonth.constants.LogicConstants.EAlertMessage.*;
import static com.liveamonth.liveamonth.constants.LogicConstants.EOtherScheduleMessage.*;
import static com.liveamonth.liveamonth.constants.LogicConstants.EPaging.LIKE_STATUS;
import static com.liveamonth.liveamonth.constants.LogicConstants.EPaging.PAIGING;
import static com.liveamonth.liveamonth.constants.LogicConstants.EScheduleAttributes.*;
import static com.liveamonth.liveamonth.constants.LogicConstants.EScheduleFilterAndOrders;
import static com.liveamonth.liveamonth.constants.LogicConstants.EScheduleFilterAndOrders.SCHEDULE_FO_ORDER;

@Controller
public class OtherScheduleController extends SuperController {
    @Autowired
    private ScheduleService scheduleService;
    @Autowired
    private CityService cityService;

    @RequestMapping("/otherScheduleList")
    public String otherScheduleList(Model model, HttpServletRequest request, CalendarDTO calendarDTO) throws Exception {
        // set filters&orders
        HashMap<String, Object> filtersAndOrder = this.makeFiltersAndOrder(request, request.getParameter(SCHEDULE_ACTION.getText()));

        // paging
        int selectPage = super.getSelectePage(request);
        PagingDTO paging = scheduleService.showOtherScheduleListPaging(filtersAndOrder, selectPage);
        model.addAttribute(PAIGING.getText(), paging);

        // set otherScheduleList & calendarDTO
        List<HashMap<String, Object>> otherScheduleList = scheduleService.getOtherScheduleList(filtersAndOrder, selectPage);
        model.addAttribute(FITERED_OTHER_SCHEDULE_LIST.getText(), otherScheduleList);
        this.setCalendarDTOForScheduleList(model,otherScheduleList,calendarDTO);

        // add requestList
        HashMap<String, Object> requestList = makeRequestList(request);
        model.addAttribute(REQUEST_LIST.getText(), requestList);
        model.addAttribute(SCHEDULE_PLACE_LIST.getText(), cityService.getCityInfoNameList());
        return OTHER_SCHEDULE_LIST.getPath();
    }

    @RequestMapping("otherSchedule")
    public String otherSchedule(Model model, HttpServletRequest request, CalendarDTO calendarDTO){
        HttpSession session = request.getSession();
        UserVO session_UserVO = (UserVO) session.getAttribute(USER_VO.getText());
        int scheduleNO = Integer.parseInt(request.getParameter(SCHEDULE_NO.getText()));
        model.addAttribute(SCHEDULE_NO.getText(), scheduleNO);

        int selectPage = super.getSelectePage(request);
        try {
            scheduleService.increaseScheduleViewCount(scheduleNO);
        } catch (Exception e) {
            System.err.println(SCHEDULE_VIEWCOUNT_INCREASE_FAIL_MESSAGE.getText() + e);
            return REDIRECT_OTHER_SCHEDULELIST.getPath();
        }

        CalendarDTO calendarDto;
        try {
            if(calendarDTO.getDate().equals("") && calendarDTO.getMonth().equals("")) {
                calendarDto = scheduleService.otherCalendar(calendarDTO, scheduleNO);
            } else {
                calendarDto = scheduleService.showCalendar(calendarDTO, scheduleNO);
            }
            model.addAttribute(DATE_LIST.getText(), calendarDto.getDateList()); //날짜 데이터 배열
            model.addAttribute(TODAY_INFORMATION.getText(), calendarDto.getTodayInformation());
        } catch (Exception e) {
            System.err.println(SCHEDULE_LOAD_FAIL_MESSAGE.getText() + e);
            return REDIRECT_OTHER_SCHEDULELIST.getPath();
        }

        PagingDTO paging;
        try {
            paging = scheduleService.showPaging(selectPage, scheduleNO);
            model.addAttribute(PAIGING.getText(), paging);
        } catch (Exception e) {
            System.err.println(SCHEDULEREPLY_PAGING_FAIL_MESSAGE.getText() + e);
            return REDIRECT_OTHER_SCHEDULELIST.getPath();
        }

        try {
            ArrayList<HashMap<String, Object>> scheduleReplyList = scheduleService.getScheduleReplyList(scheduleNO, selectPage);
            model.addAttribute(SCHEDULEREPLY_VO_LIST.getText(), scheduleReplyList);
        } catch (Exception e) {
            System.err.println(SCHEDULEREPLY_LOAD_FAIL_MESSAGE.getText() + e);
            return REDIRECT_OTHER_SCHEDULELIST.getPath();
        }

        try {
            HashMap<String, String> scheduleAndLikeCount = scheduleService.getScheduleAndLikeCount(scheduleNO);
            model.addAttribute(OTHER_SCHEDULE_AND_LIKE_COUNT.getText(), scheduleAndLikeCount);
        } catch (Exception e) {
            System.err.println(SCHEDULE_LIKECOUNT_LOAD_FAIL_MESSAGE.getText() + e);
            return REDIRECT_OTHER_SCHEDULELIST.getPath();
        }

        if (session_UserVO != null) {
            ScheduleLikeVO scheduleLikeVO = new ScheduleLikeVO();
            scheduleLikeVO.setScheduleNO(scheduleNO);
            scheduleLikeVO.setScheduleLikeUserNO(session_UserVO.getUserNO());
            try {
                int status = scheduleService.getScheduleLikeStatus(scheduleLikeVO);
                model.addAttribute(LIKE_STATUS.getText(), status);
            } catch (Exception e) {
                System.err.println(SCHEDULE_LIKESTATUS_LOAD_FAIL_MESSAGE.getText() + e);
                return REDIRECT_OTHER_SCHEDULELIST.getPath();
            }
        }
        return OTHER_SCHEDULE.getPath();
    }

    @RequestMapping(value = "addScheduleReply")
    public String addScheduleReply(HttpSession session, ScheduleReplyVO scheduleReplyVO, RedirectAttributes rttr){
        UserVO session_UserVO = (UserVO) session.getAttribute(USER_VO.getText());
        int userNO = session_UserVO.getUserNO();

        long systemTime = System.currentTimeMillis();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
        String dTime = formatter.format(systemTime);
        scheduleReplyVO.setScheduleReplyDate(dTime);

        try {
            scheduleService.addScheduleReplyVO(scheduleReplyVO, userNO);
            rttr.addFlashAttribute(MESSAGE.getText(), ADD_SCHEDULEREPLY.getText());
        } catch (Exception e) {
            rttr.addFlashAttribute(MESSAGE.getText(), FAIL_TO_ADD_SCHEDULEREPLY.getText());
            e.printStackTrace();
        }
        rttr.addAttribute(SCHEDULE_NO.getText(), scheduleReplyVO.getScheduleNO());

        return REDIRECT_OTHER_SCHEDULE.getRedirectPath();
    }

    @RequestMapping("deleteScheduleReply")
    public String deleteScheduleReply(HttpServletRequest request, RedirectAttributes rttr){
        int scheduleReplyNO = Integer.parseInt(String.valueOf(request.getParameter(SCHEDULE_REPLY_NO.getText())));
        int scheduleNO = Integer.parseInt(String.valueOf(request.getParameter(SCHEDULE_NO.getText())));

        try {
            scheduleService.deleteScheduleReply(scheduleReplyNO);
            rttr.addFlashAttribute(MESSAGE.getText(), COMPLETE_SCHEDULEREPLY_DELETION.getText());
        } catch (Exception e) {
            rttr.addFlashAttribute(MESSAGE.getText(), FAIL_TO_DELETE_SCHEDULEREPLY.getText());
            e.printStackTrace();
        }
        rttr.addAttribute(SCHEDULE_NO.getText(), scheduleNO);

        return REDIRECT_OTHER_SCHEDULE.getRedirectPath();
    }

    @RequestMapping("modifyScheduleReply")
    public String modifyScheduleReply(RedirectAttributes rttr, ScheduleReplyVO scheduleReplyVO){
        try {
            scheduleService.modifyScheduleReply(scheduleReplyVO);
            rttr.addFlashAttribute(MESSAGE.getText(), COMPLETE_SCHEDULEREPLY_MODIFICATION.getText());
        } catch (Exception e) {
            rttr.addFlashAttribute(MESSAGE.getText(), FAIL_TO_MODIFY_SCHEDULEREPLY.getText());
            e.printStackTrace();
        }
        rttr.addAttribute(SCHEDULE_NO.getText(), scheduleReplyVO.getScheduleNO());

        return REDIRECT_OTHER_SCHEDULE.getRedirectPath();
    }

    @ResponseBody
    @RequestMapping(value = "/updateScheduleLike", method = RequestMethod.GET)
    public HashMap<String, Integer> getScheduleLikeAndCount(@ModelAttribute ScheduleLikeVO scheduleLikeVO){
        try {
            return scheduleService.getScheduleLikeAndCount(scheduleLikeVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Inner Method
    private int checkOption(String option) {
        if (option != null) {
            if (!"null".equals(option)&&!"".equals(option)) {
                return Integer.parseInt(option);
            }
        }
        return -1;
    }
    private HashMap<String, Object> makeRequestList(HttpServletRequest request) {
        HashMap<String, Object> requestList = new HashMap<>();
        for (EScheduleFilterAndOrders eFO : EScheduleFilterAndOrders.values()) {
            if (eFO == SCHEDULE_FO_ORDER) {
                requestList.put(eFO.getText(), request.getParameter(eFO.getText()));
            } else {
                int option = this.checkOption(request.getParameter(eFO.getText()));
                requestList.put(eFO.getText(), option);
            }
        }
        return requestList;
    }
    private HashMap<String, Object>  makeFiltersAndOrder(HttpServletRequest request, String action){
        HashMap<String, Object> filtersAndOrder = new HashMap<>();
        if (action.equals(SCHEDULE_LIST.getText())) {
            for (EScheduleFilterAndOrders eFO : EScheduleFilterAndOrders.values()) {
                if (eFO == SCHEDULE_FO_ORDER) filtersAndOrder.put(eFO.getText(), ORDER_BY_NEW.getText());
                else filtersAndOrder.put(eFO.getText() + FILTER.getText(), false);
            }
        } else if (action.equals(SCHEDULE_FILTER.getText())) {
            for (EScheduleFilterAndOrders eFO : EScheduleFilterAndOrders.values()) {
                if (eFO == SCHEDULE_FO_ORDER) filtersAndOrder.put(eFO.getText(), request.getParameter(SCHEDULE_FO_ORDER.getText()));
                else {
                    int option = this.checkOption(request.getParameter(eFO.getText()));
                    boolean optionStatus = false;
                    if (option != -1) {
                        optionStatus = true;
                        filtersAndOrder.put(eFO.getText(), option);
                    }
                    filtersAndOrder.put(eFO.getText() + FILTER.getText(), optionStatus);
                }
            }
        }
        return filtersAndOrder;
    }
}
