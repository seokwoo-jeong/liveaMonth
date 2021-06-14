package com.liveamonth.liveamonth.controller.myPageController;

import com.liveamonth.liveamonth.constants.LogicConstants.EPageOptions;
import com.liveamonth.liveamonth.controller.SuperController;
import com.liveamonth.liveamonth.entity.dto.CalendarDTO;
import com.liveamonth.liveamonth.entity.dto.S3UploaderDTO;
import com.liveamonth.liveamonth.entity.vo.OneToOneAskVO;
import com.liveamonth.liveamonth.entity.vo.UserVO;
import com.liveamonth.liveamonth.model.service.myPageService.MyPageService;
import com.liveamonth.liveamonth.model.service.reviewService.ReviewService;
import com.liveamonth.liveamonth.model.service.scheduleService.ScheduleService;
import com.liveamonth.liveamonth.model.service.signService.SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import static com.liveamonth.liveamonth.constants.ControllerPathConstants.EMyPagePath.*;
import static com.liveamonth.liveamonth.constants.ControllerPathConstants.ETemplatePath.MY_PAGE;
import static com.liveamonth.liveamonth.constants.EntityConstants.EOneToOneAsk.*;
import static com.liveamonth.liveamonth.constants.EntityConstants.EUser.*;
import static com.liveamonth.liveamonth.constants.EntityConstants.OneToOneAskCategory;
import static com.liveamonth.liveamonth.constants.LogicConstants.EMyPageAttributes.*;
import static com.liveamonth.liveamonth.constants.LogicConstants.EPageOptions.*;


@Controller
public class MyPageController extends SuperController {
    @Autowired
    private MyPageService myPageService;
    @Autowired
    private SignService signService;
    @Autowired
    private S3UploaderDTO s3Uploader;
    @Autowired
    private ScheduleService scheduleService;
    @Autowired
    private ReviewService reviewService;

    @GetMapping("/myPage")
    public String myPage(Model model, HttpSession session) {
        model.addAttribute(CHECK_USER.getText(),  true);
        model.addAttribute(USER_VO.getText(), session.getAttribute(USER_VO.getText()));
        return MY_PAGE.getPath();
    }
    private void setPageAttr(Model model, EPageOptions pageOption, Boolean stepStatus){
        switch (pageOption){
            case PAGE_MODIFY:
                model.addAttribute(PAGE.getText(), PAGE_MODIFY.getText());
                if(stepStatus){
                    model.addAttribute(TITLE.getText(), TITLE_CHECK_MODIFY.getText());
                    model.addAttribute(TEXT.getText(), TEXT_CHECK_MODIFY.getText());
                }else{
                    model.addAttribute(TITLE.getText(), TITLE_RESULT_MODIFY.getText());
                    model.addAttribute(TEXT.getText(), TEXT_RESULT_MODIFY.getText());
                }
                break;
            case PAGE_DROP_USER:
                model.addAttribute(PAGE.getText(), PAGE_DROP_USER.getText());
                if(stepStatus) {
                    model.addAttribute(TITLE.getText(), TITLE_CHECK_DROP_USER.getText());
                    model.addAttribute(TEXT.getText(), TEXT_CHECK_DROP_USER.getText());
                }else{
                    model.addAttribute(TITLE.getText(), TITLE_RESULT_DROP_USER.getText());
                    model.addAttribute(TEXT.getText(), TEXT_RESULT_DROP_USER.getText());
                }
                break;
            case PAGE_ONE_TO_ONE_ASK:
                model.addAttribute(PAGE.getText(), PAGE_ONE_TO_ONE_ASK.getText());
                model.addAttribute(TITLE.getText(), TITLE_RESULT_ONE_TO_ONE_ASK.getText());
                model.addAttribute(TEXT.getText(), TEXT_RESULT_ONE_TO_ONE_ASK.getText());
                break;
            case PAGE_DELETE_ONE_TO_ONE_ASK:
                model.addAttribute(PAGE.getText(), PAGE_DELETE_ONE_TO_ONE_ASK.getText());
                model.addAttribute(TITLE.getText(), TITLE_RESULT_DELETE_ONE_TO_ONE_ASK.getText());
                model.addAttribute(TEXT.getText(), TEXT_RESULT_DELETE_ONE_TO_ONE_ASK.getText());
                break;
            default:break;
        }
    }
    // 회원정보 수정 : 비밀번호 재확인
    @RequestMapping("/reCheckPassword")
    public String reCheckPassword(Model model, HttpSession session, @RequestParam("page") String page){
        model.addAttribute(USER_VO.getText(), session.getAttribute(USER_VO.getText()));
        model.addAttribute(CHECK_USER.getText(), true);

        if(page.equals(PAGE_MODIFY.getText())) this.setPageAttr(model,PAGE_MODIFY,true);
        else if(page.equals(PAGE_DROP_USER.getText())) this.setPageAttr(model,PAGE_DROP_USER,true);

        return RE_CHECK_PASSWORD.getPath();
    }
    // 비밀번호 확인 -> 확인 시 : 회원정보 수정페이지 | 틀릴 시 : 비밀번호 재확인
    @RequestMapping("/confirmPassword")
    public String confirmPassword(Model model, HttpServletRequest request) throws Exception {
        String page = request.getParameter(PAGE.getText());

        String userID = request.getParameter(USER_ID.getText());
        String userPassword = request.getParameter(USER_PASSWORD.getText());
        UserVO userVO = signService.checkSign(userID, userPassword);
        model.addAttribute(USER_VO.getText(), request.getAttribute(USER_VO.getText()));
        String path = RE_CHECK_PASSWORD.getPath();
        if (userVO == null) {
            model.addAttribute(CHECK_USER.getText(), false);
            if(page.equals(PAGE_MODIFY.getText())) this.setPageAttr(model,PAGE_MODIFY,true);
            else if(page.equals(PAGE_DROP_USER.getText())) this.setPageAttr(model,PAGE_DROP_USER,true);
        } else {
            if(page.equals(PAGE_MODIFY.getText())){
                model.addAttribute(PAGE.getText(), PAGE_MODIFY.getText());
                path = MODIFY_USER_INFO.getPath();
            }else if(page.equals(PAGE_DROP_USER.getText())){
                model.addAttribute(PAGE.getText(), PAGE_DROP_USER.getText());
                path = FINALLY_ASK_DROP_USER.getPath();
            }
        }
        return path;
    }

