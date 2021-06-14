package com.liveamonth.liveamonth.model.mapper.reviewMapper;

import com.liveamonth.liveamonth.entity.vo.ReviewLikeVO;
import com.liveamonth.liveamonth.entity.vo.ReviewReplyVO;
import com.liveamonth.liveamonth.entity.vo.ReviewVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository
@Mapper
public interface ReviewMapper {
    // Review - select
    List<HashMap<String, Object>> getPopularReviewListForMain() throws Exception;
    ArrayList<HashMap<String, Object>> getDefaultReviewList(String category) throws Exception;
    ArrayList<HashMap<String, Object>> getCategoryReviewList(HashMap<String, Object> CategoryAndPage) throws Exception;
    ArrayList<HashMap<String, Object>> getSearchReviewList(HashMap<String, Object> searchAndPage) throws Exception;
    ArrayList<HashMap<String, Object>> getMyReviewList(HashMap<String, Object> myReviewAndPage)throws Exception;
    ReviewVO getReviewVO(int reviewNO) throws Exception;
    int getReviewLikeCount(int reviewNO) throws Exception;
    int getReviewLikeStatus(ReviewLikeVO reviewLikeVO);

    // Review - insert, update, delete
    int addReview(ReviewVO reviewVO) throws Exception;
    void increaseReviewViewCount(int reviewNO) throws Exception;
    void modifyReview(ReviewVO reviewVO) throws Exception;
    void deleteReview(int reviewNO) throws Exception;
    void deleteReviewList(HashMap<String, Object> listAndCategory)throws Exception;

    // ReviewReply - select, insert, update, delete
    ArrayList<HashMap<String, Object>> getReviewReplyList(HashMap<String, Integer> reviewNOAndPage) throws Exception;
    int getReviewReplyCount(int reviewNO) throws Exception;
    int addReviewReply(ReviewReplyVO reviewReplyVO) throws Exception;
    void modifyReviewReply(ReviewReplyVO reviewReplyVO) throws Exception;
    void deleteReviewReply(int reviewReplyNO) throws Exception;

    // Be used in ReviewService
    int getReviewWriterNO(int reviewNO) throws Exception;
    void deleteReviewLike(ReviewLikeVO reviewLikeVO) throws Exception;
    void addReviewLike(ReviewLikeVO reviewLikeVO) throws Exception;
    int getReviewListCount(String category) throws Exception;
    int getSearchReviewListCount(HashMap<String, Object> searchAndPage) throws Exception;
    int getMyReviewListCount(HashMap<String, Object> myReviewAndPage) throws Exception;

    // Be used in NoticeService
    ReviewReplyVO getReviewReply(int reviewReplyNO) throws Exception;
}
