--create table 테이블이름();
--create user  유저이름 identified by 비번;

--alter table 테이블이름 수정내용
--alter user 유저이름 identified by 비번;

--1. 필드명의 변경
--ALTER TABLE 테이블이름 RENAME COLUMN 변경전이름 TO 변경후 이름
--테이블이름 : 변경하고자하는 필드명이 있는 테이블의 이름

SELECT * from booklist;
--booklist 테이블의 subject 필드명을 title 로 수정합니다

alter table booklist rename column subject to title;

--반대로 title 필드명을 subject 필드명으로 수정합니다
alter table booklist rename column title to subject;

--booklist 의 outprice 필드의 이름을 rentprice 로 수정하세요

alter table booklist rename column outprice to rentprice;

--memberlist 테이블의 membername 필드를 name 으로 변경하세요

alter table memberlist rename column membername to name;

--rentlist 테이블의 rent_date 필드를 rentdate 로 변경하세요

alter table rentlist rename column rent_date to rentdate;

--rentlist. 의 indexk 를 numseq 로 변경하세요

alter table rentlist rename column indexk to numseq;

select * from BOOKLIST;
select * from rentlist;
select * from memberlist;

alter table rentlist rename column bnum to booknum;
--create 로 테이블을 만들며 생성한 기본키와 외래키 등등은 필드명이 바뀌어도 설정되어 있는 기본키 외래키 속성이 그대로 승계되서 적용됨
alter table rentlist rename column booknum to bum;

--2. 필드 자료형의 변경
--ALTER TABLE 테이블명 MODIFY 필드명 자료형 디폴드 값이나 제약사항도 함께 변경이 가능합니다
--varchar2(12) 였던 memberlist 테이블의 name 필드를 varchar2(30)으로 변경
alter table memberlist modify name varchar2(30);

--booklist booknum 필드를 number(5)로 자료형 변경
alter table booklist modify booknum number(5);
--memberlist membernum 필드를 number(5)로 자료형 변경
alter table memberlist modify  membernum number(5);
--rentlist bnum 필드를 number(5)로 자료형 변경
alter table rentlist modify  bnum number(5);
--rentlist mnum 필드를 number(5)로 자료형 변경
alter table rentlist modify  mnum number(5);
--위에 4개 다안되는거

--외래키로 연결되어서 참조되고, 참조하고 있는 필드들의 위의 명령으로 수정이 불가능
--가능하려면, 외래키 제약조건을 수정하여 없애고, 참조되는 필드와 참조하는 필드를 모두 수정한 후 외래키 제약 조건을 다시 설정합니다
--alter 명령에 의해서 제약조건을 수정하는 명령을 아래에서 학습합니다


--3. 필드의 추가
--alter table 테이블명 add 필드명 자료형

--booklist 에  구매등급을 저장할 수 있는 grade 필드를 varchar2(15)로 추가
alter table booklist add grade varchar2(15);
--memberlist 에 성별(gender) 필드를 varchar2(3)으로 추가
alter table memberlist add gender varchar2(3);
--memberlist 에 나이(age) 필드를 numver(2) 로 추가
alter table memberlist add age number(2);

select * from booklist;
select * from memberlist;

--4. 필드의 삭제
--alter table 테이블명 drop column 필드명

--memberlist 테이블에서 gender 필드 삭제
alter table memberlist drop column gender;
--booklist 테이블에서 grade 필드 삭제
alter table booklist drop column grade;
--memberlist 테이블에서 age 필드 삭제
alter table memberlist drop column age;

--5. 제약조건의 추가/삭제

--필드레벨의 제약조건의 수정 ->modify 명령을 통해서 수정/생성/삭제 합니다
--생성
--check() : 괄호안의 연산식의 결과과 true 일때만 필드값으로 인정하고 입력받겠다는 제약조건의 함수
alter table memberlist modify gender varchar2(3) check (gender in('f', 'm'));
--gender in('f', 'm') : gender 필드값이 in 함수 안에있는 값들만 인정한다는 제약 'f' or 'm' 외엔 들어갈수 없음
alter table memberlist modify gender varchar2(3) check (gender='f' or gender='m');
--원래대로
alter table memberlist modify gender varchar2(3);


