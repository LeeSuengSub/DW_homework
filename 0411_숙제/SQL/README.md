### 테이블 설명

    customer 테이블은 고개데이터를 저장하는 테이블.
    고객이 비용을 지불하면 customer_history_purchase 테이블에 저장된다.
    등록된 고객만 구매할 수 있다.

## 문제

1. 탈퇴하지 않은 고객 아이디와 이름, 등급 조회.

```
select
customer_id ,
customer_name ,
grade
from customer
where is_use =false
```

- 디비버에서 false 대신에 1로 입력해도 나옴.  
  0: true,  
  1: false

```
select
customer_id ,
customer_name ,
grade
from customer
where is_use =1
```

2. '2021-12-09' 이후에 가입한 고객 수 조회.

```
select
count(customer_id)
from customer
where create_at >="2021-12-09"
```

- date_format활용

```
select
count(customer_id)
from customer
where create_at >= date_format(create_at,"2021-12-09")
```

3. 구매이력이 있는 고객 아이디와, 이름, 구매날짜, 비용 조회.

```
select
c.customer_id ,
c.customer_name ,
chp.create_at ,
chp.cost
from customer c
inner join customer_history_purchase chp
on c.customer_id  = chp.customer_id

```

- 구매금액 합산

```
select
c.customer_id ,
c.customer_name ,
chp.create_at ,
sum(chp.cost)
from customer c
inner join customer_history_purchase chp
on c.customer_id  = chp.customer_id
group by customer_id
```

4. 등록된 고객 중 한 번도 구매 이력이 없는 고객 아이디, 이름, 회원 탈퇴 여부 조회.

```
select
c.customer_id ,
c.customer_name ,
c.is_use
from customer c
left join customer_history_purchase chp
on c.customer_id  = chp.customer_id
where chp.history_no is null
```

5. '2022-01-03'기준 고객 아이디별 구매 건수와 총 비용, 이름, 등급 조회.

```
select
c.customer_id ,
count(*),
sum(chp.cost),
c.customer_name ,
c.grade
from customer c
inner join customer_history_purchase chp
on c.customer_id  = chp.customer_id
where chp.create_at >=date_format(c.create_at,"2021-01-03")
group by c.customer_id

```

6. '2022-01-03'기준 3번 이상 구매한 고객 아이디, 이름, 등급 조회.

```
select
c.customer_id ,
c.customer_name ,
c.grade
from customer c
inner join customer_history_purchase chp
on c.customer_id  = chp.customer_id
where chp.create_at >=date_format(c.create_at,"2021-01-03")
group by c.customer_id
having count(*) > 3

```

7. 고객번호가 5194998인 고객 등급을 골드로 업데이트 하시오.

```
update customer
set grade = '골드'
where customer_id = '5194998'
```
