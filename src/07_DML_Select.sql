--오라클 명령어 : select 문(검색)
-- 가장 사용빈도수가 높은 명령

--[1] scott 사용자가 관리하고 있는 테이블 목록
select * from tab;
select * from tabs;

select * from memberlist;

--[2] 특정 테이블의 구조 조회(필드 리스트/데이터 형식)
desc dept;  -- 커멘드 창(sqlplus)에서 확인 요망
desc memberlist; -- 커멘드 창(sqlplus)에서 확인 요망

--[2] 특정 테이블의 구조 조회(필드 리스트/데이터 형식)
desc dept;  -- 커멘드 창(sqlplus)에서 확인 요망
desc memberlist; -- 커멘드 창(sqlplus)에서 확인 요망

-- SELECT : select 와 from 사이에 조회하고자 하는 필드명들을 ,로 구분하여 지목
	-- select booknum, subject, rentprice from booklist;
	-- 모든 필드를 한번에 지목하려면   * 을 써줍니다   	-- select * from...
	-- from 뒤에는 대상 테이블 명을 써줍니다.
	-- where 절을 붙여서 조건에 맞는 행만 골라내기도 합니다.
	-- select ... from... where ...
	
	-- 아래와 같이 연산식을 써서 연산된 결과를 필드로 조회하고자 할땐 as 와 함께 만들어진 필드명을 
	-- 지어주기도 합니다
	select empno || '-' || ename as emp_info  from emp
	-- 오라클 SL 에서  || 는 이어붙이기 연산입니다.
	-- empno || '-' || ename : empno 값과 ename 값을 '-' 와 함께 이어 붙이기 하고 그렇게 
	-- 만들어진 필드의 이름을 emp_info 로 설정합니다
	-- 필드명에 공백이 있거나 기술하기 어려운 필드명일때도 as로 별칭을 붙이기도 합니다.
	
	select empno as "사원 번호" , ename as 사원성명   from emp
	select MGR as manager_empno from emp


--[3] 특정 테이블의  모든 DATA 표시
select * from rentlist

--[4] 모든 컬럼(필드명)이 아닌 , 필요한 필드만 조회
select subject, makeyear from booklist;
	
--[5] 각각의 필드명에 별칭을 부여해서 출력
select subject as 도서제목, makeyear as 출판년도 from booklist;
	
--[6] 중복 제거 : distinct
select distinct bnum from rentlist
-- rentlist 에서 membernum 을 중복 제거후 조회하세요
select distinct mnum from rentlist


--[7] 검색 조건의 추가 : 
--     booklist 에서 입고가격이 20000원 이상인 도서의 모든 필드
select * from booklist where inprice>=20000

--[8] memberlist 테이블에서  이름이 '홍'으로 시작하는  회원의 모든 회원정보 출력
select * from memberlist where name like '홍%';

--[9] memberlist 테이블에서 1983년도 이후로 태어난 회원의 모든 회원정보
select * from memberlist where birth >= '1983-01-01';	
	
--[10] memberlist 테이블에서 사은포인트(BPOINT)가 250점 이상이고 1982년 이후로 태어난회원의 모든 회원정보
--      (and,or 연산자 사용)	
select * from memberlist where bpoint>=250 and birth>='1982-01-01';
	
--[11] booklist 에서 제작년도가 2016년 이전이거나  입고가격(inprice)이 18000 이하인 book 정보
select * from booklist where makeyear<2016 or inprice <= 18000

--[12] memberlist 테이블에서 성명이 '이'로 시작하는 회원의 모든 정보	
select * from memberlist where name like '이%';

--[13] memberlist 테이블에서 이름이 '용'으로 끝나는 회원의 정보
select * from memberlist where name like '%용';

--[14] 도서 제목에 '이'가 포함되는 도서 정보
select * from booklist where subject like '%이%';

--[15] memberlist 에서 성별이 NULL 이 아닌 회원의이름과 전화번호
select * from memberlist where gender is NULL; 
select * from memberlist where gender is not NULL; 
-- ~와 같다 : =   ,    ~와 같지 않다 : <> 

