--EXERCITIUL 4 + 5---------------------------------------------------------------
--------------------------------------------------------------------------------
--crearea tabelelor cu cheile primare-------------------------------------------
--------------------------------------------------------------------------------
CREATE TABLE airline (
    airline_id   NUMBER(9) NOT NULL,
    airline_name VARCHAR2(30) NOT NULL,
    phone_number VARCHAR2(11),
    email        VARCHAR2(30)
);

ALTER TABLE airline ADD CONSTRAINT airline_pk PRIMARY KEY ( airline_id );

--------------------------------------------------------------------------------
CREATE TABLE airplane (
    airplane_id        NUMBER(9) NOT NULL,
    model_name         VARCHAR2(30) NOT NULL,
    seats_number       NUMBER(9),
    airline_id NUMBER(9) NOT NULL
);

ALTER TABLE airplane ADD CONSTRAINT airplane_pk PRIMARY KEY (airplane_id);

--------------------------------------------------------------------------------
CREATE TABLE cabin_crew (
    cabin_crew_id  NUMBER(9) NOT NULL,
    crew_name      VARCHAR2(30) NOT NULL,
    contact_number VARCHAR2(11)
);

ALTER TABLE cabin_crew ADD CONSTRAINT cabin_crew_pk PRIMARY KEY ( cabin_crew_id );

--------------------------------------------------------------------------------
CREATE TABLE flight (
    flight_id                   NUMBER(9) NOT NULL,
    flight_name                 VARCHAR2(30) NOT NULL,
    departure_date              DATE,
    departure_time              varchar(6),
    arrival_date                DATE,
    arrival_time                varchar(6),
    airplane_id        NUMBER(9) NOT NULL,
    route_id           NUMBER(9) NOT NULL,
    cabin_crew_id    NUMBER(9) NOT NULL
);

ALTER TABLE flight
    ADD CONSTRAINT flight_pk PRIMARY KEY ( flight_id);
    
--------------------------------------------------------------------------------
CREATE TABLE flight_pilot (
    flight_id                NUMBER(9) NOT NULL,
    pilot_id                  NUMBER(9) NOT NULL  );

ALTER TABLE flight_pilot
    ADD CONSTRAINT flight_pilot_pk PRIMARY KEY ( flight_id,
                                                 pilot_id );
                                                
--------------------------------------------------------------------------------
CREATE TABLE pilot (
    pilot_id   NUMBER(9) NOT NULL,
    first_name VARCHAR2(30) NOT NULL,
    last_name  VARCHAR2(30) NOT NULL,
    experience NUMBER(3),
    age        NUMBER(3)
);

ALTER TABLE pilot ADD CONSTRAINT pilot_pk PRIMARY KEY ( pilot_id );

--------------------------------------------------------------------------------
CREATE TABLE route (
    route_id       NUMBER(9) NOT NULL,
    departure_city VARCHAR2(30) NOT NULL,
    arrival_city   VARCHAR2(30) NOT NULL
);

ALTER TABLE route ADD CONSTRAINT route_pk PRIMARY KEY ( route_id );

--------------------------------------------------------------------------------
--adaugare foreign key----------------------------------------------------------
--------------------------------------------------------------------------------
ALTER TABLE airplane
    ADD CONSTRAINT airplane_airline_fk FOREIGN KEY ( airline_id )
        REFERENCES airline ( airline_id);

ALTER TABLE flight
    ADD CONSTRAINT flight_airplane_fk FOREIGN KEY ( airplane_id )                                                    
        REFERENCES airplane ( airplane_id);
                              
ALTER TABLE flight
    ADD CONSTRAINT flight_cabin_crew_fk FOREIGN KEY ( cabin_crew_id )
        REFERENCES cabin_crew ( cabin_crew_id );

ALTER TABLE flight_pilot
    ADD CONSTRAINT pilot_flight_fk FOREIGN KEY ( flight_id )
        REFERENCES flight ( flight_id );
        
