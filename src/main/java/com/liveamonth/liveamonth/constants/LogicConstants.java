package com.liveamonth.liveamonth.constants;

import static com.liveamonth.liveamonth.constants.EntityConstants.SITE_URL;

public class LogicConstants {
    /*
     * Controller 클래스에서 사용되는 Static & model.attribute 상수
     * -> VO와 관련된 Enum은 모두 EntityConstants로
     */
    public LogicConstants() {}

    /*
     *  CityController Logic Constants
     */
    public enum ECityInfoAttributes {
        ALL("all"),
        PAGE("page"),
        CITY_NAME("cityName"),
        SELECTED_CITY_NAME("selectedCityName"),
        CITY_INTRO("cityIntro"),
        CITY_INTRO_LIST("cityIntroList"),
        RANDOM_CITY_INTRO_LIST("randomCityIntroList"),
        SELECTED_CITY_INFOS("selectedCityInfos"),
        CITY_VIEW_LIST("cityViewList"),
        CITY_WEATHER_LIST("cityWeatherList"),
        CITY_TRANSPORT_LIST("cityTransportList"),
        CITY_FOOD_LIST("cityFoodList"),
        CURRENT_MONTH_TEMP_LIST("currentMonthTempList"),
        CITY_TRANSPORT_GRADE_LIST("cityTransportGradeList"),
        CITY_NAME_LIST("cityNameList");
        private final String text;
        ECityInfoAttributes(String text) {this.text = text;}
        public String getText() {return this.text;}
    }

    /*
     *  CustomerCenterController Logic Constants
     */
    public enum ECustomerCenterAttributes {
        CUSTOMER_CENTER_MENUS("customerCenterMenus");
        private final String text;
        ECustomerCenterAttributes(String text) {this.text = text;}
        public String getText() {return this.text;}
    }

    /*
     *  MyPageController Logic Constants
     */
    public enum EMyPageAttributes {
        IMAGE_DIR("img/user/"),
        CHECK_USER("checkUser"),
        PAGE("page"),
        TITLE("title"),
        TEXT("text"),
        MY_SCHEDULE_LIST("myScheduleList"),
        MY_REVIEW_LIST("myReviewList"),
        MANAGE_REVIEW_CATEGORY("manageReviewCategory"),
        MY_REVIEW_CHECK_BOX("myReviewCheckbox"),
        MANAGE_SCHEDULE_CATEGORY("manageScheduleCategory"),
        MY_SCHEDULE_CHECK_BOX("myScheduleCheckbox"),
        TITLE_RESULT_MODIFY("회원정보 수정완료"),
        TITLE_RESULT_DROP_USER("회원탈퇴 완료"),
        TITLE_CHECK_MODIFY("회원정보 수정 : 비밀번호 재확인"),
        TITLE_CHECK_DROP_USER("회원 탈퇴 : 비밀번호 재확인"),
        TITLE_RESULT_ONE_TO_ONE_ASK("1:1문의 완료"),
        TITLE_RESULT_DELETE_ONE_TO_ONE_ASK("문의내용 삭제 완료"),
        TEXT_RESULT_MODIFY("회원정보 수정이 완료되었습니다."),
        TEXT_RESULT_DROP_USER("그동안 저희 서비스를 이용해 주셔서 진심으로 감사합니다."),
        TEXT_CHECK_MODIFY("개인정보 변경에서는 비밀번호 변경, 이메일 변경 등의 정보를 확인, 수정하실 수 있습니다."),
        TEXT_CHECK_DROP_USER("회원 해지시, 회원님의 정보는 삭제되며 복구 불가능합니다."),
        TEXT_RESULT_ONE_TO_ONE_ASK("문의내용을 확인한 뒤 신속한 답변드리겠습니다. 감사합니다."),
        TEXT_RESULT_DELETE_ONE_TO_ONE_ASK("고객님을 위해 항상 최선을 다하겠습니다. 감사합니다.");
        private final String text;
        EMyPageAttributes(String text) {this.text = text;}
        public String getText() {return this.text;}
    }
    public enum EPageOptions{
        PAGE_MODIFY("modify"),
        PAGE_DROP_USER("dropUser"),
        PAGE_ONE_TO_ONE_ASK("oneToOneAsk"),
        PAGE_DELETE_ONE_TO_ONE_ASK("deleteOneToOneAsk");
        private final String text;
        EPageOptions(String text) {this.text = text;}
        public String getText() {return this.text;}
    }

