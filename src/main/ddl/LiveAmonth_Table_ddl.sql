create table user
(
    userNO       int not null auto_increment,
    userID       varchar(100),
    userPassword varchar(20),
    userName     varchar(20),
    userNickname varchar(20),
    userEmail    varchar(50),
    userSex      boolean,
    userAge      int,
    userImage    varchar(100),
    primary key (userNO)
);

create table schedule
(
    scheduleNO        int auto_increment
        primary key,
    scheduleSubject   varchar(20) null,
    scheduleStatus    tinyint(1)  null,
    scheduleViewCount int         null,
    userNO            int         null,
    cityNO            int         null,
    foreign key (userNO) references user (userNO)
        on delete cascade,
    foreign key (cityNO) references city (cityNO)
        on update cascade on delete set null
);

create table scheduleLike
(
    scheduleNO         int not null,
    scheduleLikeUserNO int,
    primary key (scheduleNO, scheduleLikeUserNO),
    foreign key (scheduleNO) references schedule (scheduleNO) on delete cascade,
    foreign key (scheduleLikeUserNO) references user (userNO) on delete cascade
);

create table scheduleContent
(
    scheduleContentNO      int not null auto_increment,
    scheduleContentSubject varchar(100),
    scheduleContentDesc    varchar(900),
    scheduleContentDate    date,
    scheduleContentCost    int,
    scheduleNO             int,
    primary key (scheduleContentNO),
    foreign key (scheduleNO) references schedule (scheduleNO) on delete cascade
);

create table scheduleReply
(
    scheduleReplyNO    int not null auto_increment,
    scheduleReplyDesc  varchar(200),
    scheduleReplyDate  date,
    scheduleReplyRefNO int,
    userNO             int,
    scheduleNO         int,
    primary key (scheduleReplyNO),
    foreign key (scheduleReplyRefNO) references scheduleReply (scheduleReplyNO) on delete cascade,
    foreign key (userNO) references user (userNO) on delete cascade,
    foreign key (scheduleNO) references schedule (scheduleNO) on delete cascade
);

create table review
(
    reviewNO        int not null auto_increment,
    reviewCategory  varchar(10),
    reviewSubject   varchar(100),
    reviewDesc      varchar(900),
    reviewDate      date,
    reviewViewCount int,
    reviewImage     varchar(100),
    userNo          int,
    primary key (reviewNO),
    foreign key (userNO) references user (userNO) on delete cascade
);


create table reviewLike
(
    reviewNO         int not null,
    reviewLikeUserNO int,
    primary key (reviewNO, reviewLikeUserNO),
    foreign key (reviewNO) references review (reviewNO) on delete cascade,
    foreign key (reviewLikeUserNO) references user (userNO) on delete cascade
);

create table reviewReply
(
    reviewReplyNO    int not null auto_increment,
    reviewReplyDesc  varchar(200),
    reviewReplyDate  dateTime,
    reviewReplyRefNO int,
    userNO           int,
    reviewNO         int,
    primary key (reviewReplyNO),
    foreign key (reviewReplyRefNO) references reviewReply (reviewReplyNO) on delete cascade,
    foreign key (userNO) references user (userNO) on delete cascade,
    foreign key (reviewNO) references review (reviewNO) on delete cascade
);


create table oneToOneAsk
(
    oneToOneAskNO        int not null auto_increment,
    oneToOneAskCategory  varchar(10),
    oneToOneAskSubject   varchar(100),
    oneToOneAskDesc      varchar(500),
    oneToOneAskDate      date,
    oneToOneAskImage     varchar(500),
    oneToOneAskUserEmail varchar(50),
    oneToOneAskReply     varchar(500),
    userNO               int,
    primary key (oneToOneAskNO),
    foreign key (userNO) references user (userNO) on delete cascade
);

create table city
(
    cityNO   int not null auto_increment,
    cityName varchar(10),
    primary key (cityNO)
);

create table cityInfo
(
    cityInfoNO       int not null auto_increment,
    cityInfoCategory varchar(10),
    cityInfoDesc     varchar(900),
    cityInfoImage    varchar(500),
    cityNo           int,
    primary key (cityInfoNO),
    foreign key (cityNO) references city (cityNO) on delete cascade
);

create table cityTransport
(
    cityTransportNO       int not null auto_increment,
    cityTransportCategory varchar(10),
    cityStationCount      int,
    cityNo                int,
    primary key (cityTransportNO),
    foreign key (cityNO) references city (cityNO) on delete cascade
);

create table cityWeather
(
    cityWeatherNO      int not null auto_increment,
    cityWeatherMonth   int,
    cityWeatherMaxTemp float,
    cityWeatherMinTemp float,
    cityWeatherAVGTemp float,
    cityNo             int,
    primary key (cityWeatherNO),
    foreign key (cityNO) references city (cityNO) on delete cascade
);

create table notice
(
    noticeNO int not null auto_increment,
    noticeDate datetime,
    userNO int,
    senderNO int,
    readStatus boolean,
    primary key(noticeNO),
    foreign key (senderNO) references user (userNO)
);

create table RRNotice
(
    noticeNO int not null,
    reviewReplyNO int,
    primary key(noticeNO),
    foreign key (noticeNO) references notice(noticeNO),
    foreign key (reviewReplyNO) references reviewReply(reviewReplyNO)
);

create table RLNotice
(
    noticeNO int not null,
    reviewNO int,
    primary key(noticeNO),
    foreign key (noticeNO) references notice(noticeNO),
    foreign key (reviewNO) references review(reviewNO)
);

create table SRNotice
(
    noticeNO int not null,
    scheduleReplyNO int,
    primary key(noticeNO),
    foreign key (noticeNO) references notice(noticeNO),
    foreign key (scheduleReplyNO) references scheduleReply(scheduleReplyNO)
);

create table SLNotice
(
    noticeNO int not null,
    scheduleNO int,
    primary key(noticeNO),
    foreign key (noticeNO) references notice(noticeNO),
    foreign key (scheduleNO) references schedule(scheduleNO)
);