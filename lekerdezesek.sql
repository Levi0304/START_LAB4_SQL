drop schema if exists konyvtar;
CREATE SCHEMA konyvtar DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
use konyvtar;

drop table konyv_szerzo;
drop table kolcsonzesek;
drop table tag;
drop table konyv;
drop table szerzo;



create table konyv
( isbn numeric(10,0) primary key,
  cim varchar(30),
  nyelv varchar(10),
  ar numeric(6,0),
  megjelenes date,
  kiado varchar(30),
  leiras varchar(1500)
);

create table szerzo
( id numeric(10,0) primary key,
  vezeteknev varchar(30),
  keresztnev varchar(30),
  nemzetiseg varchar(10)
);

create table konyv_szerzo
( id numeric(10,0) primary key,
  konyvisbn numeric(10,0),
  szerzoid numeric(10,0),
  reszesedes numeric(3,2),
  foreign key(konyvisbn) references konyv(isbn),
  foreign key(szerzoid) references szerzo(id)
);

create table tag
( id numeric(10,0) primary key,
  vezeteknev varchar(30),
  keresztnev varchar(30),
  iranyitoszam numeric(4,0),
  varos varchar(20),
  utca varchar(40),
  tagsagiervenyes date,
  MaxKolcsonzes numeric(4,0)
);

create table kolcsonzesek
( id numeric(10,0) primary key,
  konyvisbn numeric(10,0),
  tagid numeric(10,0),
  kiviteldatum date,
  lejaratdatum date,
  visszahozataldatum date,
  foreign key(konyvisbn) references konyv(isbn),
  foreign key(tagid) references tag(id)
);

insert into tag values(7,'Kelemen','András',1958,'Budapest','Király u. 1',adddate(curdate(),100),5);
insert into tag values(6,'Balogh','Péter',2440,'Százhalombatta','Kodály u. 55',adddate(curdate(),100),5);
insert into tag values(5,'Sokadik','Béla',2440,'Kerecsend','Kodály u. 45/b',adddate(curdate(),100),5);
insert into tag values(4,'Nagy','Gábor',2040,'Budaörs','Fõ u. 45',adddate(curdate(),-200),5);
insert into tag values(3,'Kovách','István',1074,'Budapes','Liliom u 14',adddate(curdate(),100),5);
insert into tag values(2,'Kovács','Jenõ',2030,'Érd','Kökörcsin u 23',adddate(curdate(),-100),5);
insert into tag values(1,'Kováts','Béla',1111,'Budapest','Kiss u. 11',adddate(curdate(),100),5);

insert into szerzo values(3,'Kiss','Balázs','Magyar');
insert into szerzo values(10,'Közepes','János','Magyar');
insert into szerzo values(9,'Nagy','Péter','Magyar');
insert into szerzo values(8,'Abramson','Ian','Angol');
insert into szerzo values(7,'Taub','Ben','Angol');
insert into szerzo values(6,'Hoffer','Jeffrey','Angol');
insert into szerzo values(5,'Prescott','Mary','Angol');
insert into szerzo values(4,'McFadden','Fred','Angol');
insert into szerzo values(2,'Jókai','Mór','Magyar');
insert into szerzo values(1,'Rejtõ','Jenõ','Magyar');

insert into konyv values(5,'Data Warehousing','Angol',35000,str_to_date('1998.10.05','%Y.%m.%d'),'OraclePress',null);
insert into konyv values(4,'Modern Database Managmet','Angol',15000,str_to_date('2000.11.15','%Y.%m.%d'),'Addison-Wesley',null);
insert into konyv values(3,'Három testõr Afrikában','Magyar',350,str_to_date('1998.05.05','%Y.%m.%d'),'Panem',null);
insert into konyv values(2,'Kõszívû ember fiai','Magyar',1000,str_to_date('1985.10.05','%Y.%m.%d'),'Szépirodalmi',null);
insert into konyv values(1,'Adatbázisok','Magyar',1500,str_to_date('1999.10.05','%Y.%m.%d'),'Mûszaki','Jó kis könyv');

insert into konyv_szerzo values(10,5,8,.2);
insert into konyv_szerzo values(9,5,7,.3);
insert into konyv_szerzo values(8,5,6,.3);
insert into konyv_szerzo values(7,4,6,.2);
insert into konyv_szerzo values(6,4,5,.4);
insert into konyv_szerzo values(5,4,4,.4);
insert into konyv_szerzo values(4,3,1,1);
insert into konyv_szerzo values(3,2,2,1);
insert into konyv_szerzo values(2,1,10,.3);
insert into konyv_szerzo values(1,1,3,.7);

insert into kolcsonzesek values(14,4,6,adddate(curdate(),-35),adddate(curdate(),-5),null);
insert into kolcsonzesek values(13,4,1,adddate(curdate(),-60),adddate(curdate(),-40),adddate(curdate(),-10));
insert into kolcsonzesek values(12,4,5,adddate(curdate(),-25),adddate(curdate(),+5),null);
insert into kolcsonzesek values(11,3,5,adddate(curdate(),-35),adddate(curdate(),-5),adddate(curdate(),-8));
insert into kolcsonzesek values(10,3,4,adddate(curdate(),-45),adddate(curdate(),-10),adddate(curdate(),-17));
insert into kolcsonzesek values(9,3,1,adddate(curdate(),-45),adddate(curdate(),-10),adddate(curdate(),-12));
insert into kolcsonzesek values(8,3,2,adddate(curdate(),-45),adddate(curdate(),-10),adddate(curdate(),-15));
insert into kolcsonzesek values(7,3,3,adddate(curdate(),-45),adddate(curdate(),-10),adddate(curdate(),-14));
insert into kolcsonzesek values(6,2,3,adddate(curdate(),-45),adddate(curdate(),-10),adddate(curdate(),-8));
insert into kolcsonzesek values(5,2,2,adddate(curdate(),-45),adddate(curdate(),-10),adddate(curdate(),-1));
insert into kolcsonzesek values(4,2,6,adddate(curdate(),-45),adddate(curdate(),-10),null);
insert into kolcsonzesek values(3,1,6,adddate(curdate(),-45),adddate(curdate(),-10),adddate(curdate(),-23));
insert into kolcsonzesek values(2,1,2,adddate(curdate(),-45),adddate(curdate(),-10),adddate(curdate(),-4));
insert into kolcsonzesek values(1,1,1,adddate(curdate(),-45),adddate(curdate(),-10),adddate(curdate(),-16));
insert into kolcsonzesek values(15,1,1,adddate(curdate(),-20),adddate(curdate(),-10),null);



