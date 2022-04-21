--1. 탈퇴하지 않은 고객 아이디와 이름, 등급 조회.
select 
	customer_id,
	customer_name,
	grade 
from customer
where is_use = false;

--2. '2021-12-09' 이후에 가입한 고객 수 조회.
select 
	count(*)
from customer
where date_format(create_at,'%Y-%m-%d') > '2021-12-09';

--3. 구매이력이 있는 고객 아이디와, 이름, 구매날짜, 비용 조회.
select 
	c.customer_id,
	c.customer_name,
	chp.create_at,
	chp.cost 
from customer as c
inner join customer_history_purchase chp 
on c.customer_id = chp.customer_id;

--4. 등록된 고객 중 한 번도 구매 이력이 없는 고객 아이디, 이름, 회원 탈퇴 여부 조회.
select 
	c.customer_id,
	c.customer_name,
	c.is_use 
from customer as c
left join customer_history_purchase chp 
on c.customer_id = chp.customer_id
where chp.cost is null;

--5. '2022-01-03'기준 고객 아이디별 구매 건수와 총 비용, 이름, 등급 조회.
select
	c.customer_name,
	c.grade,
	count(chp.customer_id),
	sum(chp.cost)
from customer as c
inner join customer_history_purchase chp 
on c.customer_id = chp.customer_id
group by chp.customer_id ;

--6. '2022-01-03'기준 3번 이상 구매한 고객 아이디, 이름, 등급 조회.
select
	c.customer_id,
	c.customer_name,
	c.grade
from customer as c
inner join customer_history_purchase chp 
on c.customer_id = chp.customer_id
where date_format(chp.create_at,'%Y-%m-%d') = '2022-01-03'
group by chp.customer_id
having count(chp.customer_id) >= 3

--7. 고객번호가 5194998인 고객 등급을 골드로 업데이트 하시오.
update customer
set grade = '골드'
where customer_id = '5194998'