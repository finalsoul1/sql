/*
1. myemp1외 테이블 생성
=====================================================================================
*/

drop table myemp1 cascade constraints;
drop table mydept1  cascade constraints;
drop table myemp1_old;
drop table mysalgrade1;
drop table mylecture1 cascade constraints;
drop table mysugang1;

create table myemp1
(empno number constraint pk_myemp1  primary key,
 ename varchar2(100) not null,
 deptno varchar2(1),
 addr   varchar2(100),
 sal    number(7),
 job    varchar2(20),
 comm   number(7),
 sungbyul varchar2(1),
 hiredate date,
 outdate varchar2(8),
 mgr number
 );
 
alter table myemp1 nologging;
 
-- 실습을 위해 myemp1을 1000만건 만들자.
DECLARE
          v_c NUMBER := 1;
BEGIN
         WHILE (v_c <= 10000000) LOOP
                insert into myemp1 values ( v_c, '홍길동'||v_c, mod(v_c, 4), '서울'||v_c, mod(v_c, 6000000),'CLERK',NULL,'M', sysdate-mod(v_c, 3000), sysdate, null);
                v_c := v_c + 1;
                insert into myemp1 values ( v_c, '다길동'||v_c, mod(v_c, 4), '부산'||v_c, mod(v_c, 6000000),'SALESMAN',NULL,'F', sysdate-mod(v_c, 3000), null, null);
                v_c := v_c + 1;
                insert into myemp1 values ( v_c, '나길동'||v_c, mod(v_c, 4), '대구'||v_c, mod(v_c, 6000000),'MANAGER',NULL,'M', sysdate-mod(v_c, 3000), null, null);
                v_c := v_c + 1;
                insert into myemp1 values ( v_c, '마길동'||v_c, mod(v_c, 4), '광주'||v_c, mod(v_c, 6000000),'ANALYST',NULL,'F', sysdate-mod(v_c, 3000), null, null);
                v_c := v_c + 1;
                insert into myemp1 values ( v_c, '가길동'||v_c, mod(v_c, 4), '대전'||v_c, mod(v_c, 6000000),'PROGRAMMER',NULL,'M', sysdate-mod(v_c, 3000), null, null);
                v_c := v_c + 1;
                insert into myemp1 values ( v_c, '박길동'||v_c, mod(v_c, 4), '제주'||v_c, mod(v_c, 6000000),'DESIGNER',mod(v_c, 2000000),'F', sysdate-mod(v_c, 3000), null, null);
                v_c := v_c + 1;
          END LOOP;
          commit;
END;
/


create table myemp1_old
(empno number constraint pk_myemp1_old primary key,
 ename varchar2(100)
 );
 
