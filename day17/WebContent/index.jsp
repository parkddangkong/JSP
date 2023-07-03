<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<details>
	<summary><b>SQL</b></summary>
<pre>
drop table product;
drop table sales;

drop sequence product_seq;
drop sequence sales_seq;

create sequence product_seq
	start with 1
	maxvalue 9999
	increment by 1
	nocache
	nocycle;

create sequence sales_seq
	start with 1
	maxvalue 9999
	increment by 1
	nocache
	nocycle;

create table product (
	idx	number		default product_seq.nextval primary key,
	name	varchar2(100)	not null,
	price	number		check(price > 0)
);

create table sales (
	idx	number		default sales_seq.nextval primary key,
	product	number		not null,
	sDate	date		default sysdate,
	cnt	number		check(cnt > 0),

	constraint sales_product_fk	-- 제약조건을 만든다. 이름은 sales_product_fk
	foreign key(product)		-- 현재 테이블에서 제약조건을 설정할 컬럼은 product
	references product(idx)		-- 외래키로써 참조하는 대상 컬럼은 product테이블의 idx
	on delete cascade		-- 삭제 시 종속 삭제 (상품이 제거되면 매출도 제거된다)
);

insert into product (name, price) values ('월드콘', 1700);	-- idx: 1
insert into product (name, price) values ('콘칩', 1500);		-- idx: 2
insert into product (name, price) values ('테라 (캔)', 2700);	-- idx: 3
insert into product (name, price) values ('대선', 2200);		-- idx: 4

insert into sales (product, cnt) values (1, 5);
insert into sales (product, cnt) values (3, 6);
insert into sales (product, cnt) values (4, 10);
insert into sales (product, cnt) values (2, 1);
insert into sales (product, cnt) values (5, 5);

commit;

select * from product;
select * from sales;


</pre>
</details>

</body>
</html>