package com.liveamonth.liveamonth.controller.reviewController;

import com.liveamonth.liveamonth.constants.EntityConstants;
import com.liveamonth.liveamonth.controller.SuperController;
import com.liveamonth.liveamonth.entity.dto.PagingDTO;
import com.liveamonth.liveamonth.entity.vo.ReviewLikeVO;
import com.liveamonth.liveamonth.entity.vo.ReviewVO;
import com.liveamonth.liveamonth.entity.vo.UserVO;
import com.liveamonth.liveamonth.model.service.reviewService.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import static com.liveamonth.liveamonth.constants.ControllerPathConstants.EReviewPath.*;
import static com.liveamonth.liveamonth.constants.ControllerPathConstants.ETemplatePath.REVIEW;
import static com.liveamonth.liveamonth.constants.EntityConstants.EReview.REVIEW_NO;
import static com.liveamonth.liveamonth.constants.EntityConstants.EReview.REVIEW_VO;
import static com.liveamonth.liveamonth.constants.EntityConstants.EReviewCategoryName;
import static com.liveamonth.liveamonth.constants.EntityConstants.EUser.USER_VO;
import static com.liveamonth.liveamonth.constants.LogicConstants.EPaging.*;
import static com.liveamonth.liveamonth.constants.LogicConstants.EReview.REVIEW_LIKE_COUNT;
import static com.liveamonth.liveamonth.constants.LogicConstants.EReview.REVIEW_REPLY_LIST;
import static com.liveamonth.liveamonth.constants.LogicConstants.EReviewAttribute.REVIEW_CATEGORY_LIST;
import static com.liveamonth.liveamonth.constants.LogicConstants.EReviewAttribute.*;
import static com.liveamonth.liveamonth.constants.LogicConstants.EReviewMessage.*;

@Controller
public class ReviewController extends SuperController {
    @Autowired
    private ReviewService reviewService;

    @GetMapping("/review")
    public String showDefaultReviewPage(Model model) throws Exception {
        this.setDefaultReviewAttribute(model);
        return REVIEW.getPath();
    }
    public void setDefaultReviewAttribute(Model model) throws Exception{
        ArrayList<HashMap<String, Object>> allReviewList = reviewService.getDefaultReviewList(ALL.getText());
        ArrayList<HashMap<String, Object>> freeReviewList = reviewService.getDefaultReviewList(FREE.getText());
        ArrayList<HashMap<String, Object>> popularReviewList = reviewService.getDefaultReviewList(POPULAR.getText());
        model.addAttribute(ALL_REVIEW_LIST.getText(), allReviewList);
        model.addAttribute(FREE_REVIEW_LIST.getText(), freeReviewList);
        model.addAttribute(POPULAR_REVIEW_LIST.getText(), popularReviewList);
        model.addAttribute(REVIEW_CATEGORY_LIST.getText(), EReviewCategoryName.values());
    }
    @GetMapping("/categoryReviewPage")
    public String showCategoryReviewPage(Model model, HttpServletRequest request) throws Exception {
        String category = String.valueOf(request.getParameter(CATEGORY.getText()));
        String clickPage = String.valueOf(request.getParameter( CLICK_PAGE.getText()));
        //정렬 기능
        String orderBy = String.valueOf(request.getParameter(ORDER_BY.getText()));
        String dateDescAsc =String.valueOf(request.getParameter( DATE_DESC_ASC.getText()));
        String likeDescAsc = String.valueOf(request.getParameter(LIKE_DESC_ASC.getText()));
        String viewDescAsc = String.valueOf(request.getParameter(VIEW_DESC_ASC.getText()));

        String descAsc = reviewService.orderByCategoryReview(orderBy,clickPage,dateDescAsc, likeDescAsc,viewDescAsc);
        switch (orderBy) {
            case "dateOrderBy":
                dateDescAsc = descAsc;
                break;
            case "likeOrderBy":
                likeDescAsc = descAsc;
                break;
            case "viewOrderBy":
                viewDescAsc = descAsc;
                break;
            default:
                break;
        }
        int selectPage = super.getSelectePage(request);
        ArrayList<HashMap<String, Object>> reviewList = reviewService.getCategoryReviewList(category, selectPage,orderBy,descAsc);
        PagingDTO paging = reviewService.showPaging(selectPage, category);
        model.addAttribute(SELECT_PAGE.getText(),selectPage);
        model.addAttribute(ORDER_BY.getText(),orderBy);
        model.addAttribute(DATE_DESC_ASC.getText(),dateDescAsc);
        model.addAttribute(LIKE_DESC_ASC.getText(),likeDescAsc);
        model.addAttribute(VIEW_DESC_ASC.getText(),viewDescAsc);
        model.addAttribute(PAIGING.getText(), paging);
        model.addAttribute(REVIEW_LIST.getText(), reviewList);
        model.addAttribute(CATEGORY.getText(), category);
        model.addAttribute(REVIEW_CATEGORY_LIST.getText(), EReviewCategoryName.values());
        model.addAttribute(SELECTED_PAGE.getText(),selectPage);
        return CATEGORY_REVIEW_PAGE.getPath();
    }


