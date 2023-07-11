-- 09_Group_Function.sql

-- sum() : 특정 필드의 합계
select sum( rentprice ) as "대여가격 합계" from  booklist
select sum( rentprice ) as "대여가격 합계" from  booklist where inprice >=18000

-- count(*) : 필드내의 데이터 갯수(레코드 갯수)
select count(*) as "회원인원수" from memberlist
select count(*) as "회원인원수" from memberlist where bpoint >=2000

--avg : 평균
SELECT round( AVG( INPRICE ) , 0 )  FROM booklist;

--MAX : 최대값
SELECT MAX(INPRICE) FROM booklist

--MIN : 최소값
SELECT MIN(INPRICE) FROM booklist

--  VARIANCE(분산), STDDEV(표준편차)
SELECT VARIANCE(salary), STDDEV(salary)  FROM employees; 
select salary from EMPLOYEES



-- group by : 하나의 필드를 지목해서 같은 값끼리 그룹을 형성한 결과를 도출합니다
-- 도서별 대여 건수
select count(*) from rentlist;   --전체 대여건수
select bnum, count(*) from rentlist group by bnum;  
-- 각 도서별 대여건수:한번도 대여안된 도서제외
-- *** group by 에 사용된 필드는 select 와 from 사이에 반드시 표기되어야 합니다. ( * 라도 써서 포함시킵니다 )


-- rentlist 날짜별 할인금액의 평균
select rentdate, avg(discount) as "할인금액평균" from rentlist group by rentdate order by rentdate
-- rentlist 날짜별 대여 건수
select rentdate, count(*) as "대여건수" from rentlist group by rentdate order by rentdate
-- employees 테이블의  부서id(department_id)별 급여(salary)의 평균
select * from employees;
select department_id, round( avg(salary) , 0) from employees group by department_id;


-- kor_loan_status 테이블의   period( 년도와 월 ) 을 1차 그룹으로  region(지역) 을 2차 그룹으로한
-- 대출 잔액(loan_jan_amt)의 합계
select * from kor_loan_status;

select period, region , sum( loan_jan_amt ), count(*)
from kor_loan_status
group by period, region
order by period, region



-- HAVING 절 : 그룹핑된 내용들에 조건을 붙일때
-- 날짜별 할인금액의 평균을 출력합니다. 다만 그 평균 금액이 150 미만인 그룹만 출력
select rentdate as 날짜,  avg(discount) as 할인평균 from RENTLIST
group by rentdate
having avg(discount)<180;

-- kor_loan_status 테이블의  날짜별 대출 잔액의 합계 중 period 가  2013년 11월 인 데이터만 출력
SELECT period, region, SUM(loan_jan_amt) as total_jan, count(*) as 건수
FROM kor_loan_status
WHERE period = '201311' 
GROUP BY period, region
HAVING SUM(loan_jan_amt) >= 100000
ORDER BY region;





















