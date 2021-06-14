package com.liveamonth.liveamonth.constants;

public class EntityConstants {
    /*
     * DB테이블 및 VO클래스에서 사용하는 Attributes
     * 1. DB테이블의 attribute이름과 설정한 text의 값이 같아야 함.
     * 2. 테이블의 row값을 하나의 객체로 받아오기 위해 "테이블 명+VO" 추가.
     * 3. 테이블의 row값을 여러개의 객체로 받아오기 위해 "테이블 명+VO_LIST" 추가
     */
    public EntityConstants() {
    }

    public static String IMAGE_URL = "https://liveamonth-resources.s3.ap-northeast-2.amazonaws.com/img/";
    public static String SITE_URL = "http://tpliveamonth-env.eba-296xyabm.ap-northeast-2.elasticbeanstalk.com/";

    /*
     * City Table Constants
     */
    public enum ECity {
        CITY_VO("cityVO"),
        CITY_VO_LIST("cityVOList"),
        CITY_NO("cityNO"),
        CITY_NAME("cityName");
        private final String text;
        ECity(String text) {
            this.text = text;
        }
        public String getText() {
            return this.text;
        }
    }
    public enum CityInfoCategory {
        INTRO("Intro", "intro/"),
        FOOD("Food", "food/"),
        VIEW("View", "view/");
        private final String text;
        private final String path;
        CityInfoCategory(String text, String path) {
            this.text = text;
            this.path = path;
        }
        public String getText() {
            return this.text;
        }
        public String getImgUrlPath() {
            return this.path;
        }
    }
    public enum CityTransportCategory {
        SUBWAY("지하철역",4),
        BUS("버스 노선",5),
        BICYCLE("공공자전거",6),
        BUS_TERMINAL("버스 터미널",3),
        TRAIN("기차역",2),
        AIRPORT("공항",1);
        private final String nameKR;
        private final int score;
        CityTransportCategory(String nameKR,int score) {
            this.nameKR = nameKR;
            this.score = score;
        }
        public int getScore() {
            return this.score;
        }
        public String getNameKR() {return this.nameKR;}
    }
    public enum Month {Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sept, Oct, Nov, Dec}

    /*
     * ReviewReply Table Constants
     */
    public enum EReviewReply {
        REVIEW_REPLY_VO("reviewReplyVO"),
        REVIEW_REPLY_NO("reviewReplyNO"),
        REVIEW_REPLY_DESC("reviewReplyDesc"),
        REVIEW_REPLY_DATE("reviewReplyDate"),
        REVIEW_REPLY_REF_NO("reviewReplyRefNO");
        private final String text;
        EReviewReply(String text) {
            this.text = text;
        }
        public String getText() {
            return this.text;
        }
    }

    /*
     * Review Table Constants
     */
    public enum EReview {
        REVIEW_VO("reviewVO"),
        REVIEW_NO("reviewNO"),
        REVIEW_CATEGORY("reviewCategory"),
        REVIEW_SUBJECT("reviewSubject"),
        REVIEW_DESC("reviewDesc"),
        REVIEW_DATE("reviewDate"),
        REVIEW_VIEW_COUNT("reviewViewCount");
        private final String text;
        EReview(String text) {
            this.text = text;
        }
        public String getText() {
            return this.text;
        }
    }
    public enum EReviewSearchDate{
        TOTAL_DATE("전체기간"),
        ONE_DAY("1일"),
        ONE_WEEK("1주일"),
        ONE_MONTH("1개월"),
        SIX_MONTH("6개월"),
        ONE_YEAR("1년");
        private final String nameKR;
        EReviewSearchDate(String nameKR){this.nameKR = nameKR;}
        public String getNameKR() {return this.nameKR;}

    }
    public enum EReviewSearchDetail{
        SUBJECT_DESC("제목+내용"),
        SUBJECT("제목만"),
        NICKNAME("글작성자"),
        REPLY_CONTENT("댓글내용"),
        REPLY_NICKNAME("댓글작성자");
        private final String nameKR;
        EReviewSearchDetail(String nameKR){this.nameKR = nameKR;}
        public String getNameKR() {return this.nameKR;}
    }
    public enum EReviewCategoryName{
        SEOUL_HOUSE_BOARD("서울ㅣ숙박시설"),
        GANGNEUNG_HOUSE_BOARD("강릉ㅣ숙박시설"),
        GYEONGJU_HOUSE_BOARD("경주ㅣ숙박시설"),
        BUSAN_HOUSE_BOARD("부산ㅣ숙박시설"),
        YEOSU_HOUSE_BOARD("여수ㅣ숙박시설"),
        JEJU_HOUSE_BOARD("제주ㅣ숙박시설"),

        SEOUL_GO_BOARD("서울ㅣ가볼만한곳"),
        GANGNEUNG_GO_BOARD("강릉ㅣ가볼만한곳"),
        GYEONGJU_GO_BOARD("경주ㅣ가볼만한곳"),
        BUSAN_GO_BOARD("부산ㅣ가볼만한곳"),
        YEOSU_GO_BOARD("여수ㅣ가볼만한곳"),
        JEJU_GO_BOARD("제주ㅣ가볼만한곳"),

        SEOUL_FOOD_BOARD("서울ㅣ먹을만한곳"),
        GANGNEUNG_FOOD_BOARD("강릉ㅣ먹을만한곳"),
        GYEONGJU_FOOD_BOARD("경주ㅣ먹을만한곳"),
        BUSAN_FOOD_BOARD("부산ㅣ먹을만한곳"),
        YEOSU_FOOD_BOARD("여수ㅣ먹을만한곳"),
        JEJU_FOOD_BOARD("제주ㅣ먹을만한곳"),

