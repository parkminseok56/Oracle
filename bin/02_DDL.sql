--DDL(Data Definition Language)데이터 정의어

--테이블의 생성(Create)
--Create Table 테이블이름(
--      필드명1 DATATYPE [DEFAULT값 or 제약조건 및 형식] ,
--      필드명2 DATATYPE [DEFAULT값 or 제약조건 및 형식] ,
--      필드명3 DATATYPE [DEFAULT값 or 제약조건 및 형식] ,
--      ...
--);


-- Create Table 명령의 세부 규칙   create table  CREATE TABLE
-- 테이블의 이름은 객체를 의미할 수 있는 적잘한 이름을 사용함(자바 변수 이름 규칙과 거의 동일)
-- 다른 테이블과 중복되지 않게 테이블 이름을 지정함
-- 한 테이블 내에서 필드이름도 중복되지 않게 함
-- 각 필드들은 ","로 구분하여 생성함
-- create를 비롯한 모든 sql명령은 ";"로 끝남
-- 필드명 뒤에 DATATYPE은 반드시 지정하고 [ ]안에 내용은 해당내용이 있을 때 작성하며 생략 가능
-- 테이블 명과 필드명은 반드시 문자로 시작해야 하고 예약어 명령어 등을 테이블명과 필드명으로 쓸수 없음
-- 테이블 생성시 대/소문자 구분은 하지 않음(기본적으로 테이블이나 컬럼명은 대문자로 만들어짐)
-- DATE데이터형식은 유형을 별도로 크기를 지정하지 않음
-- 문자데이터의 DataType->varchar(10), number(4)
-- 문자 데이터 유형은 반드시 가질 수 있는 최대 길이를 표시해야 함
-- 컬럼과 컬럼의 구분은 콤마로 하되, 마지막 컬럼은 콤마를 찍지 않음

--도서대여점의 도서목록 테이블의 생성
--필드 : booknum , subject , makeyear , inprice , outprice,
--자료형 : booknum(문자5자리), subject(문자30), makeyear(숫자4), inprice(숫자6), outprice(숫자4)
--제약조건: booknum(Not null), subject(Not null), makeyear(), inprice(), outprice()
-- 기본키 : booknum

create table 
CREATE TABLE
Create Table

drop table booklist purge;

create table booklist(
	booknum varchar2(5) not null ,
	subject varchar2(30) not null , 
	makeyear number(4),
	inprice number(6),
	outprice number(4) , 
	
	-- 필드명 옆에 현재 필드에만 적용하는 제약조건을 필드수준의 제약이라고 합니다
	-- 아래는 테이블 수준의 제약조건입니다
	constraint booklist_pk primary key (booknum)
	-- constraint : 테이블 수준의 제약조건을 지정하는 키워드
	-- booklist_pk : 테이블 외부에서 현재 제약조건을 컨트롤 하기 위한 제약조건의 고유이름
	-- primary key( booknum ) : 기본키로 booknum 을 지정하겠다는 뜻입니다
);

select * from booklist;  -- 테이블의 내용 전체를 조회하는 명령

-- 제약조건 (CONSTRAINT)
-- PRIMARY KEY
--    - 테이블에 저장된 레코드를 고유하게 식별하기 위한 키, 하나의 테이블에 하나의 기본키만 정의 할 수 
--      있습니다
--    - 여러 필드가 조합된 기본키 생성 가능합니다
--    - 기본키는 중복된 값을 갖을 수 없으며 빈칸도 있을 수 없습니다
--    - PRIMARY KEY = UNIQUE KEY + NOT NULL
--  UNIQUE KEY
--    - 테이블에 저장된 행 데이터를 고유하게 식별하기 위한 고유키를 정의 합니다
--    - 단 NULL 은 고유키 제약의 대상의 아니무로, NULL값을 가진 행이 여러개가 UNIQUE KEY 
--      제약에   위반하지는 않습니다
--  NOT NULL
--    - 비어있는 상태, 아무것도 없는 상태를 허용하지 않습니다   - 입력 필수
--  CHECK
--    - 입력할 수 있는 값의 범위를 제한한다. CHECK 제약으로는 TRUE or FALSE로   평가할 수 있는
--      논리식을  지정합니다
--   FOREIGN KEY 
--     - 관계형 데이터 베이스에서 테이블간에 관계를 정의하기 위해 키본키를  다른 테이블의  외래키로 
--       복사하는 경우 외래키가 생성됩니다    - 참조 무결성 제약 옵션이 생성


-- 테이블 생성 2
-- 테이블 이름 : MemberList(회원리스트)
-- 필드 : memberNum, memberName, Phone, Birth, Bpoint
-- 데이터 형식 :  memberNum :  VARCHAR2(5),  memberName : VARCHAR2(12), 
--                   Phone : VARCHAR2(13), Birth : DATE,  Bpoint :  NUMBER(6)
-- 제약 조건 : memberNum, memberName, Phone 세개의 필드 Not Null  - 필드레벨로 설정
--                  memberNum : Primary Key  -  테이블 레벨로 설정
drop table memberlist purge;
create table memberlist(
	membernum varchar2(5) not null,
	membername varchar2(12)  not null,
	phone  varchar2(13)  not null,
	birth date,
	bpoint number(6) default 100,
	constraint member_pk primary key(memberNum)	
);
select * from memberlist;




-- 테이블 생성 3
-- 테이블 이름 : rentlist
-- 필드 :  rent_date(date) , indexk(NUMBER(3)), booknum(VARCHAR2(5)),
--            membernum(VARCHAR2(5)), discount(NUMBER(4))
-- 제약조건 : booknum, membernum : not null
-- 기본값 : rent_date

create table rentlist(
	rent_date date default sysdate ,    -- 대여날짜
	indexk number(3) ,     -- 대여순번 : 1부터 시작해서 늘어나는 숫자이고 하루가 지나면 reset
	bnum varchar2(5) ,     -- 대여해간 도서번호
	mnum varchar2(5),   -- 대여한 회원의 회원번호
	discount number(4) default 500 ,    -- 할인금액
	constraint rent_pk primary key( rent_date, indexk ) ,
	constraint fk1 foreign key( bnum ) references booklist(booknum),
	-- 현재테이블의 bnum 필드는 booklist 테이블의  booknum 필드값을 참조합니다
	constraint fk2 foreign key( mnum ) references memberlist(membernum)
	-- 현재테이블의 mnum 필드는 memberlist 테이블의  membernum 필드값을 참조합니다
);
select * from rentlist;


-- rent_date  와 indexk 를 조합하여 기본키(rent_pk)를 생성. 두개의 필드가 조합되어 기본키로 지정될
--       수 있습니다.   이를 슈퍼키라고 합니다.
--  rentlist 테이블의 bnum 은 booklist 테이블의 booknum 을 참조하는 외래키(제약조건이름 fk1)
--  rentlist 테이블의 mnum 은 memebrlist 테이블의 membernum 을 참조하는 외래키(제약조건이름 fk2)













