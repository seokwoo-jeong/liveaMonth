package com.liveamonth.liveamonth.controller;

import com.liveamonth.liveamonth.entity.dto.CalendarDTO;
import com.liveamonth.liveamonth.entity.dto.PagingDTO;
import com.liveamonth.liveamonth.entity.vo.UserVO;
import com.liveamonth.liveamonth.model.service.cityInfoService.CityService;
import com.liveamonth.liveamonth.model.service.reviewService.ReviewService;
import com.liveamonth.liveamonth.model.service.scheduleService.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static com.liveamonth.liveamonth.constants.EntityConstants.CityInfoCategory.INTRO;
import static com.liveamonth.liveamonth.constants.LogicConstants.ECityInfoAttributes.*;
import static com.liveamonth.liveamonth.constants.LogicConstants.EMyPageAttributes.*;
import static com.liveamonth.liveamonth.constants.LogicConstants.EPaging.PAIGING;
import static com.liveamonth.liveamonth.constants.LogicConstants.EPaging.SELECTED_PAGE;
import static com.liveamonth.liveamonth.constants.LogicConstants.EReview.POPULAR_REVIEW_LIST;
import static com.liveamonth.liveamonth.constants.LogicConstants.EScheduleAttributes.*;

@Controller
public class SuperController {
    @Autowired
    private CityService cityService;
    @Autowired
    private ScheduleService scheduleService;
    @Autowired
    private ReviewService reviewService;

    public void setMainPageAttributes(Model model, CalendarDTO calendarDTO) throws Exception {
        // set random cityInfoList
        model.addAttribute(RANDOM_CITY_INTRO_LIST.getText(), cityService.getRandomCityInfoListByCategory(INTRO.name()));

        // set cityIntroList
        model.addAttribute(CURRENT_MONTH_TEMP_LIST.getText(),cityService.getAVGTempList());
        model.addAttribute(CITY_TRANSPORT_GRADE_LIST.getText(), cityService.getCityTransportGradeList());
        model.addAttribute(CITY_INTRO_LIST.getText(), cityService.getCityInfoListByCategory(INTRO.name()));

        // set reviewList
        model.addAttribute(POPULAR_REVIEW_LIST.getText(), reviewService.getPopularReviewListForMain());

        // set popular scheduleList & calendarDTO
        List<HashMap<String, Object>> popularScheduleList = scheduleService.getPopularScheduleListForMain();
        model.addAttribute(FITERED_OTHER_SCHEDULE_LIST.getText(), popularScheduleList);
        this.setCalendarDTOForScheduleList(model, popularScheduleList, calendarDTO);
    }

    public void setMainSideBarAttributes(Model model, UserVO userVO) throws Exception{
        this.setMyScheduleListPaging(model, 1, userVO.getUserNO(),MANAGE_SCHEDULE_CATEGORY.getText());
        this.setMyReviewListPaging(model, 1, userVO.getUserNO(),MANAGE_REVIEW_CATEGORY.getText());
    }

    public void setCalendarDTOForScheduleList(Model model,List<HashMap<String, Object>> scheduleList,CalendarDTO calendarDTO) throws Exception{
        HashMap<String, Object> result = scheduleService.setCalendarDTOForScheduleList(scheduleList,calendarDTO);
        model.addAttribute(MONTH_LIST.getText(), result.get(MONTH_LIST.getText()));
        model.addAttribute(CALENDAR_DTO_DATE_LIST.getText(), result.get(CALENDAR_DTO_DATE_LIST.getText()));
        model.addAttribute(CALENDAR_DTO_TODAY_INFORMATION_LIST.getText(), result.get(CALENDAR_DTO_TODAY_INFORMATION_LIST.getText()));
    }

    public List<HashMap<String, Object>> setMyScheduleListPaging(Model model,int selectPage, int userNO,String manageScheduleCategory) throws Exception{
        PagingDTO schedudlePaging = scheduleService.showMySchedulePaging(selectPage,manageScheduleCategory,userNO);
        model.addAttribute(PAIGING.getText(), schedudlePaging);
        ArrayList<HashMap<String, Object>> scheduleList = scheduleService.getMyScheduleList(selectPage, userNO,manageScheduleCategory);
        model.addAttribute(MY_SCHEDULE_LIST.getText(), scheduleList);
        model.addAttribute(MANAGE_SCHEDULE_CATEGORY.getText(), manageScheduleCategory);
        return scheduleList;
    }
    public void setMyReviewListPaging(Model model,int selectPage, int userNO ,String manageReviewCategory) throws Exception{
        PagingDTO reviewPaging = reviewService.showMyReviewPaging(selectPage,manageReviewCategory,userNO);
        model.addAttribute(PAIGING.getText(), reviewPaging);
        ArrayList<HashMap<String, Object>> reviewList = reviewService.getMyReviewList(selectPage, userNO,manageReviewCategory);
        model.addAttribute(MY_REVIEW_LIST.getText(), reviewList);
        model.addAttribute(MANAGE_REVIEW_CATEGORY.getText(), manageReviewCategory);
    }
    public int getSelectePage(HttpServletRequest request){
        if (request.getParameter(SELECTED_PAGE.getText()) != null) {
            return Integer.parseInt(request.getParameter(SELECTED_PAGE.getText()));
        }else return 1;
    }

}
