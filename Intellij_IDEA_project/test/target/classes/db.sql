CREATE TABLE course
(
  cno    VARCHAR(10) PRIMARY KEY, #课程编号
  cname  VARCHAR(20), #课程名称
  credit DOUBLE #课程学分
)
  DEFAULT CHARSET = utf8;

CREATE TABLE student
(
  sid     VARCHAR(10) PRIMARY KEY, #学生编号
  sname   VARCHAR(20), #学生姓名
  smajor  VARCHAR(20), #学生专业
  sclass  VARCHAR(30), #学生班级
  tcredit DOUBLE, #总学分
  acredit DOUBLE, #平均学分绩点
  egrade  DOUBLE, #平均智育成绩
  majorpm INT, #专业排名
  classpm INT, #班级排名
  scode   VARCHAR(9) #学生密码
)
  DEFAULT CHARSET = utf8;

CREATE TABLE sc
(
  id     INT AUTO_INCREMENT PRIMARY KEY, #记录编号
  sid    VARCHAR(10), #学生编号
  sname  VARCHAR(20), #学生姓名
  cno    VARCHAR(10), #课程编号
  cname  VARCHAR(20), #课程名称
  tid    VARCHAR(10), #教师姓名
  credit DOUBLE, #学分
  pscore DOUBLE, #平时分
  lscore DOUBLE, #期末成绩
  escore DOUBLE #最终成绩
)
  DEFAULT CHARSET = utf8;

CREATE TABLE teacher
(
  tid   VARCHAR(10) PRIMARY KEY, #教师编号
  tname VARCHAR(20), #教师名称
  tcode VARCHAR(9) #教师密码
)
  DEFAULT CHARSET = utf8;

CREATE TABLE tc
(
  id        INT AUTO_INCREMENT PRIMARY KEY, #记录编号
  tid       VARCHAR(10), #教师编号
  tname     VARCHAR(20), #教师姓名
  cno       VARCHAR(10), #课程编号
  cname     VARCHAR(20), #课程姓名
  credit    DOUBLE, #学分
  avscore   DOUBLE, #平均分
  maxscore  DOUBLE, #最高分
  minscore  DOUBLE, #最低分
  cteachno  INT, #课程号
  clocation VARCHAR(30), #上课教室
  ctime     VARCHAR(20), #上课时间
  cmax      INT, #最大容量
  csel      INT, #已选人数
  sub       INT #是否提交
)
  DEFAULT CHARSET = utf8;

CREATE TABLE user
(
  id   VARCHAR(10) PRIMARY KEY, #用户编号
  name VARCHAR(20), #用户名称
  code VARCHAR(20), #用户密码
  kind VARCHAR(15) #用户类别
)
  DEFAULT CHARSET = utf8;

CREATE TABLE record
(
  mid     INT AUTO_INCREMENT PRIMARY KEY, #留言编号
  id      VARCHAR(10), #留言学生编号
  name    VARCHAR(20), #留言人姓名
  content VARCHAR(1000), #留言内容
  date    VARCHAR(50) #留言时间
)
  DEFAULT CHARSET = utf8;

INSERT INTO course (cno, cname, credit) VALUES ('001', 'Web', '3');
INSERT INTO user (id, name, code, kind) VALUES ('1', 'gly', '123', 'admin');
INSERT INTO user (id, name, code, kind) VALUES ('2', 'ls', '123', 'teacher');
INSERT INTO user (id, name, code, kind) VALUES ('3', 'xs', '123', 'student');
INSERT INTO record (id, name, content, date) VALUES ('3', 'xs', 'dreamtomb', '2017-10-31');
INSERT INTO record (id, name, content, date) VALUES ('3', 'xs', '171395837@qq.com', '2017-10-29');
INSERT INTO student (sid, sname, smajor, sclass, tcredit, acredit, egrade, majorpm, classpm, scode)
VALUES ('3', 'xs', '计科', '计科1503', '185', '55', '85', '1', '1', '123');
INSERT INTO teacher (tid, tname, tcode) VALUES ('2', 'ls', '123');
INSERT INTO sc (id, sid, sname, cno, cname, tid, credit, pscore, lscore, escore)
VALUES ('1', '3', 'xs', '001', 'Web', '2', '3', '80', '80', '80');
INSERT INTO tc (id, tid, tname, cno, cname, credit, avscore, maxscore, minscore, cteachno, clocation, ctime, cmax, csel, sub)
VALUES ('1', '2', '֣ls', '001', 'Web', '3', '55', '85', '35', '2124', '5-201', '2017-11-2', '20', '3', '2');