--12_View.sql

-- * 오라클 - 뷰(View)
--    물리적인 테이블에 근거한 논리적인 "가상 테이블."  -> 저장되어 있는 select 문
--   '가상'이란 단어는 실질적으로 데이터를 저장하고 있지 않기 떄문에 붙인 것이고,
--   '테이블'이란 단어는 실질적으로 데이터를 저장하고 있지 않더라도,
--    테이블을 사용하는 것과 동일하게 뷰를 사용할 수 있기 떄문에 붙인 것.
--    뷰는 기본테이블에서 파생된 객체로써, 기본 테이블에 대한 하나의 쿼리문임.
--    실제 테이블에 저장된 데이터를 뷰를 통해서 볼 수 있도록 함.
--    사용자에게 주어진 뷰를 통해서 기본 테이블을 제한적으로 사용하게 됨
--    뷰는 이미 존재하고 있는 테이블에 제한적으로 접근하도록 한다.
--    뷰를 생성하기 위해서는 실질적으로 데이터를 저장하고 있는,  
--    물리적인 테이블이 존재해야 하는데, 이 테이블을 "기본 테이블"이라고 함. 


--    뷰 생성 방법
--    create or replace view 뷰 이름 as select 조회 명령....
--    -> 결과는 select 의 결과를 테이블로 내어 놓는 가상테이블 제작 명령이 생기는 셈
--    뷰 이름으로 조회명령을 저장하고 있다가, 뷰 이름으로 조회 할 때 마다 조회 명령이 실행되어 결과를 내놓습니다
 
create or replace view result_inner_join as
select a.empno, a.ename, a.job, a.hiredate, a.deptno, b.dname, b.loc
from emp a, dept b
where a.deptno = b.deptno;

select * from result_inner_join where job='MANAGER';