ALTER TABLE flight_pilot
    ADD CONSTRAINT flight_pilot_fk FOREIGN KEY ( pilot_id )
        REFERENCES pilot ( pilot_id );

ALTER TABLE flight
    ADD CONSTRAINT flight_route_fk FOREIGN KEY ( route_id )
        REFERENCES route ( route_id );

--------------------------------------------------------------------------------
---inserare date in tabele------------------------------------------------------
--------------------------------------------------------------------------------

--AIRLINE-----------------------------------------------------------------------
INSERT INTO airline(airline_id, airline_name, phone_number, email)
VALUES(1, 'WizzAir', '0754178694', 'wizzair@mail.com');

INSERT INTO airline(airline_id, airline_name, phone_number, email)
VALUES(2, 'RyanAir', '0754578914', 'ryanair@mail.com');

INSERT INTO airline(airline_id, airline_name, phone_number, email)
VALUES(3, 'BlueAir', '0710174494', 'blueair@mail.com');

INSERT INTO airline(airline_id, airline_name, phone_number, email)
VALUES(4, 'Lufthansa', '0724475910', 'lufthansa@mail.com');

INSERT INTO airline(airline_id, airline_name, phone_number, email)
VALUES(5, 'Tarom', '0755178451', 'tarom@mail.com');

--AIRPLANE----------------------------------------------------------------------
INSERT INTO airplane(airplane_id, model_name, seats_number, airline_id)
VALUES(1, 'Airbus A300', 356, 2);

INSERT INTO airplane(airplane_id, model_name, seats_number, airline_id)
VALUES(2, 'Airbus A321', 412, 4);

INSERT INTO airplane(airplane_id, model_name, seats_number, airline_id)
VALUES(3, 'Antonov An-26', 589, 4);

INSERT INTO airplane(airplane_id, model_name, seats_number, airline_id)
VALUES(4, 'Boeing 747', 221, 3);

INSERT INTO airplane(airplane_id, model_name, seats_number, airline_id)
VALUES(5, 'Boeing 709', 812, 3);

--CABIN_CREW--------------------------------------------------------------------
INSERT INTO cabin_crew(cabin_crew_id, crew_name, contact_number)
VALUES(1, 'Luggage Team', '07234589611');

INSERT INTO cabin_crew(cabin_crew_id, crew_name, contact_number)
VALUES(2, 'Cleaning Team', '0723444597');

INSERT INTO cabin_crew(cabin_crew_id, crew_name, contact_number)
VALUES(3, 'Medical Team', '0724775558');

INSERT INTO cabin_crew(cabin_crew_id, crew_name, contact_number)
VALUES(4, 'Cabin Team', '0755210036');

INSERT INTO cabin_crew(cabin_crew_id, crew_name, contact_number)
VALUES(5, 'Emergency Team', '0724774104');

--ROUTE-------------------------------------------------------------------------
INSERT INTO route(route_id, departure_city, arrival_city)
VALUES(1, 'Bucuresti', 'Paris');

INSERT INTO route(route_id, departure_city, arrival_city)
VALUES(2, 'Amsterdam', 'Barcelona');

INSERT INTO route(route_id, departure_city, arrival_city)
VALUES(3, 'Praga', 'Londra');

INSERT INTO route(route_id, departure_city, arrival_city)
VALUES(4, 'Madrid', 'Viena');

INSERT INTO route(route_id, departure_city, arrival_city)
VALUES(5, 'Frankfurt', 'Sibiu');

--PILOT-------------------------------------------------------------------------
INSERT INTO pilot(pilot_id, first_name, last_name, experience, age)
VALUES(1, 'Andrei', 'Dinu', 6, 34);

INSERT INTO pilot(pilot_id, first_name, last_name, experience, age)
VALUES(2, 'Andrei', 'Horceag', 15, 47);

INSERT INTO pilot(pilot_id, first_name, last_name, experience, age)
VALUES(3, 'Mihai', 'Bondoc', 10, 51);

