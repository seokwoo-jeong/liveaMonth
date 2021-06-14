# TP_LiveAmonth
-- 0429 commit
   1. jeong branch merge
   
   2. modify ddl 
                city,cityInfo - Insert
                user - add userImage attribute
                reviewLike, scheduleLike - add primary key (reviewLikeUserNO, scheduleLikeUserNO)
                     -> primary key를 두 개로 해야 여러 값을 넣을 수 있음.
                cityInfo,Weather,Transport - add primary key attribute (cityInfoNO, cityWeatherNO, cityTransportNO)
                  
   3. Refactoring VO Class
               - 현재 테이블 속성에 맞는 값으로 변경
               - 이미지를 가지고 있는 테이블은 getImageURL() 함수 추가
                  
   4. Refactoring EntityConstants Class
               - 현재 테이블 속성에 맞는 값으로 변경
               - ScheduleVO에서 사용하는 place를 CityName(enum class)로 변경
               - city 에서 사용되는 enum class 추가