-- 성별이 널인것을 모두 M 으로 수정해주세요
update memberlist set gender='M' where gender is NULL;
select * from memberlist;

--[16] booklist 에서 도서 제목에 두번째 글자가 '것' 인 도서 정보
select * from booklist where subject like '_것%';



-- emp 테이블에서 deptno  가 10, 20 , 30   중 하나인 데이터 모두
select * from emp where deptno=10 or deptno=20 or deptno=40;

-- 조건식( ANY, SOME, ALL , (IN) )
--1. ANY
select * from emp where deptno = any(10,20,40);
-- ANY() : 괄호안에 나열된 내용중 어느하나라도 해당하는 것이 있다면 검색 대상으로 함
select * from emp where deptno in(10,20,40);

--2. --SOME 조건식 - ANY와 동일 
SELECT *  FROM emp WHERE deptno = some(10,20,40);

--3  ALL
SELECT *  FROM emp WHERE deptno = all(10,20,40);
-- 괄호안의 모든값이 동시 만족해야하는 조건이므로 해당하는 레코드가 없을때가 대부분입니다.  사용빈도수가 현저히 낮습니다
SELECT *  FROM emp WHERE deptno  <>  all(10,20,40);
-- 이외 같이 구성내용과 모두 같지 않을때를 필터링할때 사용합니다
SELECT *  FROM emp WHERE deptno NOT in(10,20,40);



-- 정렬(Sort) - where 구문 뒤에, 또는 구문의 맨 끝에 Oder by 필드명 [desc]
-- select 명령의 결과를 특정 필드값의 오름차순 이나 내림 차순으로 정렬하라는 명령
-- asc :오름차순 정렬 , 쓰지 않으면 기본 오름차순 정렬로 실행됩니다
-- desc : 내림차순 정렬, 내림 차순 정렬을 위해서는 반드시 필드명 되에 써야하는 키워드 입니

-- emp 테이블에서
-- sal이 1000 이상인 데이터를 ename 의 오름차순으로 정렬하여 조회
select * from emp where sal>=1000 order by ename;
-- sal이 1000 이상인 데이터를 ename 의 내림차순으로 정렬하여 조회
select * from emp where sal>=1000 order by ename desc;

-- emp 테이블의 모든 데이터를 표시하되 job으로로 내림차순 정렬
select * from emp order by job desc;

-- job 으로 내림차순 정렬후 같은 job_id 사이에서는 순서를 hiredate 의 내림차순으로 정렬
select * from emp order by job desc, hiredate desc;
-- 두가 이상의 정렬 기준이 필요하다면 위와 같이 컴마(,)로 구분해서 두가지 기준을 지정해주며,
-- 위의 예제로 봤을때 job 으로 1차 내림 차순 정렬하고, 같은 job 값들 사이에 hiredate 로 내림차순정렬합니다


-- 그 외 활용하기 좋은 select 에 대한 예제

-- 부서번호가 10이 아닌 사원 (아래 두 문장은 같은 의미의 명령입니다)
select * from emp where not (DEPTNO=10);
select * from emp where DEPTNO<>10;


-- 급여가 1000달러 이상 , 3000달러 이하
select * from emp where SAL>=1000 and SAL<=3000;
select * from emp where SAL  between 1000 and 3000;



-- 특정 필드값이 널인 레코드 또는 널이 아닌 레코드
select * from emp where comm is null   --  comm 필드가 null 인 레코드
select * from emp where comm is not null  -- comm 필드가 null 이 아닌 레코드

--사원의 연봉 출력
select deptno, ename, sal*12+comm as 연봉 from emp;
--comm 값이 null 경우  위의 계산에 오류가 발생합니다. 이를 해결하기 위한 방법
select deptno, ename, sal*12+nvl(comm, 500) as 연봉 from emp; 
-- nvl 함수는 널값을 다른 값으로 바꿔주는 내장함수로서 다음 단원에서 다른 함수들과 함께 학습합니다

select * from emp;






	
	