    /*
     *  NoticeController Logic Constants
     */
    public enum ENotice{
        NOTICE_ERROR_MESSAGE("noticeList 불러오기 실패 : "),
        NOTICE_LIST("noticeList"),
        NOTICE_COUNT("noticeCount"),
        USER_DIR("user/"),
        IMG_URL("imgURL");
        private final String text;
        ENotice(String text){this.text = text;}
        public String getText() {return this.text;}
    }

    /*
     *  ReviewController Logic Constants
     */
    public enum EReviewAttribute{
        REVIEW_TYPE_LIST("reviewTypeList"),
        REVIEW_NO_OR_REPLY_NO_LIST("reviewNO_OR_reviewReplyNOList"),
        REVIEW_PLACE_LIST("reviewPlaceList"),
        REVIEW_CATEGORY_LIST("reviewCategoryList"),
        REVIEW_SEARCH_DATE("reviewSearchDate"),
        REVIEW_SEARCH_DETAIL("reviewSearchDetail"),
        ALL_REVIEW_LIST("AllReviewList"),
        POPULAR_REVIEW_LIST("popularReviewList"),
        FREE_REVIEW_LIST("freeReviewList"),
        REVIEW_LIST("reviewList"),

        ALL("all"),
        FREE("free"),
        POPULAR("popular"),
        CATEGORY("category"),
        CLICK_PAGE("clickPage"),
        SELECT_PAGE("selectPage"),
        DESC_ASC("descAsc"),

        ORDER_BY("orderBy"),
        DATE_ORDER_BY("dateOrderBy"),
        LIKE_ORDER_BY("likeOrderBy"),
        VIEW_ORDER_BY("viewOrderBy"),

        DATE_DESC_ASC("dateDescAsc"),
        LIKE_DESC_ASC("likeDescAsc"),
        VIEW_DESC_ASC("viewDescAsc"),

        SEARCH("search"),
        SEARCH_DATE("searchDate"),
        SEARCH_CATEGORY("searchCategory"),
        SEARCH_DETAIL("searchDetail"),

        SELECTED_DATE("selectedDate"),
        SELECTED_CATEGORY("selectedCategory"),
        SELECTED_DETAIL("selectedDetail"),

        NULL("null"),
        DESC("desc"),
        ASC("asc");
        private final String text;
        EReviewAttribute(String text){this.text = text;}
        public String getText() {return this.text;}
    }
    public enum EReviewMessage {
        REVIEW_TYPE_LIST("reviewTypeList"),
        REVIEW_PLACE_LIST("reviewPlaceList"),
        REVIEW_CATEGORY_LIST("reviewCategoryList"),

        REVIEW_LIKE_TRANS_FAIL_MESSAGE("좋아요/취소 변환 실패 : "),
        REVIEWREPLY_ADD_FAIL_MESSAGE("후기 댓글 등록 실패 : "),
        REVIEWREPLY_MODIFY_FAIL_MESSAGE("후기 댓글 수정 실패 : "),
        REVIEWREPLY_DELETE_FAIL_MESSAGE("후기 댓글 삭제 실패 : "),

        REVIEW_LIKESTATUS_LOAD_FAIL_MESSAGE("후기 좋아요 상태 조회 실패 : "),
        REVIEW_LIKECOUNT_LOAD_FAIL_MESSAGE("후기 좋아요 수 조회 실패 : "),
        REVIEWREPLY_PAGING_FAIL_MESSAGE("후기 댓글 페이징 실패 : "),
        REIVEWREPLY_LOAD_FAIL_MESSAGE("후기 댓글 조회 실패 : "),
        REVIEWIMG_UPLOAD_FAIL_MESSAGE("후기 이미지 업로드 실패 : "),
        REVIEW_VIEWCOUNT_INCREASE_FAIL_MESSAGE("후기 조회수 증가 실패 : "),
        REVIEW_DELETE_FAIL_MESSAGE("후기 삭제 실패 : "),
        REVIEW_MODIFY_FAIL_MESSAGE("후기 수정 실패 :"),
        REVIEW_ADD_FAIL_MESSAGE("후기 등록 실패 : "),
        REVIEW_LOAD_FAIL_MESSAGE("후기 조회 실패 : ");

        private final String text;
        EReviewMessage(String text){this.text = text;}
        public String getText() {return this.text;}
    }
    public enum EReviewImage{
        FILE_CONVERT_ERROR_MESSAGE("error: MultipartFile -> File convert fail"),
        FILE_DELETE_SUCCESS_MESSAGE("File delete success"),
        FILE_DELETE_FAIL_MESSAGE("File delete fail"),
        RESPONSECODE("responseCode"),
        TEMP_IMAGE_URL("url"),
        S3_UPLOAD_FOLDER("img/reviewImg"),
        TEMP_IMAGE_PATH("/summernoteImage/"),
        REAL_IMAGE_PATH("https://liveamonth-resources.s3.ap-northeast-2.amazonaws.com/img/reviewImg/");

