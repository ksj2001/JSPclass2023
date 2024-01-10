-- 회원가입 테이블
create table member(
id varchar(20) primary key,
pw varchar(20),
email varchar(50),
tel varchar(20),
hobby varchar(60),
job varchar(15),
age varchar(10),
info varchar(500)
);

-- 상품 테이블
create table rentcar(
no int,
name varchar(20),
category int,
price int,
usepeople int,
company varchar(50),
img varchar(50),
info varchar(500));

insert into rentcar values(1 , '아반테1' , 1 , 2000 , 4 , '현대' , '1.jpg' , '아반테1 자동차 입니다 .');
insert into rentcar values(2 , '아반테2' , 3 , 3000 , 2 , '현대' , '2.jpg' , '아반테2 자동차 입니다 .');
insert into rentcar values(3 , '아반테3' , 2 , 3500 , 3 , '현대' , '3.jpg' , '아반테3 자동차 입니다 .');
insert into rentcar values(4 , '아반테4' , 1 , 4000 , 4 , '현대' , '4.jpg' , '아반테4 자동차 입니다 .');
insert into rentcar values(5 , '아반테5' , 3 , 5000 , 3 , '현대' , '5.jpg' , '아반테5 자동차 입니다 .');

insert into rentcar values(6 , '무쏘1' , 1,  2500 , 3 , '쌍용' , '6.jpg' , '무쏘1 자동차 입니다 .');
insert into rentcar values(7 , '무쏘2' , 3 , 3000 , 2 , '쌍용' , '7.jpg' , '무쏘2 자동차 입니다 .');
insert into rentcar values(8 , '무쏘3' , 2 , 3500 , 4 , '쌍용' , '8.jpg' , '무쏘3 자동차 입니다 .');
insert into rentcar values(9 , '무쏘4' , 2 , 4000 , 4 , '쌍용' , '9.jpg' , '무쏘4 자동차 입니다 .');

insert into rentcar values(10 , 'sm5_1' , 1 , 2000, 4 , '삼성' , '10.jpg' ,  'sm5_1 자동차 입니다 .');
insert into rentcar values(11 , 'sm5_2' , 3 , 2500 , 4 , '삼성' , '11.jpg' , 'sm5_2 자동차 입니다 .');
insert into rentcar values(12 , 'sm5_3' , 2 , 3000 , 4 , '삼성' , '12.jpg' , 'sm5_3 자동차 입니다 .');
insert into rentcar values(13 , 'sm5_4' , 2 , 4000 , 4 , '삼성' , '13.jpg' , 'sm5_4 자동차 입니다 .');
insert into rentcar values(14 , 'sm5_5' , 1 , 5000 , 4 , '삼성' , '14.jpg' , 'sm5_5 자동차 입니다 .');

insert into rentcar values(15,  '카마로1' , 3 , 1500 , 4 , 'GM' , '15.jpg' , '카마로1 자동차 입니다 .');
insert into rentcar values(16 , '카마로2' , 1 , 2000, 4 , 'GM' , '16.jpg' , '카마로2 자동차 입니다 .');
insert into rentcar values(17,  '카마로3' , 2 , 2500 , 4 , 'GM' , '17.jpg' , '카마로3 자동차 입니다 .');
insert into rentcar values(18,  '카마로4' , 2 , 3000 , 4 , 'GM' , '18.jpg' , '카마로4 자동차 입니다 .');
insert into rentcar values(19,  '카마로5' , 3 , 3500 , 4 , 'GM' , '19.jpg' , '카마로5 자동차 입니다 .');
insert into rentcar values(20,  '카마로6' , 1 , 4000 , 4 , 'GM' , '20.jpg' , '카마로6 자동차 입니다 .');
insert into rentcar values(21,  '카마로7' , 3 , 4500 , 4 , 'GM' , '21.jpg' , '카마로7 자동차 입니다 .');
insert into rentcar values(22,  '카마로8' , 2 , 5000 , 4 , 'GM' , '22.jpg' , '카마로8 자동차 입니다 .');

insert into rentcar values(23, '쏘랜토1' , 2 , 2000 , 4 , '기아' , '23.jpg' , '쏘랜토1 자동차 입니다 .');
insert into rentcar values(24, '쏘랜토2' , 3 , 3000 , 4 , '기아' , '24.jpg' , '쏘랜토2 자동차 입니다 .');
insert into rentcar values(25, '쏘랜토3' , 1 , 3500 , 4 , '기아' , '25.jpg' , '쏘랜토3 자동차 입니다 .');
insert into rentcar values(26, '쏘랜토4' , 3 , 4000 , 4 , '기아' , '26.jpg' , '쏘랜토4 자동차 입니다 .'); 

-- 장바구니 테이블
create table rentjang(
no int,
img varchar(50),
name varchar(20),
cnt int,
price int);

-- 상품구매 테이블
create table order_product(
order_date date,
order_no int,
no int,
img varchar(50),
name varchar(20),
cnt int,
price int,
total int,
id varchar(50),
primary key(order_date,order_no,no));

-- 상품구매 배송지 테이블
create table order_address(
order_date date,
order_no int,
buy_name varchar(20),
buy_phone varchar(20),
buy_email varchar(50),
buy_postcode int,
buy_roadaddress varchar(100),
id varchar(50),
primary key(order_date,order_no));