package com.liveamonth.liveamonth.model.service.reviewService;

import com.liveamonth.liveamonth.entity.dto.PagingDTO;
import com.liveamonth.liveamonth.entity.vo.ReviewLikeVO;
import com.liveamonth.liveamonth.entity.vo.ReviewReplyVO;
import com.liveamonth.liveamonth.entity.vo.ReviewVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface ReviewService {
    // Review - select
    List<HashMap<String, Object>> getPopularReviewListForMain() throws Exception;
    ArrayList<HashMap<String, Object>> getDefaultReviewList(String category) throws Exception;
    ArrayList<HashMap<String, Object>> getSearchReviewList(int selectPage, String search, String searchDate, String searchCategory, String searchDetail) throws Exception;
    ArrayList<HashMap<String, Object>> getCategoryReviewList(String category, int selectPage, String orderBy, String descAsc) throws Exception;
    ArrayList<HashMap<String, Object>> getMyReviewList(int selectPage, int userNO, String manageReviewCategory) throws Exception;
    ReviewVO getReviewVO(int reviewNO) throws Exception;
    int getReviewLikeCount(int reviewNO) throws Exception;
    int getReviewLikeStatus(ReviewLikeVO reviewLikeVO) throws Exception;

    // Review - insert, update, delete
    int addReview(ReviewVO reviewVO) throws Exception;
    void increaseReviewViewCount(int reviewNO) throws Exception;
    void modifyReview(ReviewVO reviewVO) throws Exception;
    void deleteReview(int reviewNO) throws Exception;
    void deleteReviewList(int[] reviewNO_OR_reviewReplyNOList, String manageReviewCategory) throws Exception;

    // Review Reply - select, insert, update, delete
    ArrayList<HashMap<String, Object>> getReviewReplyList(int reviewNO, int selectPage) throws Exception;
    void addReviewReply(ReviewReplyVO reviewReplyVO) throws Exception;
    void modifyReviewReply(ReviewReplyVO reviewReplyVO) throws Exception;
    void deleteReviewReply(int reviewReplyNO) throws Exception;

    /*
     * use getReviewLikeStatus(), getReviewWriterNO(), addReviewLike(), deleteReviewLike(), getReviewLikeCount()
     * Autowired : NoticeService - addNotice(), addRLNotice(),
     */
    HashMap<String, Integer> getReviewLikeCountAndStatus(ReviewLikeVO reviewLikeVO) throws Exception;
    // use getSearchReviewListCount()
    PagingDTO showSearchPaging(int selectPage, String search, String searchDate, String searchCategory, String searchDetail) throws Exception;
    // use getMyReviewListCount()
    PagingDTO showMyReviewPaging(int selectPage, String manageReviewCategory, int userNO) throws Exception;
    // use getReviewListCount()
    PagingDTO showPaging(int selectPage, String category) throws Exception;
    // use getReviewReplyCount()
    PagingDTO showPaging(int selectPage, int reviewNO) throws Exception;
    // inner Method
    String orderByCategoryReview(String orderBy, String clickPage, String dateDescAsc, String likeDescAsc, String viewDescAsc);
}
