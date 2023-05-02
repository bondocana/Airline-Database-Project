--11
/*selecteaza numele pilotului, id-ul zborului,
modelul avionului si numele companiei 
care efectueaza acest zbor*/
select a.nume, b.id_zbor, c.model, d.nume
from pilot a join zbor b on a.id_zbor = b.id_zbor
join avion c on b.id_avion = c.id_avion
join companie d on c.id_companie = d.id_companie;

/*selecteaza numele pilotului, nr_zboruri,
id-ul zborului, modelul avionului si numele 
companiei care efectueaza acest zbor,
unde pilotul are 'on' in nume si 
nr_zboruri este mai mare ca 400*/
select a.nume, a.nr_zboruri, b.id_zbor, c.model, d.nume
from pilot a join zbor b on a.id_zbor = b.id_zbor
join avion c on b.id_avion = c.id_avion
join companie d on c.id_companie = d.id_companie
where upper(a.nume) like '%ON%'
and a.nr_zboruri > 400;

/*Sa se selecteze companiile care au email, 
iar in dreptul celor care n-au sa se afiseze 0.*/
select nume, nvl(email, 0)
from companie;

/*selecteaza numele pasagerului,id_ul 
biletului cumparat de acesta care
care apare in boardingpass cu poarta >=9*/
select p.nume, p.prenume, b.id_bilet
from pasager p join bilet b on p.id_pasager  = b.id_pasager 
where b.id_pasager in
(select p.id_pasager
from pasager p join boardingpass c on p.id_pasager  = c.id_pasager 
where p.id_pasager in
(select id_pasager
from boardingpass 
where poarta >= 9
)
group by p.id_pasager);

--12
/*Sa se stearga zborurile care se efectueaza cu avioane
care in model contin litera 'r'*/
delete from zbor
where id_avion in (select  id_avion
                        from avion
                        where model like '%r%'
                        );

/*Sa se actualizeze orasul de sosire 
cu 'Bacau' pentru zborurile 
al caror id este 13 sau 14*/
update zbor
set sosire = 'Bacau'
where id_zbor in(select id_zbor
                    from zbor
                    where id_zbor=13 or id_zbor=14
);

/*Sa se stearga zborurile a caror
avioane sunt tinute de compania RyanAir*/
delete from zbor
where id_zbor in (select id_zbor
                    from avion
                    where id_companie=(select id_companie
                                        from companie
                                        where nume='RyanAir'));

--13
create sequence seq_pasager
increment by 1
start with 300
minvalue 1
maxvalue 99999
nocycle;

create sequence seq_companie
increment by 1
start with 100
minvalue 1
maxvalue 99999
nocycle;

--14
/*Vizualizarea compusa:*/
Create view vizualizare (id_zbor, plecare, sosire, id_avion, model)
as select z.id_zbor, z.plecare, z.sosire, z.id_avion, a.model
from zbor z, avion a where z.id_avion=a.id_avion;

select * from vizualizare;

/*Exemplu de operatie LMD nepermisa:*/
insert into vizualizare values (12, 'Praga', 'Londra', 2002, 'Antonov An-26');

/*Exemplu de operatie LMD permisa:*/
delete from vizualizare where id_zbor >= 13;