        private final String text;
        EReviewImage(String text){this.text = text;}
        public String getText() {return this.text;}
    }
    public enum EReview{
        REVIEW_LIKE_COUNT("reviewLikeCount"),
        REVIEW_REPLY_LIST("reviewReplyList"),
        ALL_REVIEW_LIST("AllReviewList"),
        POPULAR_REVIEW_LIST("popularReviewList"),
        FREE_REVIEW_LIST("freeReviewList");

        private final String text;
        EReview(String text){this.text = text;}
        public String getText() {return this.text;}
    }

    /*
     *  SignController Logic Constants
     */
    public enum ENaverApiUrl {
        NAVER_SIGN_IN_API_URL("https://nid.naver.com/oauth2.0/authorize?response_type=code"),
        NAVER_LOGIN_API_URL("https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"),
        NAVER_ADD_CLIENT_ID("&client_id="),
        NAVER_CLIENT_ID("mS20tLuLdThxAjEEr_yP"),
        NAVER_ADD_REDIRECT_URI("&redirect_uri="),
        NAVER_REDIRECT_URI(SITE_URL+"naverLogin"),
        NAVER_ADD_STATE("&state="),
        NAVER_ADD_CLIENT_SECRET("&client_secret="),
        NAVER_CLIENT_SECRET("CA3T9EN7Wo"),
        NAVER_ADD_CODE("&code=");

        private final String text;
        ENaverApiUrl(String text) {this.text = text;}
        public String getText() {return this.text;}
    }
    public enum ENaverLoginAttributes {
        STATE("state"),
        CODE("code"),
        API_URL("apiURL"),
        ACCESS_TOKEN("access_token"),
        ENCODE_UTF_8("UTF-8");

        private final String text;
        ENaverLoginAttributes(String text) {this.text = text;}
        public String getText() {return this.text;}
    }
    public enum ESignAttributes{
        LOG_SIGN_IN("signIn"),
        SUCCESS_SIGN_UP_MESSAGE("회원 가입 성공"),
        FAIL_SIGN_UP_MESSAGE("회원 가입 실패"),
        FIRST_IN("firstIn"),
        AT("@");
        private final String text;
        ESignAttributes(String text){this.text = text;}
        public String getText() {return this.text;}
    }

    /*
     *  Schedule Controller Logic Constants
     */
    public enum EScheduleAttributes{
        SELECTED_SCHEDULE_NO("selectedScheduleNO"),
        SCHEDULE_NO_OR_REPLY_NO_LIST("scheduleNO_OR_scheduleReplyNOList"),
        MESSAGE("message"),
        SCHEDULE_PLACE_LIST("schedulePlaceList"),
        SCHEDULE_ACTION("action"),
        SCHEDULE_LIST("list"),
        SCHEDULE_FILTER("filter"),
        FILTER("Filter"),
        ORDER_BY_NEW("orderByNew"),
        ORDER_BY_LIKE("orderByLike"),
        MODIFY_SCHEDULE_CONTENT_SUBJECT("modifyScheduleContentSubject"),
        MODIFY_SCHEDULE_CONTENT_DESC("modifyScheduleContentDesc"),
        MODIFY_SCHEDULE_CONTENT_COST("modifyScheduleContentCost"),
        DATE_LIST("dateList"),
        TODAY_INFORMATION("todayInformation"),
        SCHEDULEREPLY_VO_LIST("scheduleVOReplyList"),
        SELECT_SCHEDULE("selectSchedule"),
        FITERED_OTHER_SCHEDULE_LIST("otherScheduleList"),
        REQUEST_LIST("requestList"),
        DURATION_PAY("durationPayMsg"),
        OTHER_SCHEDULE_NO("otherScheduleNO"),
        OTHER_USER_NO("otherScheduleUserNO"),
        SCHEDULE_MENU("scheduleMenu"),
        MONTH_LIST("monthList"),
        CALENDAR_DTO_DATE_LIST("CalendarDTODateList"),
        CALENDAR_DTO_TODAY_INFORMATION_LIST("CalendarDTOTodayInformationList"),
        OTHER_SCHEDULE_AND_LIKE_COUNT("otherScheduleAndLikeCount");
        private final String text;
        EScheduleAttributes(String text) {this.text = text;}
        public String getText() {return this.text;}
    }
    public enum EAlertMessage{
        MAXIMUM_SCHEDULE_CONTENT("스케쥴은 최대 4개만 등록 가능합니다."),
        ADD_SCHEDULE_CONTENT("스케줄이 등록되었습니다"),