    @GetMapping("/searchReviewPage")
    public String showSearchReviewPage(Model model, HttpServletRequest request) throws Exception {
        String search = String.valueOf(request.getParameter(SEARCH.getText()));

        String searchDate = String.valueOf(request.getParameter(SEARCH_DATE.getText()));
        String searchCategory = String.valueOf(request.getParameter(SEARCH_CATEGORY.getText()));
        String searchDetail = String.valueOf(request.getParameter(SEARCH_DETAIL.getText()));

        int selectPage = super.getSelectePage(request);
        PagingDTO paging = reviewService.showSearchPaging(selectPage, search,searchDate,searchCategory,searchDetail);
        ArrayList<HashMap<String, Object>> reviewList = reviewService.getSearchReviewList(selectPage, search,searchDate,searchCategory,searchDetail);
        model.addAttribute(REVIEW_LIST.getText(), reviewList);
        model.addAttribute(SEARCH.getText(), search);
        model.addAttribute(REVIEW_CATEGORY_LIST.getText(), EReviewCategoryName.values());
        model.addAttribute(REVIEW_SEARCH_DATE.getText(), EntityConstants.EReviewSearchDate.values());
        model.addAttribute(REVIEW_SEARCH_DETAIL.getText(), EntityConstants.EReviewSearchDetail.values());
        model.addAttribute(PAIGING.getText(), paging);
        model.addAttribute(SELECTED_DATE.getText(),searchDate);
        model.addAttribute(SELECTED_CATEGORY.getText(),searchCategory);
        model.addAttribute(SELECTED_DETAIL.getText(),searchDetail);
        return  SEARCH_REVIEW_PAGE.getPath();
    }

    @GetMapping("/reviewWrite")
    public String reviewWrite(Model model, HttpServletRequest request) throws Exception{
        int reviewNO;
        if (request.getParameter(REVIEW_NO.getText()) != null) {
            reviewNO = Integer.parseInt(request.getParameter(REVIEW_NO.getText()));
            ReviewVO reviewVO;
            try {
                reviewVO = reviewService.getReviewVO(reviewNO);
                model.addAttribute(REVIEW_VO.getText(), reviewVO);
            } catch (Exception e) {
                System.err.println(REVIEW_LOAD_FAIL_MESSAGE.getText() + e);
                this.setDefaultReviewAttribute(model);
                return DEFAULT_REVIEW_PAGE.getPath();
            }
        }
        model.addAttribute(REVIEW_CATEGORY_LIST.getText(), EReviewCategoryName.values());
        return REVIEW_WRITER.getPath();
    }

    @RequestMapping(value = "addReview")
    public String addReview(HttpServletRequest request, ReviewVO reviewVO, RedirectAttributes rttr, Model model) throws Exception{
        long systemTime = System.currentTimeMillis();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
        String dTime = formatter.format(systemTime);
        reviewVO.setReviewDate(dTime);

        HttpSession session = request.getSession();
        UserVO session_UserVO = (UserVO) session.getAttribute(USER_VO.getText());
        reviewVO.setUserNO(session_UserVO.getUserNO());

        int reviewNO;
        try {
            reviewNO = reviewService.addReview(reviewVO);
        } catch (Exception e) {
            System.err.println(REVIEW_ADD_FAIL_MESSAGE.getText() + e);
            this.setDefaultReviewAttribute(model);
            return DEFAULT_REVIEW_PAGE.getPath();
        }
        rttr.addAttribute(REVIEW_NO.getText(), reviewNO);
        return REDIRECT_REVIEW_CONTENT.getRedirectPath();
    }