    private UserVO checkUserData(UserVO changeData, UserVO previousData) {
        if (changeData.getUserPassword().isEmpty()) {
            changeData.setUserPassword(previousData.getUserPassword());
        }
        if (changeData.getUserNickname().isEmpty()) {
            changeData.setUserNickname(previousData.getUserNickname());
        }
        if (changeData.getUserEmail().isEmpty()) {
            changeData.setUserEmail(previousData.getUserEmail());
        }
        return changeData;
    }

    // 회원정보 수정 결과 페이지
    @RequestMapping("/resultMent")
    public String resultMent(@RequestParam("page") String page,
                             @ModelAttribute UserVO userVO,
                             @ModelAttribute OneToOneAskVO oneToOneAskVO,
                             Model model, HttpSession session) throws Exception {
        UserVO session_UserVO = (UserVO) session.getAttribute(USER_VO.getText());
        if(page.equals(PAGE_MODIFY.getText())){
            UserVO previousUser = myPageService.getUserInfo(userVO.getUserID());
            myPageService.modifyUserInfo(this.checkUserData(userVO, previousUser));
            model.addAttribute(USER_VO.getText(), session.getAttribute(USER_VO.getText()));
            this.setPageAttr(model,PAGE_MODIFY,false);
        }else if(page.equals(PAGE_DROP_USER.getText())){
            this.setPageAttr(model,PAGE_DROP_USER,false);
            model.addAttribute(USER_VO.getText(), session.getAttribute(USER_VO.getText()));
            s3Uploader.delete(IMAGE_DIR.getText()+session_UserVO.getUserImage()); // 회원 탈퇴시 S3에 있는 이미지도 삭제
            myPageService.dropUser(session_UserVO.getUserID());
        }else if(page.equals(PAGE_ONE_TO_ONE_ASK.getText())){
            myPageService.addOneToOneAsk(oneToOneAskVO, session_UserVO.getUserNO());
            this.setPageAttr(model,PAGE_ONE_TO_ONE_ASK,false);
            model.addAttribute(USER_VO.getText(), session.getAttribute(USER_VO.getText()));
        }else if(page.equals(PAGE_DELETE_ONE_TO_ONE_ASK.getText())){
            int oneToOneAskNO = oneToOneAskVO.getOneToOneAskNO();
            myPageService.deleteOneToOneAsk(oneToOneAskNO);
            this.setPageAttr(model,PAGE_DELETE_ONE_TO_ONE_ASK,false);
            model.addAttribute(USER_VO.getText(), session.getAttribute(USER_VO.getText()));
        }
        return RESULT_MENT.getPath();
    }