        SEOUL_REVIEW_BOARD("서울ㅣ솔직후기"),
        GANGNEUNG_REVIEW_BOARD("강릉ㅣ솔직후기"),
        GYEONGJU_REVIEW_BOARD("경주ㅣ솔직후기"),
        BUSAN_REVIEW_BOARD("부산ㅣ솔직후기"),
        YEOSU_REVIEW_BOARD("여수ㅣ솔직후기"),
        JEJU_REVIEW_BOARD("제주ㅣ솔직후기"),

        FREE_BOARD("자유게시판");
        private final String nameKR;
        EReviewCategoryName(String nameKR){this.nameKR = nameKR;}
        public String getNameKR() {return this.nameKR;}
    }

    /*
     * ScheduleContent Table Constants
     */
    public enum EScheduleContent {
        SCHEDULE_CONTENT_VO("scheduleContentVO"),
        SCHEDULE_CONTENT_NO("scheduleContentNO"),
        SCHEDULE_CONTENT_SUBJECT("scheduleContentSubject"),
        SCHEDULE_CONTENT_DESC("scheduleContentDesc"),
        SCHEDULE_CONTENT_DATE("scheduleContentDate"),
        SCHEDULE_CONTENT_COST("scheduleContentCost");
        private final String text;
        EScheduleContent(String text) {
            this.text = text;
        }
        public String getText() {
            return this.text;
        }
    }

    /*
     * ScheduleReply Table Constants
     */
    public enum EScheduleReply {
        SCHEDULE_REPLY_VO("scheduleReplyVO"),
        SCHEDULE_REPLY_NO("scheduleReplyNO"),
        SCHEDULE_REPLY_DESC("scheduleReplyDesc"),
        SCHEDULE_REPLY_DATE("scheduleReplyDate"),
        SCHEDULE_REPLY_REF_NO("scheduleReplyRefNO");
        private final String text;
        EScheduleReply(String text) {
            this.text = text;
        }
        public String getText() {
            return this.text;
        }
    }

    /*
     * Schedule Table Constants
     */
    public enum ESchedule {
        SCHEDULE_VO("scheduleVO"),
        SCHEDULE_VO_LIST("scheduleVOList"),
        SCHEDULE_NO("scheduleNO"),
        SCHEDULE_SUBJECT("scheduleSubject"),
        SCHEDULE_VIEW_COUNT("scheduleViewCount"),
        SCHEDULE_STATUS("scheduleStatus"),
        SCHEDULE_PLACE("schedulePlace"),
        SCHEDULE_PAY_START_DAY("schedulePayStartDay"),
        SCHEDULE_PAY_FINISH_DAY("schedulePayFinishDay");
        private final String text;
        ESchedule(String text) {
            this.text = text;
        }
        public String getText() {
            return this.text;
        }
    }

    /*
     * User Table Constants
     */
    public enum EUser {
        USER_VO("userVO"),
        USER_NO("userNO"),
        USER_ID("userID"),
        USER_PASSWORD("userPassword"),
        USER_NAME("userName"),
        USER_NICKNAME("userNickname"),
        USER_AGE("userAge"),
        USER_SEX("userSex"),
        USER_EMAIL("userEmail"),
        NAVER_USER("naverUser");
        private final String text;
        EUser(String text) {
            this.text = text;
        }
        public String getText() {
            return this.text;
        }
    }

    /*
     * OneToOneAsk Table Constants
     */
    public enum EOneToOneAsk {
        ONE_TO_ONE_ASK_NO("oneToOneAskNO"),
        ONE_TO_ONE_ASK_VO("oneToOneAskVO"),
        ONE_TO_ONE_ASK_VO_LIST("oneToOneAskVOList"),
        ONE_TO_ONE_ASK_CATEGORY("oneToOneAskCategory");
        private final String text;
        EOneToOneAsk(String text) {
            this.text = text;
        }
        public String getText() {
            return this.text;
        }
    }
    public enum OneToOneAskCategory {
        CATEGORY("카테고리"),
        CATEGORY1("카테고리1"),
        CATEGORY2("카테고리2"),
        CATEGORY3("카테고리3"),
        CATEGORY4("카테고리4");
        private String label;
        OneToOneAskCategory(String label) {
            this.label = label;
        }
        public String getLabel() {
            return label;
        }
    }

    /*
     * Paging Constants
     */
    public enum EPage {
        DISPLAY_PAGE("displayPage");
        private final String text;
        EPage(String text) {
            this.text = text;
        }
        public String getText() {
            return text;
        }
    }

    /*
     * sign Table Constants
     */
    public enum ESignUp {
        EMAIL("email");
        private final String text;
        ESignUp(String text) {
            this.text = text;
        }
        public String getText() {
            return this.text;
        }
    }
    public enum EEmail {
        select("선택하세요"),
        naver("naver.com"),
        google("gmail.com"),
        self("직접입력");
        private final String label;
        EEmail(String label) {
            this.label = label;
        }
        public String getLabel() {
            return label;
        }
    }

    /*
    * Notice Constants
    */
    public enum ENoticeType {
        NOTICE_NO("noticeNO"),
        REVIEW_LIKE("reviewLike"),
        SCHEDULE_LIKE("scheduleLike"),
        REVIEW_REPLY("reviewReply"),
        SCHEDULE_REPLY("scheduleReply"),
        REVIEW_REPLY_REF("reviewReplyRef"),
        SCHEDULE_REPLY_REF("scheduleReplyRef");
        private final String text;
        ENoticeType(String text) {
            this.text = text;
        }
        public String getText() {
            return text;
        }
    }
}
