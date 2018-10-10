database

data -> information -> truth, knowledge

oracle DBMS server

회원가입
ojc.asia 
www.oracle.com

오라클 구성
1. 오라클 서버 인스톨 (oracle enterprise 11gR2)
2. 접속을 위한 application 인스톨
2-1. 오라클제공: SQLPLUS(ORACLE CLIENT), SQL-DEVELOPER
2-2. 다른 회사 제공(써드 파티): toad, golden, pledit, sql navigator, etc

3. 접속 환경 설정
3-1. SQLPLUS : (path 등록 체크와 tnsnames.ora의 설정)
3-2. SQL-DEVELOPER는 접속창을 제공하므로 그곳에 접속정보를 저장한다.

학원 오라클 서버 접속
1. 접속을 위한 application 인스톨 

2. 접속 환경 설정
SQLPLUS - 런타임 (ojc.asia, tnsnames.ora 설정, 공백없애기
tnsnames.ora 권한부여, 환경변수 확인
(D:\app\Top866395\product\11.2.0\client_1\network\admin)
환경변수 path에 client_1\bin 추가

sqlplus test1/test1@topcredu

SQL-DEVELOPER
접속 - 호스트 이름에 호스트주소
SID - 서비스네임


