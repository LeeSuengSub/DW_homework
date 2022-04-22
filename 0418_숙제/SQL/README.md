### 테이블 설명

    상원아이티는 아프리카에 차량렌트사업을 하려고 한다.
    아프리카는 도난률이 높아 렌트차량에 IoT디바이스를 부착시켜 실시간으로 위치를 추적하려고 한다.
    devices는 IoT디바이스 정보가 저장.
    car_information는 렌트 차량 정보가 저장.
    단, 디바이스가 부착된 렌트 차량 정보만 저장할 수 있다.
    car_event_log은 IoT디바이스가 부착된 렌트차량 이벤트(운행기록)가 저장.

## 문제

1. 차량 수 조회

```
select
count(car_number)
from car_information

```

2. 차량에 부착된 디바이스 uuid, battery, create_at 조회.

```
select
device_uuid ,
battery ,
create_at
from devices

```

3. UUID '20130099', 배터리 100, 펌웨어 버전 '1.0.1', 사용여부 TRUE인 디바이스를 devices에 등록하시오.

```
insert into devices
(device_uuid,battery,firmware_ver,is_use)
values
("20130099",100,"1.0.1",TRUE)
```

4. 2022-04-11 이후 탈착 이벤트가 1건 이상 발생된 UUID, 펌웨어 버전 조회.

```
select
d.firmware_ver ,
ci.device_uuid
from car_event_log cel
inner join car_information ci
on cel.car_number = ci.car_number
inner join devices d
on d.device_uuid  = ci.device_uuid
where cel.event_type = 3
and cel.create_at >= "2022-04-11"
```

5. 2022-04-11 ~ 2022-04-13 일별 이벤트 카운트 조회.

```
select
count(create_at),
create_at
from car_event_log
where create_at >='2022-04-11'
or create_at <='2022-04-13'
group by date_format(create_at,"%dd")
```

6. 전체 디바이스 수, 차량에 부착된 디바이스 수, 차량에 부착하지 않은 디바이스 수 조회.

```

```

7. 차량번호 '359서 9096'의 2022-04-11 ~ 2022-04-13일까지 이벤트별 카운트 조회

```
select
cel.event_type,
count(cel.event_type)
from car_event_log cel
inner join car_information ci
on cel.car_number = ci.car_number
where ci.car_number = "359서 9096"
and (cel.create_at >='2022-04-11'
or cel.create_at <= '2022-04-13')
group by cel.event_type
```

8. UUID가 '20133344'인 디바이스의 2022-04-11 ~ 2022-04-13에 발생한 이벤트타입, 이벤트 날짜, 차량번호판, 담당자 조회.

```
select
cel.event_type ,
cel.create_at ,
cel.car_number ,
ci.admin_name
from devices d
inner join car_information ci
on d.device_uuid = ci.device_uuid
inner join car_event_log cel
on ci.car_number = cel.car_number
where d.device_uuid = '20133344'
and
(cel.create_at >= '2022-04-11'
or cel.create_at <= '2022-04-13')
order by cel.create_at asc
```
