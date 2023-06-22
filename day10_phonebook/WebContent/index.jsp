<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>phonebook SQL</h3>

<pre>
drop sequence phonebook_seq;
drop table phonebook;

create sequence phonebook_seq;
	start with 1
	maxvalue 99999
	increment by 1
	nocache
	nocycle;
	
create table phonebook (
	idx			number			default phonebook_seq.nextval primary key,
	name		varchar2(50)	not null,
	pnum		varchar2(20)	not null,
	bookmark	number(1)		default -1 check(bookmark between 1 and -1)
);

insert into phonebook (name, pnum) values ('이지은', '010-1234-1234');
insert into phonebook (name, pnum) values ('홍진호', '010-2222-2222');
insert into phonebook (name, pnum) values ('나단비', '010-3333-4455');
insert into phonebook (name, pnum) values ('신짱구', '010-1212-1212');
insert into phonebook (name, pnum) values ('김철수', '010-1313-1313');

commit;

select * from phonebook order by bookmark, idx;

</pre>
</body>
</html>