--테이블레벨의 제약조건의 생성/삭제
--추가 : alter table 테이블명 cdd constraint 제약조건명 제약조건식
--테이블 level 의 제약 조건은 위의 명령 형식으로 제약조건 이름과 함께 추가합니다

--memberlist 테이블의 성별 gender 필드에 'f', 'm' 두글자만 입력되도록 제약조건을 추가하세요
alter table memberlist add constraint check_gender check (gender in('f', 'm'));
--memberlist 테이블의 age 필드에 120살이 초가되는 나이는 입력하지못하게 제약조건 추가하세요
alter table memberlist add constraint check_age check(age >0 and age <=120);

select * from memberlist;

--삭제 : alter table 테이블명 drop constraint 제약조건명
--rentlist 테이블의 bnum 에 걸려 있는 외래키 제약조건 제거 (fk1)
alter table rentlist drop constraint fk1;
--rentlist 테이블의 mnum 에 걸려 있는 외래키 제약조건 제거 (fk2)
alter table rentlist drop constraint fk2;
--rentlist 테이블의 기본키 제거(rent_pk)
alter table rentlist drop constraint rent_pk;
--앞에서 필드 자료형 수정실패한 내용들 다시실행
--booklist 의 booknum 필드를 bumber(5) 로 자료형 변경
alter table booklist modify booknum  number(5);
--memberlist 의 membernum 필드를 number(5) 로 자료형 변경
alter table memberlist modify membernum  number(5);
--rentlist 의 bnum 필드를 number(5) 로 자료형 변경
alter table rentlist modify bnum number(5);
--rentlist 의 mnum 필드를 number(5) 로 자료형 변경
alter table rentlist modify mnum number(5);
--rentlist 의 기본키를 numbseq 로 설정
alter table rentlist add constraint rent_pk primary key(numseq); 
--rentlist 의 외래키 fk1, fk2 재설정
alter table rentlist add constraint fk1;
foreign key(bnum) references booklist (booknum);
alter table rentlist add constranint fk2;
foreign  key(mnum) references memberlist(membernum);


--테이블 생성 EX
--테이블명 : orders1
--필드 : order_id number(12, 0) order_date date
--order_mode varchar2(8) customer_id number(6, 0)
--order_status number(2, 0) order_totle number(8, 2)
--sales_rep_id number(6, 0) promotion_id number(6, 0)
--제약사항 : 기본키는 order_id - 테이블레벨 (제약명 : pk_order)
--   order_mode에는 'direct' 'online'만 입력가능 - 테이블 레벨(제약명 : ck_order_mode)
-- order_totle의 디폴드 값은 0 - 필드레벨

create table orders1(
   order_id number(12, 0),
   order_date date,
   order_mode varchar2(8),
   customer_id number(6, 0),
   order_status number(2, 0),
   order_totle number(8, 2),
   sales_rep_id number(6, 0),
   promotion_id number(6, 0),
   constraint pk_order primary key(order_id),
   constraint ck_order_mode check(ck_order_mode in('direct', 'online'))
);

--테이블 수정 EX
--customer_id 필드명을 customer_number 로 수정
alter table orders1 rename column customer_id to customer_number;
--promotion_id 값은 10000~99999 값만 저장 가능
alter table orders1 add constraint promotion_id check(promotion_id between 10000 and 99999);
-- between 10000 and 99999 : 10000~99999 라는뜻

--테이블의 복사
create table orders2 as select * from orders1;
--as select 구분은 select 이후 공부함
select * from orders2;

--테이블의 제거
drop table orders2 purger; --purge 는 생략가능
--purge를 생략하면 나중에 복구가능 purge 를쓰면 완전삭제