    @RequestMapping("/oneToOneAsk")
    private String oneToOneAsk(Model model, HttpSession session) throws Exception {
        UserVO session_UserVO = (UserVO) session.getAttribute(USER_VO.getText());
        int userNO = session_UserVO.getUserNO();

        ArrayList<OneToOneAskVO> oneToOneAskVOList = myPageService.getOneToOneAskVOList(userNO);
        model.addAttribute(ONE_TO_ONE_ASK_VO_LIST.getText(), oneToOneAskVOList);
        return ONE_TO_ONE_ASK.getPath();
    }

    @RequestMapping("/showOneToOneAsk")
    private String showOneToOneAsk(Model model, HttpServletRequest request) throws Exception {
        OneToOneAskVO oneToOneAskVO = myPageService.findOneToOneAskVO(Integer.parseInt(request.getParameter(ONE_TO_ONE_ASK_NO.getText())));
        model.addAttribute(ONE_TO_ONE_ASK_VO.getText(), oneToOneAskVO);
        return SHOW_ONE_TO_ONE_ASK.getPath();

    }

    @RequestMapping("/writeOneToOneAsk")
    private String writeOneToOneAsk(Model model){
        model.addAttribute(ONE_TO_ONE_ASK_CATEGORY.getText(), OneToOneAskCategory.values());
        model.addAttribute(PAGE.getText(), PAGE_ONE_TO_ONE_ASK.getText());
        return WRITE_ONE_TO_ONE_ASK.getPath();
    }

    @RequestMapping(value = "modifyUserImage")
    public String modifyUserImage(HttpSession session, @RequestParam("fileName") MultipartFile mFile, Model model) throws Exception {
        UserVO userVO = (UserVO) session.getAttribute(USER_VO.getText());
        if(userVO.getUserImage() != null) s3Uploader.delete(IMAGE_DIR.getText()+userVO.getUserImage());
        String saveName = s3Uploader.uploadProfileImg(IMAGE_DIR.getText(), userVO.getUserID(), mFile.getOriginalFilename(), mFile.getBytes());
        myPageService.modifyUserImg(saveName,userVO.getUserID());

        userVO.setUserImage(saveName);
        model.addAttribute(USER_VO.getText(), userVO);
        return REDIRECT_MY_PAGE.getText();
    }


    @GetMapping("/manageReview")
    public String manageReview(Model model, HttpSession session,HttpServletRequest request) throws Exception{
        UserVO userVO = (UserVO)session.getAttribute(USER_VO.getText());
        String manageReviewCategory = String.valueOf(request.getParameter(MANAGE_REVIEW_CATEGORY.getText()));
        String[]  myReviewCheckbox=request.getParameterValues(MY_REVIEW_CHECK_BOX.getText());

        if(myReviewCheckbox !=null){
            int[] reviewNO_OR_reviewReplyNOList =  Arrays.stream(myReviewCheckbox).mapToInt(Integer::parseInt).toArray();
            reviewService.deleteReviewList(reviewNO_OR_reviewReplyNOList,manageReviewCategory);
        }

        // set myReviewList & Paging
        this.setMyReviewListPaging(model, this.getSelectePage(request), userVO.getUserNO(),manageReviewCategory);
        return MANAGE_REVIEW.getPath();
    }

    @GetMapping("/manageSchedule")
    public String manageSchedule(Model model, HttpSession session,HttpServletRequest request,CalendarDTO calendarDTO) throws Exception{
        UserVO userVO = (UserVO)session.getAttribute(USER_VO.getText());
        String manageScheduleCategory = String.valueOf(request.getParameter(MANAGE_SCHEDULE_CATEGORY.getText()));
        String[] myScheduleCheckbox=request.getParameterValues(MY_SCHEDULE_CHECK_BOX.getText());

        if(myScheduleCheckbox !=null){
            int[] scheduleNO_OR_scheduleReplyNOList = Arrays.stream(myScheduleCheckbox).mapToInt(Integer::parseInt).toArray();
            scheduleService.deleteScheduleList(scheduleNO_OR_scheduleReplyNOList,manageScheduleCategory);
        }
        // set myScheduleList & Paging
        List<HashMap<String, Object>> myScheduleList = super.setMyScheduleListPaging(model,this.getSelectePage(request),userVO.getUserNO(),manageScheduleCategory);
        // Set CalendarDTO
        super.setCalendarDTOForScheduleList(model, myScheduleList, calendarDTO);

        return MANAGE_SCHEDULE.getPath();
    }

}
