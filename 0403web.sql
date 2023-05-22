create table boardtab (
num			number			not null	primary key,
subject			varchar2(100)	not null,
writer			varchar2(15)	not null,
mail			varchar2(30),
password		varchar2(10)	not null,
content			varchar2(2000),
hit				number			not null,
wip				char(15)		not null,
wdate			date			not null
);

create table replytab(
renum  number              not null primary key,
bonum  number              not null,
name   varchar2(15)        not null,
cont   varchar2(1000)      not null,
redate   date			  not null,
CONSTRAINT ARE_BONUM FOREIGN KEY(BONUM)
REFERENCES BOARDTAB(NUM)
ON DELETE CASCADE 
);

commit;

������ ����
create sequence boardtab_num_seq nocache;
create sequence replytab_renum_seq nocache;

insert into boardtab values (boardtab_num_seq.nextval, '����1', '�̸�1', 'test1@test.com', '1234', '����1', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����2', '�̸�2', 'test2@test.com', '1234', '����2', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����3', '�̸�3', 'test3@test.com', '1234', '����3', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����4', '�̸�4', 'test4@test.com', '1234', '����4', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����5', '�̸�5', 'test5@test.com', '1234', '����5', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����6', '�̸�6', 'test6@test.com', '1234', '����6', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����7', '�̸�7', 'test7@test.com', '1234', '����7', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����8', '�̸�8', 'test8@test.com', '1234', '����8', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����9', '�̸�9', 'test9@test.com', '1234', '����9', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����10', '�̸�10', 'test10@test.com', '1234', '����10', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����11', '�̸�11', 'test11@test.com', '1234', '����11', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����12', '�̸�12', 'test12@test.com', '1234', '����12', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����13', '�̸�13', 'test13@test.com', '1234', '����13', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����14', '�̸�14', 'test14@test.com', '1234', '����14', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����15', '�̸�15', 'test15@test.com', '1234', '����15', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����16', '�̸�16', 'test16@test.com', '1234', '����16', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����17', '�̸�17', 'test17@test.com', '1234', '����17', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����18', '�̸�18', 'test18@test.com', '1234', '����18', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����19', '�̸�19', 'test19@test.com', '1234', '����19', 0, '000.000.000.000', sysdate);
insert into boardtab values (boardtab_num_seq.nextval, '����20', '�̸�20', 'test20@test.com', '1234', '����20', 0, '000.000.000.000', sysdate);

select * from boardtab order by num desc;

select rownum as rnum, B.*  from (
         select * from boardtab order by num desc) B
    where rownum <= 5;
    
select A.* from (
      select rownum as rnum, B.* from (
          select * from boardtab 
          where content like '%4%' -- �Ķ���� Map���� ǥ��
          order by num desc) B
   --<![CDATA[
      where rownum <= 3) A 
   where A.rnum >=1;
 -- ]]>
 
select * from boardtab 
  where writer like '%4%'
 order by num desc;
 
select A.* from 
     (select rownum as rnum , B.* from
        ( select * from aboard 
          <include refid="dynamicCondition"/> 
               order by  num desc ) B 
    <![CDATA[
          where rownum <= #end#) A
       where A.rnum >= #start# 
     ]]>            
</select>

select count(*) from boardtab
 where writer like '%1%';
 
 select A.* from
	     (select rownum as rnum , B.* from
	        ( select * from boardtab
	         
	               order by num desc ) B 
	
	          where rownum <= 6) A
	       where A.rnum >= 4 ;
	   
 
 
 