INSERT INTO pilot(pilot_id, first_name, last_name, experience, age)
VALUES(4, 'Adrian', 'Munteanu', 2, 31);

INSERT INTO pilot(pilot_id, first_name, last_name, experience, age)
VALUES(5, 'Razvan', 'Popa', 6, 34);

--FLIGHT------------------------------------------------------------------------
INSERT INTO flight(flight_id, flight_name, departure_date, departure_time, arrival_date, arrival_time,
                    airplane_id, route_id, cabin_crew_id)
VALUES(1, 'F2378', '12.12.2022', '12:45', '12.12.2022', '14:00', 2, 4, 2);

INSERT INTO flight(flight_id, flight_name, departure_date, departure_time, arrival_date, arrival_time,
                    airplane_id, route_id, cabin_crew_id)
VALUES(2, 'D0122', '31.08.2021', '23:00', '01.09.2021', '03:00', 3, 2, 5);

INSERT INTO flight(flight_id, flight_name, departure_date, departure_time, arrival_date, arrival_time,
                    airplane_id, route_id, cabin_crew_id)
VALUES(3, 'G3295', '03.05.2022', '09:30', '03.05.2022', '17:00', 1, 1, 4);

INSERT INTO flight(flight_id, flight_name, departure_date, departure_time, arrival_date, arrival_time,
                    airplane_id, route_id, cabin_crew_id)
VALUES(4, 'H4512', '08.01.2023', '17:00', '09.01.2023', '02:00', 5, 3, 1);

INSERT INTO flight(flight_id, flight_name, departure_date, departure_time, arrival_date, arrival_time,
                    airplane_id, route_id, cabin_crew_id)
VALUES(5, 'J0065', '03.03.2023', '13:05', '04.03.2023', '13:00', 4, 5, 3);

--FLIGHT_PILOT------------------------------------------------------------------
INSERT INTO flight_pilot(flight_id, pilot_id)
VALUES(1, 2);

INSERT INTO flight_pilot(flight_id, pilot_id)
VALUES(1, 4);

INSERT INTO flight_pilot(flight_id, pilot_id)
VALUES(2, 1);

INSERT INTO flight_pilot(flight_id, pilot_id)
VALUES(2, 4);

INSERT INTO flight_pilot(flight_id, pilot_id)
VALUES(3, 1);

INSERT INTO flight_pilot(flight_id, pilot_id)
VALUES(3, 5);

INSERT INTO flight_pilot(flight_id, pilot_id)
VALUES(4, 3);

INSERT INTO flight_pilot(flight_id, pilot_id)
VALUES(4, 2);

INSERT INTO flight_pilot(flight_id, pilot_id)
VALUES(5, 1);

INSERT INTO flight_pilot(flight_id, pilot_id)
VALUES(5, 4);












--EXERCITIUL 6-------------------------------------------------------------------
-- Definiti un subprogram prin care sa obtinem data si ora decolarii si aterizarii
-- a zborurilor care au ca unul din piloti pe Andrian Munteanu

CREATE OR REPLACE PROCEDURE  InformatiiZbor
    IS
        TYPE zboruri is varray(101) of number;
        
        type ZBOR is record
            (flight_id flight.flight_id%type,
            departure_date flight.departure_date%type,
            departure_time flight.departure_time%type,
            arrival_date flight.arrival_date%type,
            arrival_time flight.arrival_time%type);
        record ZBOR;
        
        v_zboruri zboruri;
BEGIN
    --selectam zborurile care au ca unul din piloti pe Adrian Munteanu
    select distinct
        f.flight_id
    bulk collect into
        v_zboruri
    from flight_pilot f
    where (select last_name
           from pilot p
           where p.pilot_id=f.pilot_id) = 'Munteanu'
    and (select first_name
           from pilot p
           where p.pilot_id=f.pilot_id) = 'Adrian';

    FOR I IN v_zboruri.FIRST..v_zboruri.LAST LOOP
        select flight_id, departure_date, departure_time, arrival_date, arrival_time
            into record
        from flight
        where flight_id=v_zboruri(i);

        DBMS_OUTPUT.PUT_LINE('Zborul cu id-ul ' || record.flight_id || ' decoleaza pe data de ' || record.departure_date ||
        ' la ora ' || record.departure_time || ' si ajunge pe data de ' || record.arrival_date || ' ora ' || record.arrival_time);

    end loop;