#Vezetett feladat

#1. Feladat
select * from szerzo;

select * from tag;

#9. Feladat
select * from tag where tagsagiervenyes < curdate();

#2. Feladat
select distinct concat(t.vezeteknev,' ', t.keresztnev) as 'tag neve', k.cim
from tag t
	inner join kolcsonzesek kcs on kcs.tagid=t.id
	inner join konyv k on k.isbn=kcs.konyvisbn;
    
#3. Feladat:
select distinct concat(t.vezeteknev,' ', t.keresztnev) as 'tag neve',
	concat(sz.vezeteknev,' ', sz.keresztnev) as 'szerző neve'
from tag t
	inner join kolcsonzesek kcs on kcs.tagid=t.id
	inner join konyv k on k.isbn=kcs.konyvisbn
    inner join konyv_szerzo ksz on ksz.konyvisbn=k.isbn
    inner join szerzo sz on sz.id=ksz.szerzoid;
    
#4. Feladat:
select t.id, t.vezeteknev, t.keresztnev, count(kcs.id) as 'hányszor kölcsönzött'
from tag t
	left outer join kolcsonzesek kcs on kcs.tagid=t.id
group by t.id;

#5. Feladat:
select t.id, t.vezeteknev, t.keresztnev, count(kcs.id) as 'hányszor kölcsönzött'
from tag t
	left outer join kolcsonzesek kcs on kcs.tagid=t.id
group by t.id
having count(kcs.id) >= 3;

#6. Feladat:
select t.id, t.vezeteknev, t.keresztnev, count(kcs.id) as 'hányszor kölcsönzött'
from tag t
	left outer join kolcsonzesek kcs on kcs.tagid=t.id
where t.tagsagiervenyes >= curdate()
group by t.id
having count(kcs.id) >= 3;

#7. Feladat:
select t.id, t.vezeteknev, t.keresztnev, max(kcs.kiviteldatuma) as 'utoljara kölcsönzött'
from tag t
	inner join kolcsonzes kcs on kcs.tagid = t.id
group by t.id;

#8. Feladat:
select sz.*, count(kcs.id) as 'kolcsönzések száma'
from szerzo sz
	left outer join konyv_szerzo ksz on ksz.szerzoid=sz.id
    left outer join kolcsonzesek kcs on kcs.konyvisbn=ksz.konyvisbn
group by sz.id
order by count(kcs.id) desc;

#10. Feladat:
select *
from tag t
	inner join kolcsonzes kcs on kcs.tafid=t.id
where kcs.lejaratdatum < curdate() and kcs.visszahozataldatum is null;

#11. Feladat:
select *
from szerzo sz
	inner join konyv_szerzo ksz on ksz.szerzoid=sz.id
where sz.id not in(
	select ksz.szerzoid
		inner join kolcsonzesek kcs on ksz.konyvisbn=kcs.konyvisbn
);

#12. Feladat:
select sz.*
from szerzo sz
	inner join konyv_szerzo ksz on ksz.szerzoid=sz.id
    inner join konyv k on k.isbn=ksz.konyvisbn
where k.ar = (select max(ar) from konyv);

#Önálló feladatok:

#1. Feladat: 
select * from konyv where konyv.isbn not in (select kcs.konyvisbn from kolcsonzesek kcs);

#2. Feladat:
select * from konyv where konyv.megjelenes = (select min(megjelenes) from konyv);

#3. Feladat:
select max(visszahozataldatum-kiviteldatum) from kolcsonzesek inner join konyv on kolcsonzesek.konyvisbn	= konyv.isbn
where konyv.isbn = (select konyv.isbn from konyv where konyv.megjelenes = (select min(megjelenes) from konyv));

#4. Feladat:
select tag.*, max(visszahozataldatum-kiviteldatum) as 'leghosszabb kölcsönzés' from kolcsonzesek kcs 
	inner join tag on tag.id=kcs.tagid;
    
#5. Feladat:
select *,kcs.visszahozataldatum - kcs.kiviteldatum  from konyv inner join kolcsonzesek kcs on kcs.konyvisbn = konyv.isbn
where (kcs.visszahozataldatum - kcs.kiviteldatum) > 40;

#6. Feladat:
select cim, count(konyv.isbn) from konyv_szerzo ksz inner join konyv on ksz.konyvisbn = konyv.isbn
where (count(konyv.isbn) > 1)
group by ksz.konyvisbn;

select *, count(konyv.isbn) from konyv_szerzo ksz inner join konyv on ksz.konyvisbn = konyv.isbn;

select cim, count(ksz.szerzoid) as 'Szerzők száma'  from konyv inner join konyv_szerzo ksz on ksz.konyvisbn = konyv.isbn
group by konyv.isbn;

#7. Feladat:
select szerzo.nemzetiseg, count(nemzetiseg) as 'szerzők száma:' from szerzo 
group by szerzo.nemzetiseg;