    @RequestMapping(value = "modifyReview")
    public String modifyReview(HttpServletRequest request, ReviewVO reviewVO, RedirectAttributes rttr) {
        int reviewNO = Integer.parseInt(request.getParameter(REVIEW_NO.getText()));
        reviewVO.setReviewNO(reviewNO);
        try {
            reviewService.modifyReview(reviewVO);
        } catch (Exception e) {
            System.err.println(REVIEW_MODIFY_FAIL_MESSAGE.getText() + e);
        }
        rttr.addAttribute(REVIEW_NO.getText(), reviewNO);
        return REDIRECT_REVIEW_CONTENT.getRedirectPath();
    }

    @RequestMapping(value = "deleteReview")
    public String deleteReview(HttpServletRequest request, RedirectAttributes rttr, Model model) throws Exception {
        int reviewNO = Integer.parseInt(String.valueOf(request.getParameter(REVIEW_NO.getText())));
        try {
            reviewService.deleteReview(reviewNO);
        } catch (Exception e) {
            System.err.println(REVIEW_DELETE_FAIL_MESSAGE.getText() + e);
            rttr.addAttribute(REVIEW_NO.getText(), reviewNO);
            return REDIRECT_REVIEW_CONTENT.getPath();
        }
        this.setDefaultReviewAttribute(model);
        return DEFAULT_REVIEW_PAGE.getPath();
    }

    @GetMapping("getReview")
    public String getReview(Model model, HttpServletRequest request) throws Exception{
        int reviewNO = Integer.parseInt(String.valueOf(request.getParameter(REVIEW_NO.getText())));
        HttpSession session = request.getSession();
        UserVO session_UserVO = (UserVO) session.getAttribute(USER_VO.getText());

        ReviewVO reviewVO;
        try {
            reviewVO = reviewService.getReviewVO(reviewNO);
            model.addAttribute(REVIEW_VO.getText(), reviewVO);
        } catch (Exception e) {
            System.err.println(REVIEW_LOAD_FAIL_MESSAGE.getText() + e);
            this.setDefaultReviewAttribute(model);
            return DEFAULT_REVIEW_PAGE.getPath();
        }

        try {
            reviewService.increaseReviewViewCount(reviewNO);
        } catch (Exception e) {
            System.err.println(REVIEW_VIEWCOUNT_INCREASE_FAIL_MESSAGE.getText() + e);
            this.setDefaultReviewAttribute(model);
            return DEFAULT_REVIEW_PAGE.getPath();
        }

        int selectPage = super.getSelectePage(request);
        try {
            ArrayList<HashMap<String, Object>> reviewReplyList = reviewService.getReviewReplyList(reviewNO, selectPage);
            model.addAttribute(REVIEW_REPLY_LIST.getText(), reviewReplyList);
        } catch (Exception e) {
            System.err.println(REVIEW_LOAD_FAIL_MESSAGE.getText() + e);
            this.setDefaultReviewAttribute(model);
            return DEFAULT_REVIEW_PAGE.getPath();
        }

        PagingDTO paging;
        try {
            paging = reviewService.showPaging(selectPage, reviewNO);
            model.addAttribute(PAIGING.getText(), paging);
        } catch (Exception e) {
            System.err.println(REVIEWREPLY_PAGING_FAIL_MESSAGE.getText() + e);
            this.setDefaultReviewAttribute(model);
            return DEFAULT_REVIEW_PAGE.getPath();
        }

        try {
            int likeCount = reviewService.getReviewLikeCount(reviewNO);
            model.addAttribute(REVIEW_LIKE_COUNT.getText(), likeCount);
        } catch (Exception e) {
            System.err.println(REVIEW_LIKECOUNT_LOAD_FAIL_MESSAGE.getText() + e);
            this.setDefaultReviewAttribute(model);
            return DEFAULT_REVIEW_PAGE.getPath();
        }

        if (session_UserVO != null) {
            ReviewLikeVO reviewLikeVO = new ReviewLikeVO();
            reviewLikeVO.setReviewNO(reviewNO);
            reviewLikeVO.setReviewLikeUserNO(session_UserVO.getUserNO());
            try {
                int status = reviewService.getReviewLikeStatus(reviewLikeVO);
                model.addAttribute(LIKE_STATUS.getText(), status);
            } catch (Exception e) {
                System.err.println(REVIEW_LIKESTATUS_LOAD_FAIL_MESSAGE.getText() + e);
                this.setDefaultReviewAttribute(model);
                return DEFAULT_REVIEW_PAGE.getPath();
            }
        }
        model.addAttribute(REVIEW_CATEGORY_LIST.getText(), EReviewCategoryName.values());
        return REVIEW_CONTENT.getPath();
    }
}