end InformatiiZbor;

begin
    InformatiiZbor();
end;

--EXERCITIUL 7-------------------------------------------------------------------
-- Obtineti companiile aeriane (numele acesteia si numarul de avioane)
-- care detin cel putin x avioane (x nr introdus de la tastatura)
-- si afiseaza toate avioanele cu zborurile efectuate la momentul actual
/
CREATE OR REPLACE PROCEDURE  CompaniiAeriene
    (v_x NUMBER)
    IS
        
        v_nr number(4);
        v_nume airline.airline_name%TYPE;
        
        CURSOR c (parametru NUMBER) IS
        SELECT airline_name nume, COUNT(airplane_id) nr
        FROM airline a, airplane b
        WHERE a.airline_id=b.airline_id
        GROUP BY airline_name
        HAVING COUNT(airplane_id) > parametru;
        
        v_nr2 number(4);
        v_nume2 airline.airline_name%TYPE;
    
        CURSOR c2 IS
        SELECT model_name nume2, COUNT(flight_id) nr2
        FROM airplane a, flight f
        WHERE a.airplane_id=f.airplane_id
        GROUP BY model_name;        
        
BEGIN

    OPEN c(v_x);
    LOOP
    FETCH c INTO v_nume, v_nr;
    EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Compania aeriana '|| v_nume || ' detine ' || v_nr || ' avioane');
    END LOOP;
    CLOSE c;
    
    DBMS_OUTPUT.PUT_LINE(' ');
    
    OPEN c2;
    LOOP
    FETCH c2 INTO v_nume2, v_nr2;
    EXIT WHEN c2%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Avionul '|| v_nume2 || ' a efectuat ' || v_nr2 || ' zboruri');
    END LOOP;
    CLOSE c2;
    
end CompaniiAeriene;
/
declare
    v_x number(4) := &p_x;
begin
    CompaniiAeriene(v_x);
end;
/
--EXERCITIUL 8-------------------------------------------------------------------
-- Sa se se afiseze media varstei pilotilor care au dus la
-- bun sfarsit zborul a carui nume este dat de la tastatura
CREATE OR REPLACE FUNCTION functie
    (v_flight_name flight.flight_name%TYPE)
RETURN NUMBER IS
        varsta pilot.age%type;
        data_decolare flight.departure_date%type;
    BEGIN
        --select pentru aruncarea exceptiilor
        select departure_date into data_decolare from flight
        where flight_name = v_flight_name;
        
        SELECT avg(age) into varsta from
        pilot p join flight_pilot fp on p.pilot_id = fp.pilot_id
        join flight f on fp.flight_id = f.flight_id
        WHERE flight_name = v_flight_name;
        
        return varsta;
             
        EXCEPTION
             WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20000, 'Nu exista zboruri cu numele dat');
             WHEN TOO_MANY_ROWS THEN 
                RAISE_APPLICATION_ERROR(-20001, 'Exista mai multe zboruri cu numele dat');
             WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
            
END functie;

DECLARE 
    v_name flight.flight_name % TYPE := '&p_name';
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('Media varstei pilotilor care au dus la bun sfarsit zborul ' || v_name || ' este de ' || functie(v_name) || ' de ani');
END;


--EXERCITIUL 9---------------------------------------------------------------------
-- Sa se se afiseze numele, numele pilotului, numele echipei de la bord,
-- si orasul de delocare si aterizare ale unui zbor carui nume este dat
-- de la tastatura
CREATE OR REPLACE PROCEDURE procedura
    (v_flight_name flight.flight_name%TYPE)