-- 퇴사자 입력(이름이 '홍길동'으로 시작하는 사원
insert into myemp1_old
select empno, ename
from myemp1 where ename like '홍길동%';

commit ;
 

create table mydept1
 (deptno varchar2(1) constraint pk_mydept1 primary key,
  dname  varchar2(100),
  up_deptno varchar2(1)
);
 
 

 insert into mydept1 values ('0', '개발1팀','4');
 insert into mydept1 values ('1', '개발2팀','4');
 insert into mydept1 values ('2', '기획1팀','5');
 insert into mydept1 values ('3', '기획2팀','5');
 insert into mydept1 values ('4', '개발본부','6');
 insert into mydept1 values ('5', '교육본부','6');
 insert into mydept1 values ('6', '오라클자바커뮤니티','');

commit;

-- 강좌테이블
create table mylecture1 (
	lecture_id number(2) constraint pk_lecture primary key,
      lecture_nm varchar2(100),
      teacher varchar2(20),
      room varchar2(1)
);

insert into mylecture1 values (1, '스프링개발자과정','이종철','A');
insert into mylecture1 values  (2, 'SQL기초실무과정','김종철','B');
insert into mylecture1 values  (3, 'ORACLE HINT과정','안종철','C');
insert into mylecture1 values  (4, '닷넷개발자과정','박종철','D');
insert into mylecture1 values  (5, '웹퍼블리실개발자과정','최종철','E');
insert into mylecture1 values  (6, '자바기초에서스프링까지과정','김종철','F');
insert into mylecture1 values  (7, '안드로이드과정','이종철','G');

commit;

-- 수강 테이블
create table mysugang1 (
    empno number references myemp1(empno),
    lecture_id number(2) references mylecture1 (lecture_id),
    seq number(2),	
    start_date date,
    end_date date,
    constraint  pk_sugang primary key (empno, lecture_id, seq)
);

insert into mysugang1 select rownum, 1, 1, sysdate, sysdate+30 from dual connect by rownum <= 500000;
insert into mysugang1 select rownum, 1, 2, sysdate+100, sysdate+130 from dual connect by rownum <= 500000;
insert into mysugang1 select rownum+500000, 2, 1, sysdate, sysdate+30 from dual connect by rownum <= 500000;
insert into mysugang1 select rownum+1000000, 3, 1, sysdate, sysdate+30 from dual connect by rownum <= 500000;
insert into mysugang1 select rownum+1000000, 3, 2, sysdate+100, sysdate+130 from dual connect by rownum <= 500000;
insert into mysugang1 select rownum+5000000, 4, 1, sysdate, sysdate+40 from dual connect by rownum <= 500000;
insert into mysugang1 select rownum+5000000, 4, 2, sysdate+100, sysdate+140 from dual connect by rownum <= 500000;
insert into mysugang1 select rownum+7000000, 5, 1, sysdate, sysdate+40 from dual connect by rownum <= 500000;
insert into mysugang1 select rownum+7000000, 5, 2, sysdate+90, sysdate+130 from dual connect by rownum <= 500000;
insert into mysugang1 select rownum+7000000, 5, 3, sysdate+150, sysdate+190 from dual connect by rownum <= 500000;
insert into mysugang1 select rownum+8000000, 6, 1, sysdate, sysdate+40 from dual connect by rownum <= 500000;
insert into mysugang1 select rownum+8000000, 6, 2, sysdate+60, sysdate+100 from dual connect by rownum <= 500000;
insert into mysugang1 select rownum+8000000, 6, 3, sysdate+190, sysdate+230 from dual connect by rownum <= 500000;

commit;


-- 관리자 번호를 할당
update myemp1
  set mgr = (
              case deptno
                  when '0' then 1
                  when '1' then 2
                  when '2' then 3
                  when '3' then null
              end
             );
             
update myemp1 set mgr = 11 where empno in  (1, 2) ;            
update myemp1 set mgr = 12 where empno = 3;
update myemp1 set mgr = 31 where empno in  (11, 12); 
update myemp1  set mgr = null where empno = 31;   --31최고관리자 mgr은 NULL
commit;


-- myemp1의 deptno에 대한 외래키 제약조건 추가
alter table myemp1 add constraints fk_myemp1_mydept1 foreign key(deptno) references mydept1(deptno);

-- myemp1 테이블의 mgr 칼럼에 대해 외래키 제약조건 추가
alter table myemp1 add constraints fk_myemp1_mgr_empno foreign key(mgr)  references myemp1(empno);

-- myemp1_old의 empno에 대한 외래키 제약조건 추가
alter table myemp1_old add constraints fk_myemp1_old_myemp1 foreign key(empno) references myemp1(empno);

-- mydept1의 up_deptno에 대한 외래키 추가(자기참조)
alter table mydept1 add constraints fk_mydept1_mydept1 foreign key(up_deptno) references mydept1(deptno);


-- 급여등급 테이블
CREATE TABLE MYSALGRADE1
        (GRADE NUMBER(1),
   LOSAL NUMBER(8),
   HISAL NUMBER(8) );

 

INSERT INTO MYSALGRADE1 VALUES (1, 0,1000000);
INSERT INTO MYSALGRADE1 VALUES (2,1000001,2000000);
INSERT INTO MYSALGRADE1 VALUES (3,2000001,3000000);
INSERT INTO MYSALGRADE1 VALUES (4,3000001,4000000);
INSERT INTO MYSALGRADE1 VALUES (5,4000001,5000000);
INSERT INTO MYSALGRADE1 VALUES (6,5000001,6000000);
commit;

[인덱스 생성]
create index idx_myemp1_ename on myemp1(ename);
create index idx_myemp1_sal on myemp1(sal);
create index idx_myemp1_deptno on myemp1(deptno);

create index idx_myemp1_old_ename on myemp1_old(ename);

[통계정보생성]
 
begin
dbms_stats.gather_table_stats( USER, 
                               'myemp1', 
                               method_opt =>'for all indexed columns', 
                               cascade => true);
 end;
 /
 
begin
dbms_stats.gather_table_stats( USER, 
                               'myemp1_old', 
                               method_opt =>'for all indexed columns', 
                               cascade => true);
end;
/

begin
dbms_stats.gather_table_stats( USER, 
                               'mydept1', 
                               method_opt =>'for all indexed columns', 
                               cascade => true);
end;
/

begin
dbms_stats.gather_table_stats( USER, 
                               'mysalgrade1', 
                               method_opt =>'for all indexed columns', 
                               cascade => true);
 end;
 /


begin
dbms_stats.gather_table_stats( USER, 
                               'mylecture1', 
                               method_opt =>'for all indexed columns', 
                               cascade => true);
 end;
 /

begin
dbms_stats.gather_table_stats( USER, 
                               'mysugang1', 
                               method_opt =>'for all indexed columns', 
                               cascade => true);
 end;
 /