-- sql.sql

create or replace view rentDetail as
select c.numseq, to_char( c.rentdate, 'YYYY-MM-DD' ) as rentdateStr , 
	c.bnum, a.subject, c.mnum, b.name, a.rentprice, c.discount, 
	a.rentprice-c.discount as amount
from booklist a, memberlist b, rentlist c
where a.booknum = c.bnum and b.membernum=c.mnum;

select * from rentDetail;

update rentlist set discount=200 where numseq=11;