IS
        data_decolare flight.departure_date%type;
        
        nume_zbor flight.flight_name%type;
        prenume_pilot pilot.first_name%type;
        nume_pilot pilot.last_name%type;
        nume_echipaj cabin_crew.crew_name%type;
        oras_decolare route.departure_city%type;
        oras_aterizare route.arrival_city%type;

    BEGIN
        --select pentru aruncarea exceptiilor
        select departure_date into data_decolare from flight
        where flight_name = v_flight_name;
        
        SELECT 
        flight_name, first_name, last_name, crew_name, departure_city, arrival_city
        into nume_zbor, prenume_pilot, nume_pilot, nume_echipaj, oras_decolare, oras_aterizare
        from flight f
        join flight_pilot fp on f.flight_id = fp.flight_id
        join pilot p on fp.pilot_id = p.pilot_id
        join cabin_crew c on c.cabin_crew_id = f.cabin_crew_id
        join route r on r.route_id = f.route_id
        WHERE flight_name = v_flight_name;
        
        DBMS_OUTPUT.PUT_LINE(nume_zbor);
        DBMS_OUTPUT.PUT_LINE('Pilot: ' || nume_pilot|| ' ' || prenume_pilot) ;
        DBMS_OUTPUT.PUT_LINE('Echipaj: ' || nume_echipaj);
        DBMS_OUTPUT.PUT_LINE('Decolare: ' || oras_decolare || ', Aterizare: ' || oras_aterizare);
             
        EXCEPTION
             WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20000, 'Nu exista zboruri cu numele dat');
             WHEN TOO_MANY_ROWS THEN 
                RAISE_APPLICATION_ERROR(-20001, 'Exista mai multe zboruri cu numele dat');
             WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
            
END procedura;

DECLARE 
    v_name flight.flight_name % TYPE := '&p_name';
BEGIN
    procedura(v_name);
END;


--EXERCITIUL 10--------------------------------------------------------------------
-- Definiți un declanșator prin care să nu se permită inserarea, stergerea
-- sau actualizarea tabelei route in afara programului de lucru
CREATE OR REPLACE TRIGGER trig
    BEFORE INSERT OR DELETE OR UPDATE on route
BEGIN
    IF TO_CHAR(SYSDATE,'HH24') NOT BETWEEN 17 AND 20 THEN
    IF INSERTING THEN
    RAISE_APPLICATION_ERROR(-20001,'Inserarea in tabele este permisa doar in timpul programului de lucru!');
    ELSIF DELETING THEN
    RAISE_APPLICATION_ERROR(-20002,'Stergerea din tabel este permisa doar in timpul programului de lucru!');
    ELSE
    RAISE_APPLICATION_ERROR(-20003,'Actualizarile in tabel sunt permise doar in timpul programului de lucru!');
    END IF;
    END IF;
END;

--INSERARE
INSERT INTO route(route_id, departure_city, arrival_city)
VALUES(6, 'Munchen', 'Napoli');
--STERGERE
DELETE FROM route WHERE departure_city = 'Bucuresti';
--ACTUALIZARE
UPDATE route  
SET departure_city = 'Munchen'
WHERE arrival_city = 'Sibiu'; 

DROP TRIGGER trig;

--EXERCITIUL 11--------------------------------------------------------------------
-- Definiți un declanșator prin care să nu se permită micsorarea sau marirea
-- numarului de locuri din tabela airplane
CREATE OR REPLACE TRIGGER trig2
    BEFORE UPDATE OF seats_number ON airplane
    FOR EACH ROW
    WHEN (NEW.seats_number <> OLD.seats_number)
BEGIN
    RAISE_APPLICATION_ERROR(-20002,'Numarul de locuri al unui avion nu poate fi modificat');
END;


UPDATE airplane
SET seats_number = seats_number + 200;

UPDATE airplane
SET seats_number = seats_number - 100;

DROP TRIGGER trig2;