        ADD_SCHEDULE("캘린더가 추가되었습니다"),
        FAIL_TO_ADD_SCHEDULE("캘린더 추가에 실패하였습니다."),
        COMPLETE_SCHEDULE_MODIFICATION("캘린더가 수정되었습니다."),
        FAIL_TO_MODIFY_SCHEDULE("캘린더 수정에 실패하였습니다."),
        COMPLETE_SCHEDULE_DELETION("캘린더가 삭제되었습니다.."),
        COMPLETE_SCHEDULE_CONTENTS_DELETION("스케줄이 삭제되었습니다."),
        FAIL_TO_DELETE_SCHEDULE("캘린더 삭제에 실패하였습니다."),

        ADD_SCHEDULEREPLY("댓글 등록이 완료되었습니다."),
        FAIL_TO_ADD_SCHEDULEREPLY("댓글 등록에 실패하였습니다."),
        COMPLETE_SCHEDULEREPLY_MODIFICATION("댓글이 수정되었습니다."),
        FAIL_TO_MODIFY_SCHEDULEREPLY("댓글 수정에 실패하였습니다."),
        COMPLETE_SCHEDULEREPLY_DELETION("댓글이 삭제되었습니다.."),
        FAIL_TO_DELETE_SCHEDULEREPLY("댓글 삭제에 실패하였습니다."),

        ADD_CALENDAR_MESSAGE("아직 캘린더를 생성하지 않으셨습니다. 캘린더를 추가해주세요."),
        FAIL_TO_SEARCH_CALENDER_LIST("캘린더 리스트 조회에 실패하셨습니다."),
        FAIL_TO_SEARCH_SCHEDULE("스케줄 조회에 실패하셨습니다."),
        PLEASE_ADD_DURATION("기간을 설정해 주십시오."),
        WON("원");
        private final String text;
        EAlertMessage(String text) {this.text = text;}
        public String getText() {return this.text;}
    }
    public enum EScheduleStaticInt {
        FIRST_SCHEDULEREPLY_NO(501),
        FIRST_SCHEDULE_NO(200),
        STATIC_DISPLAY_PAGE_NUM(15),
        SCHEDULE_DISPLAY_PAGE_NUM(8),
        FIRST_SCHEDULECONTENT_NO(301);
        private final int text;
        EScheduleStaticInt(int text) {this.text = text;}
        public int getText(){return this.text;}
    }
    public enum EScheduleFilterAndOrders{
        SCHEDULE_FO_SEX("userSex"),
        SCHEDULE_FO_AGE("userAge"),
        SCHEDULE_FO_CITY_NO("cityNO"),
        SCHEDULE_FO_ORDER("orderBy");
        private final String text;
        EScheduleFilterAndOrders(String text) {this.text = text;}
        public String getText() {return this.text;}
    }
    public enum EOtherScheduleMessage{
        SCHEDULE_LOAD_FAIL_MESSAGE("후기 조회 실패 : "),

        SCHEDULE_VIEWCOUNT_INCREASE_FAIL_MESSAGE("스케줄 조회수 증가 실패 : "),

        SCHEDULE_LIKESTATUS_LOAD_FAIL_MESSAGE("스케줄 좋아요 상태 조회 실패 : "),
        SCHEDULE_LIKECOUNT_LOAD_FAIL_MESSAGE("스케줄 좋아요 수 조회 실패 : "),
        SCHEDULE_LIKE_TRANS_FAIL_MESSAGE("스케줄 좋아요/취소 변환 실패 : "),

        SCHEDULEREPLY_LOAD_FAIL_MESSAGE("스케줄 댓글 조회 실패 : "),
        SCHEDULEREPLY_PAGING_FAIL_MESSAGE("스케줄 댓글 페이징 실패 : "),
        SCHEDULEREPLY_ADD_FAIL_MESSAGE("스케줄 댓글 등록 실패 : "),
        SCHEDULEREPLY_MODIFY_FAIL_MESSAGE("스케줄 댓글 수정 실패 : "),
        SCHEDULEREPLY_DELETE_FAIL_MESSAGE("스케줄 댓글 삭제 실패 : ");


        private final String text;
        EOtherScheduleMessage(String text) {this.text = text;}
        public String getText() {return this.text;}
    }

    /*
     * Paging 관련
     */
    public enum EPaging{
        SELECTED_PAGE("selectedPage"),
        LIKE_STATUS("likeStatus"),
        LIKE_COUNT("likeCount"),
        START_NO("startNO"),
        PAIGING("paging");

        private final String text;
        EPaging(String text){this.text = text;}
        public String getText() {return this.text;}
    }











}
