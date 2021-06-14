package com.liveamonth.liveamonth.controller.reviewController;



import com.liveamonth.liveamonth.entity.vo.ReviewLikeVO;
import com.liveamonth.liveamonth.entity.vo.ReviewReplyVO;
import com.liveamonth.liveamonth.entity.vo.UserVO;
import com.liveamonth.liveamonth.model.service.reviewService.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Locale;

import static com.liveamonth.liveamonth.constants.ControllerPathConstants.EReviewPath.REDIRECT_REVIEW_CONTENT;
import static com.liveamonth.liveamonth.constants.EntityConstants.EReview.REVIEW_NO;
import static com.liveamonth.liveamonth.constants.EntityConstants.EReviewReply.REVIEW_REPLY_NO;
import static com.liveamonth.liveamonth.constants.EntityConstants.EUser.USER_VO;
import static com.liveamonth.liveamonth.constants.LogicConstants.EReviewMessage.*;

@Controller
public class ReviewReplyController {
    @Autowired
    private  ReviewService reviewService;

    @ResponseBody
    @RequestMapping(value = "/updateReviewLike", method = RequestMethod.GET)
    public HashMap<String, Integer> getScheduleLikeAndCount(@ModelAttribute ReviewLikeVO reviewLikeVO){
        try {
            return reviewService.getReviewLikeCountAndStatus(reviewLikeVO);
        } catch (Exception e) {
            System.err.println(REVIEW_LIKE_TRANS_FAIL_MESSAGE.getText() + e);
        }
        return null;
    }

    @RequestMapping(value = "addReviewReply")
    public String addScheduleReply(ReviewReplyVO reviewReplyVO, HttpServletRequest request, RedirectAttributes rttr){
        HttpSession session = request.getSession();
        UserVO session_UserVO = (UserVO) session.getAttribute(USER_VO.getText());
        int userNO = session_UserVO.getUserNO();

        long systemTime = System.currentTimeMillis();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
        String dTime = formatter.format(systemTime);
        reviewReplyVO.setReviewReplyDate(dTime);

        reviewReplyVO.setUserNO(userNO);
        try {
            reviewService.addReviewReply(reviewReplyVO);
        } catch (Exception e) {
            System.err.println(REVIEWREPLY_ADD_FAIL_MESSAGE.getText() + e);
        }
        rttr.addAttribute(REVIEW_NO.getText(), reviewReplyVO.getReviewNO());
        return REDIRECT_REVIEW_CONTENT.getRedirectPath();
    }

    @RequestMapping("deleteReviewReply")
    public String deleteScheduleReply(HttpServletRequest request, RedirectAttributes rttr){
        int reviewReplyNO = Integer.parseInt(String.valueOf(request.getParameter(REVIEW_REPLY_NO.getText())));
        int reviewNO = Integer.parseInt(String.valueOf(request.getParameter(REVIEW_NO.getText())));

        try {
            reviewService.deleteReviewReply(reviewReplyNO);
        } catch (Exception e) {
            System.err.println(REVIEWREPLY_MODIFY_FAIL_MESSAGE.getText() + e);
        }
        rttr.addAttribute(REVIEW_NO.getText(), reviewNO);
        return REDIRECT_REVIEW_CONTENT.getRedirectPath();
    }

    @RequestMapping("modifyReviewReply")
    public String modifyScheduleReply(RedirectAttributes rttr, ReviewReplyVO reviewReplyVO){
        try {
            reviewService.modifyReviewReply(reviewReplyVO);
        } catch (Exception e) {
            System.err.println(REVIEWREPLY_DELETE_FAIL_MESSAGE.getText() + e);
        }
        rttr.addAttribute(REVIEW_NO.getText(), reviewReplyVO.getReviewNO());
        return REDIRECT_REVIEW_CONTENT.getRedirectPath();
    }

}