--EXERCITIUL 12----------------------------------------------------------------------------
-- Definiți un declanșator care să introducă date în tabela audit_user după ce 
-- utilizatorul a folosit o comandă LDD 

CREATE TABLE audit_user
(
    bd_name         VARCHAR2(30),
    ddl_date        TIMESTAMP(3),
    ddl_user        VARCHAR2(30),
    object_type     VARCHAR(30),
    object_name     VARCHAR2(30),
    ddl_event       VARCHAR2(30)
);

CREATE OR REPLACE TRIGGER trig_audit
AFTER CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
    INSERT INTO audit_user VALUES(
    SYS.DATABASE_NAME,
    SYSTIMESTAMP(3),
    SYS.LOGIN_USER,
    SYS.DICTIONARY_OBJ_TYPE,
    SYS.DICTIONARY_OBJ_NAME,
    SYS.SYSEVENT
    );
    
END;

--CREATE
CREATE TABLE tabel (coloana_1 number(2));
--ALTER
ALTER TABLE tabel ADD (coloana_2 number(2));

INSERT INTO tabel VALUES (1,2);
--CREATE INDEX
CREATE INDEX ind_tabel ON tabel(coloana_1);

SELECT * FROM audit_user;



DROP TRIGGER trig_audit;

--EXERCITIUL 13-----------------------------------------------------------------
CREATE OR REPLACE PACKAGE pachet as
--6
    PROCEDURE InformatiiZbor;
--7
    PROCEDURE CompaniiAeriene;
--8
    FUNCTION functie(v_flight_name flight.flight_name%TYPE) RETURN NUMBER;
--9
    PROCEDURE procedura(v_flight_name flight.flight_name%TYPE);
    
end pachet;

CREATE OR REPLACE PACKAGE BODY pachet AS
--6
    PROCEDURE InformatiiZbor
    IS
        TYPE zboruri is varray(101) of number;
        
        type ZBOR is record
            (flight_id flight.flight_id%type,
            departure_date flight.departure_date%type,
            departure_time flight.departure_time%type,
            arrival_date flight.arrival_date%type,
            arrival_time flight.arrival_time%type);
        record ZBOR;
        
        v_zboruri zboruri;
BEGIN
    --selectam zborurile care au ca unul din piloti pe Adrian Munteanu
    select distinct
        f.flight_id
    bulk collect into
        v_zboruri
    from flight_pilot f
    where (select last_name
           from pilot p
           where p.pilot_id=f.pilot_id) = 'Munteanu'
    and (select first_name
           from pilot p
           where p.pilot_id=f.pilot_id) = 'Adrian';

    FOR I IN v_zboruri.FIRST..v_zboruri.LAST LOOP
        select flight_id, departure_date, departure_time, arrival_date, arrival_time
            into record
        from flight
        where flight_id=v_zboruri(i);

        DBMS_OUTPUT.PUT_LINE('Zborul cu id-ul ' || record.flight_id || ' decoleaza pe data de ' || record.departure_date ||
        ' la ora ' || record.departure_time || ' si ajunge pe data de ' || record.arrival_date || ' ora ' || record.arrival_time);

    end loop;
end InformatiiZbor;

--7
    PROCEDURE CompaniiAeriene
    IS
        v_x number(4) := &p_x;
        
        v_nr number(4);
        v_nume airline.airline_name%TYPE;
        
        CURSOR c (parametru NUMBER) IS
        SELECT airline_name nume, COUNT(airplane_id) nr
        FROM airline a, airplane b
        WHERE a.airline_id=b.airline_id
        GROUP BY airline_name
        HAVING COUNT(airplane_id) > parametru;
        
        v_nr2 number(4);
        v_nume2 airline.airline_name%TYPE;
    
        CURSOR c2 IS
        SELECT model_name nume2, COUNT(flight_id) nr2
        FROM airplane a, flight f
        WHERE a.airplane_id=f.airplane_id
        GROUP BY model_name;        
        
