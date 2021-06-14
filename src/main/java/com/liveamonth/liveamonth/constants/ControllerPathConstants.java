package com.liveamonth.liveamonth.constants;

public class ControllerPathConstants {
    /*
     * View(JSP)의 파일 경로를 모아놓은 클래스
     * 1. getPath() : View에 해당하는 directory를 더해서 리턴.
     * 2. getText() : 텍스트만 리턴
     * 3. 'redirect:'를 사용하는 경우 enum에 'REDIRECT_+@@@@' 형식으로 enum 선언 -> 가져올때는 getRedirectPath() 사용
     */
    public ControllerPathConstants() {}

    /*
     * MainController Path Constants
     */
    public enum ETemplatePath {
        MAIN("Main"),
        MY_PAGE("MyPage"),
        CITY("City"),
        REVIEW("Review"),
        CUSTOMER_CENTER("CustomerCenter");
        private final String path;
        ETemplatePath(String path) {this.path = path;}
        public String getPath() {return this.path;}
    }

    /*
     * CityInfoController Path Constants
     */
    public enum ECityInfoPath {
        CITY_INFO_GRID("CityInfoGrid"),
        CITY_INFO("CityInfo");
        private final String path;
        ECityInfoPath(String path) {this.path = path;}
        public String getPath() {return "cityInfoView/"+this.path;}
    }

    /*
     * CustomerCenterController Path Constants
     */
    public enum ECustomerCenterPath {
        FAQ("Faq","FAQ"),
        PERSONAL_TERMS("PersonalTerms","개인정보 처리방침"),
        TERMS_AND_CONDITIONS("TermsAndConditions","이용약관"),
        NOTICE("Notice","공지사항");
        private String path;
        private String menuName;
        ECustomerCenterPath(String path,String menuName) {
            this.path = path;
            this.menuName = menuName;
        }
        public String getPath() {return "customerCenterView/"+this.path;}
        public String getText() {return this.path;}
        public String getMenuName() {return this.menuName;}
    }

    /*
     * MyPageController Path Constants
     */
    public enum EMyPagePath {
        MY_PAGE("MyPage"),
        REDIRECT_MY_PAGE("redirect:myPage"),
        MODIFY_USER_INFO("ModifyUserInfo"),
        RE_CHECK_PASSWORD("ReCheckPassword"),
        RESULT_MENT("ResultMent"),
        FINALLY_ASK_DROP_USER("FinallyAskDropUser"),
        ONE_TO_ONE_ASK("OneToOneAsk"),
        SHOW_ONE_TO_ONE_ASK("ShowOneToOneAsk"),
        WRITE_ONE_TO_ONE_ASK("WriteOneToOneAsk"),
        MANAGE_REVIEW("ManageReview"),
        MANAGE_SCHEDULE("ManageSchedule"),
        ONE_TO_ONE_ASK_REPLY("OneToOneAskReply"),
        WRITE_ONE_TO_ONE_ASK_REPLY("WriteOneToOneAskReply"),
        RESULT_MENT_ONE_TO_ONE_ASK_REPLY("ResultMentOneToOneAskReply");
        private final String path;
        EMyPagePath(String path) {this.path = path;}
        public String getPath() {return "myPageView/"+this.path;}
        public String getText() {return this.path;}
    }
    /*
     * ReviewController Path Constants
     */
    public enum EReviewPath {
        DEFAULT_REVIEW_PAGE("DefaultReviewPage"),
        REVIEW_CONTENT("ReviewContent"),
        REVIEW_WRITER("ReviewWriter"),
        CATEGORY_REVIEW_PAGE("CategoryReviewPage"),
        SEARCH_REVIEW_PAGE("SearchReviewPage"),
        REDIRECT_REVIEW_CONTENT("redirect:getReview");
        private final String path;
        EReviewPath(String path) {this.path = path;}
        public String getPath() {return "reviewView/"+this.path;}
        public String getRedirectPath() {return this.path;}
    }

    /*
     * ScheduleController Path Constants
     */
    public enum ESchedulePath {
        OTHER_SCHEDULE("OtherSchedule"),
        OTHER_SCHEDULE_LIST("OtherScheduleList"),
        SCHEDULE("Schedule"),
        REDIRECT_OTHER_SCHEDULELIST("redirect:otherScheduleList"),
        REDIRECT_SCHEDULE("redirect:schedule"),
        REDIRECT_OTHER_SCHEDULE("redirect:otherSchedule?");
        private final String path;
        ESchedulePath(String path) {this.path = path;}
        public String getPath() {return "scheduleView/"+this.path;}
        public String getRedirectPath() {return this.path;}
        public String getOtherSchedulePath(int userNO, int scheduleNO) {
            return this.path+"userNO="+userNO
                    +"&scheduleNO="+scheduleNO;}
    }

    /*
     * SignController Path Constants
     */
    public enum ESignPath {
        FIND_ID("FindID"),
        FIND_PW("FindPW"),
        RESULT_MENT_FIND_ID("ResultMentFindID"),
        RESULT_MENT_FIND_PW("ResultMentFindPW"),
        RESULT_MENT_SIGN_UP("ResultMentSignUp"),
        SIGN_IN("SignIn"),
        SIGN_UP("SignUp"),
        REDIRECT_NAVER_SIGN_UP("redirect:naverSignUp"),
        NAVER_SIGN_UP("NaverSignUp"),
        REDIRECT_MAIN("redirect:/"),
        NEW_NAVER_MEMBER("NewNaverMember"),
        RESULT_NEW_NAVER_MEMBER("ResultNewNaverMember");
        private final String path;
        ESignPath(String path) {this.path = path;}
        public String getPath() {return "signView/"+ this.path;}
        public String getRedirectPath() {return this.path;}
    }



}
