CREATE DATABASE HAC DEFAULT CHARACTER SET UTF8MB4; 
USE HAC;
DROP TABLE `user`;
 # 로그인 할때 필요한 정보
CREATE TABLE `user`( 
`U_no` INT PRIMARY KEY AUTO_INCREMENT, # 유저 고유번호
`U_id` CHAR(50) UNIQUE NOT NULL, # 유저 아이디
`U_pw` VARCHAR(255) NOT NULL, # 유저 비밀번호
`U_createdAt` DATETIME NOT NULL DEFAULT now(), # 시간체크
`U_updatedAt` DATETIME NOT NULL DEFAULT now() ON UPDATE now() # 시간 업데이트 체크
);
select * from user;
insert into user(U_id,U_pw) value("12112","11");
	SELECT COUNT(*) FROM user;
    	SELECT * FROM user WHERE U_id = "1212";
SELECT * FROM user;
DROP TABLE `info`;
 # 유저의 정보
 insert into info(U_no,I_name,I_birthDate_y,I_birthDate_m,I_birthDate_d,I_gender,I_email,I_pwFinding,I_hint)
 value (1,"12",2001,01,01,"남자","이메일",1,"안녕");
 SELECT * FROM info;
 
CREATE TABLE `info`(
`I_no` INT PRIMARY KEY AUTO_INCREMENT, 
`U_no` INT UNIQUE, # 유저 고유번호
`I_name` CHAR(30) UNIQUE NOT NULL , # 유저 닉네임
`I_nameUpdateTime` DATETIME NOT NULL DEFAULT now(), # 닉네임이 업데이트 된 시간
`I_profileImg` BLOB, # 프로필 사진 업로드 정보
`I_profileImgUpdateTime` DATETIME NOT NULL DEFAULT now(), # 닉네임이 업데이트 된 시간
`I_birthDate_y` int NOT NULL,
`I_birthDate_m` int NOT NULL,
`I_birthDate_d` int NOT NULL,
`I_gender` CHAR(5) NOT NULL,
`I_email` CHAR(50) UNIQUE NOT NULL, # 유저 이메일, 이메일을 맞추면 아이디를 보여줌
`I_pwFinding` INT NOT NULL DEFAULT 0, # 유저가 비밀번호 찾기할때 어떤질문을 선택했는지
`I_hint` CHAR(30) NOT NULL, # 유저가 대답한 내용
`I_createdAt` DATETIME NOT NULL DEFAULT now(), # 시간체크
`I_updatedAt` DATETIME NOT NULL DEFAULT now() ON UPDATE now()# 시간 업데이트 체크
);
DROP TABLE `physicalLog`;
CREATE TABLE `physicalLog`(
`P_no` INT PRIMARY KEY AUTO_INCREMENT, # 피지컬로그 프라이머리키
`U_no` INT NOT NULL, # 유저 넘버
`P_weightLog` DECIMAL (5,2) NOT NULL, # 몸무게 기록
`P_heightLog` DECIMAL (5,2) NOT NULL, # 키 기록
`P_createdAt` DATETIME NOT NULL DEFAULT now(), # 시간체크
`P_updatedAt` DATETIME NOT NULL DEFAULT now() ON UPDATE now() # 시간 업데이트 체크
);
delete from physicalLog WHERE P_no = 3;
select * FROM physicalLog where U_no = 1;
SELECT DATEDIFF(NOW(),P_createdAt) FROM physicalLog WHERE U_no = 1 ORDER BY P_no DESC LIMIT 1;

INSERT INTO `physicalLog`(U_no,P_weightLog,P_heightLog) value (1,11.1,11.1);
INSERT INTO `user`(U_id,U_pw) value ("a","a");
SELECT info.I_pwFinding FROM user JOIN info ON user.U_no = info.U_no WHERE user.U_id = 'a'; 
INSERT INTO `info`(U_no,I_name,I_weight,I_height,I_email,I_pwFinding,I_hint) value (1,"impark",60,170.1,"aaa",2,"한국");
SELECT user.* FROM info JOIN user ON info.U_no = user.U_no WHERE info.I_email = 'aaa';
UPDATE user set U_id = "1";

SELECT YEAR(P_createdAt),MONTH(P_createdAt),AVG(P_weightLog) AS average_value_per_day, AVG(P_heightLog) AS average_value_per_day2
FROM physicalLog
GROUP BY YEAR(P_createdAt), MONTH(P_createdAt)
ORDER BY YEAR(P_createdAt), MONTH(P_createdAt);
select * from calorieLog;
drop table calorieLog;
CREATE TABLE `calorieLog`(
`C_no` INT PRIMARY KEY AUTO_INCREMENT,
`U_no` INT NOT NULL,
`C_foodName` CHAR(50) NOT NULL,
`C_servingAmount` INT NOT  NULL,
`C_calorie`DECIMAL(6,3) NOT NULL, 
`C_meal`INT NOT NULL, # 언제 먹었는지 아침 = 0 점심 = 1 저녁 = 2 간식 = 3
`C_createdAt` DATETIME NOT NULL DEFAULT now(), # 시간체크
`C_updatedAt` DATETIME NOT NULL DEFAULT now() ON UPDATE now()# 시간 업데이트 체크
);
INSERT INTO board(U_no,B_title,I_name,C_calorie,C_meal) values ( '1','꽈배기','100','404.00','1');
drop table board;
INSERT INTO `board`(U_no,B_title,I_name,B_text,B_category)value(1,"제목","아이디","텍스트","질문");
select * from board;
CREATE TABLE `board` (
		`B_no` INT PRIMARY KEY AUTO_INCREMENT, 			#글번호
        `U_no` INT NOT NULL DEFAULT 0,                  #유저번호
		`B_title` CHAR(100) NOT NULL DEFAULT "",			#글제목
	    `I_name` CHAR(50) NOT NULL,							#작성자ID
		`B_datetime` DATETIME NOT NULL DEFAULT now(),		#작성시간
	    `B_hit` INT NOT NULL DEFAULT 0,					#조회수    
	    `B_text` TEXT	NOT NULL,							#글내용, 댓글내용
        `B_category` TEXT NOT NULL,						#카테고리
	    `B_replyCount` INT NOT NULL DEFAULT 0,			#댓글수
	    `B_replyOri` INT	NOT NULL DEFAULT -1				#댓글의 원글 번호
	);
    drop table replyBoard;
    CREATE TABLE `replyBoard` (
		`R_no` INT PRIMARY KEY AUTO_INCREMENT, 			#댓글번호
        `U_no` INT NOT NULL DEFAULT 0,                  #유저번호
        `B_no` INT NOT NULL DEFAULT 0,					#글번호
	    `I_name` CHAR(50) NOT NULL,							#작성자ID
		`R_datetime` DATETIME NOT NULL DEFAULT now(),		#작성시간
	    `R_hit` INT NOT NULL DEFAULT 0,					#추천수    
	    `R_text` TEXT	NOT NULL							#댓글내용
	);
    
    drop table realTimeTheme;
    create table `realTimeTheme` (
		`T_no` INT PRIMARY KEY AUTO_INCREMENT,			#실시간주제 넘버링
        `T_name` TEXT NOT NULL,							#실시간주제 이름
        `T_hit` INT NOT NULL DEFAULT 0					#실시간주제 조회수
    );
    select * from realTimeTheme;
    insert into realTimeTheme (T_name, T_hit) values ('운동',0);
    insert into realTimeTheme (T_name, T_hit) values ('식단',0);
    insert into realTimeTheme (T_name, T_hit) values ('질병',0);