BEGIN
    OPEN c(v_x);
    LOOP
    FETCH c INTO v_nume, v_nr;
    EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Compania aeriana '|| v_nume || ' detine ' || v_nr || ' avioane');
    END LOOP;
    CLOSE c;
    
    DBMS_OUTPUT.PUT_LINE(' ');
    
    OPEN c2;
    LOOP
    FETCH c2 INTO v_nume2, v_nr2;
    EXIT WHEN c2%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Avionul '|| v_nume2 || ' a efectuat ' || v_nr2 || ' zboruri');
    END LOOP;
    CLOSE c2;
    
end CompaniiAeriene;

--8
    FUNCTION functie
    (v_flight_name flight.flight_name%TYPE)
RETURN NUMBER IS
        varsta pilot.age%type;
        data_decolare flight.departure_date%type;
    BEGIN
        --select pentru aruncarea exceptiilor
        select departure_date into data_decolare from flight
        where flight_name = v_flight_name;
        
        SELECT avg(age) into varsta from
        pilot p join flight_pilot fp on p.pilot_id = fp.pilot_id
        join flight f on fp.flight_id = f.flight_id
        WHERE flight_name = v_flight_name;
        
        return varsta;
             
        EXCEPTION
             WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20000, 'Nu exista zboruri cu numele dat');
             WHEN TOO_MANY_ROWS THEN 
                RAISE_APPLICATION_ERROR(-20001, 'Exista mai multe zboruri cu numele dat');
             WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
            
END functie;

--9
    PROCEDURE procedura
    (v_flight_name flight.flight_name%TYPE)
IS
        data_decolare flight.departure_date%type;
        
        nume_zbor flight.flight_name%type;
        prenume_pilot pilot.first_name%type;
        nume_pilot pilot.last_name%type;
        nume_echipaj cabin_crew.crew_name%type;
        oras_decolare route.departure_city%type;
        oras_aterizare route.arrival_city%type;

    BEGIN
        --select pentru aruncarea exceptiilor
        select departure_date into data_decolare from flight
        where flight_name = v_flight_name;
        
        SELECT 
        flight_name, first_name, last_name, crew_name, departure_city, arrival_city
        into nume_zbor, prenume_pilot, nume_pilot, nume_echipaj, oras_decolare, oras_aterizare
        from flight f
        join flight_pilot fp on f.flight_id = fp.flight_id
        join pilot p on fp.pilot_id = p.pilot_id
        join cabin_crew c on c.cabin_crew_id = f.cabin_crew_id
        join route r on r.route_id = f.route_id
        WHERE flight_name = v_flight_name;
        
        DBMS_OUTPUT.PUT_LINE(nume_zbor);
        DBMS_OUTPUT.PUT_LINE('Pilot: ' || nume_pilot|| ' ' || prenume_pilot) ;
        DBMS_OUTPUT.PUT_LINE('Echipaj: ' || nume_echipaj);
        DBMS_OUTPUT.PUT_LINE('Decolare: ' || oras_decolare || ', Aterizare: ' || oras_aterizare);
             
        EXCEPTION
             WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20000, 'Nu exista zboruri cu numele dat');
             WHEN TOO_MANY_ROWS THEN 
                RAISE_APPLICATION_ERROR(-20001, 'Exista mai multe zboruri cu numele dat');
             WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
            
END procedura;




end pachet;
-- din pachet 
begin
 pachet.CompaniiAeriene;
end;

--EXERCITIUL 14-----------------------------------------------------------------
CREATE OR REPLACE PACKAGE pachet2 as
--functii
FUNCTION f_airplane(id_avion airplane.airplane_id%TYPE)
 RETURN VARCHAR2;
 
FUNCTION f_airline(nume_companie airline.airline_name%TYPE)
 RETURN NUMBER;

--proceduri
PROCEDURE p3(nume_pilot pilot.last_name%TYPE, prenume_pilot pilot.first_name%TYPE);

PROCEDURE InformatiiRuta;

end pachet2;




CREATE OR REPLACE PACKAGE BODY pachet2 AS
--functii
FUNCTION f_airplane(id_avion airplane.airplane_id%TYPE)
 RETURN VARCHAR2 is nume VARCHAR2(30);
BEGIN
    SELECT model_name INTO nume
    FROM airplane
    WHERE id_avion = airplane_id;
    
    return nume;
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
       RAISE_APPLICATION_ERROR(-20000, 'Date introduse gresit!');
       return null;
    WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20001,'Alta eroare!');
       return null;
    

END f_airplane;


FUNCTION f_airline(nume_companie airline.airline_name%TYPE)
 RETURN NUMBER is numar NUMBER;
BEGIN
    SELECT airline_id INTO numar
    FROM airline
    WHERE nume_companie = airline_name;
    
    return numar;
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
       RAISE_APPLICATION_ERROR(-20000, 'Date introduse gresit!');
       return null;
    WHEN TOO_MANY_ROWS THEN
       RAISE_APPLICATION_ERROR(-20000,'Exista mai multe companii aeriene cu numele dat');
       return null;
    WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20001,'Alta eroare!');
       return null;
    

END f_airline;



--proceduri
PROCEDURE p3(nume_pilot pilot.last_name%TYPE, prenume_pilot pilot.first_name%TYPE)
    IS experienta pilot.experience%TYPE;
 BEGIN
    SELECT experience INTO experienta
    FROM pilot
    WHERE last_name = nume_pilot and first_name = prenume_pilot;
    DBMS_OUTPUT.PUT_LINE('Experienta de ' || experienta || ' ani');

 EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Nu exista pilot cu numele dat');
    WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Exista mai multi piloti cu numele dat');
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Alta eroare!');
    
    
 END p3;
 
 
 PROCEDURE InformatiiRuta
    IS
        TYPE rute is varray(101) of number;
        
        type RUTA is record
            (oras_decolare route.departure_city%type,
            oras_aterizare route.arrival_city%type);
        record RUTA;
        
        v_rute rute;
        id_ruta route.route_id%type;
BEGIN
    --selectez id-ul rutelor care are unul din orase Bucuresti
    SELECT DISTINCT
        route_id 
    bulk collect into
        v_rute
    FROM route
    WHERE departure_city = 'Bucuresti' or arrival_city = 'Bucuresti'; 

    FOR i IN v_rute.FIRST..v_rute.LAST LOOP
        select departure_city, arrival_city
            into record
        from route
        where route_id=v_rute(i);

        DBMS_OUTPUT.PUT_LINE('Ruta: ' || record.oras_decolare || ' - ' || record.oras_aterizare);

    end loop;
end InformatiiRuta;
        

end pachet2;



--Pt fiecare avion cateva informatii despre fiecare zbor(departure_date si arrival_date)
/
CREATE OR REPLACE PROCEDURE  Avioane
    IS
        TYPE avioane is varray(101) of number;
        
        nume_avion airplane.model_name%type;
        
        type AVION is record
            (airplane_id flight.airplane_id%type,
            nume_zbor flight.flight_name%type);
            
        rec AVION;
        
        v_avioane avioane;
        v_zboruri avioane;
BEGIN
    --selectam toate id-urile avioanelor
    select
        airplane_id
    bulk collect into
        v_avioane
    from airplane;

    FOR i IN v_avioane.FIRST..v_avioane.LAST LOOP
    
        select
            flight_id
        bulk collect into
            v_zboruri
        from flight
        where airplane_id=v_avioane(i);
        
        select model_name into nume_avion
            from airplane
            where airplane_id=v_zboruri(i);
            DBMS_OUTPUT.PUT_LINE(nume_avion);
        
        for j in v_zboruri.first..v_zboruri.last loop
            select flight_id, flight_name
            into rec
            from flight
            where flight_id=v_zboruri(j);
            DBMS_OUTPUT.PUT_LINE(rec.nume_zbor);
        end loop;
        
        

    end loop;
    
end Avioane;

/
begin
    Avioane();
end;
/








