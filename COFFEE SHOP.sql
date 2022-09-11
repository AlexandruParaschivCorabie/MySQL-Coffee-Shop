CREATE TABLE angajati(
    angajati_id INT PRIMARY KEY,
    nume VARCHAR(40),
    prenume VARCHAR(40),
    data_nastere DATE,
    sex VARCHAR(1),
    salariu INT,
    filiala_id INT,
    subordonare_id INT
);

ALTER TABLE angajati ADD
FOREIGN KEY (filiala_id) 
REFERENCES cafenele(filiala_id) ON DELETE SET NULL;

ALTER TABLE angajati ADD
FOREIGN KEY (subordonare_id) 
REFERENCES ierarhie_angajati(subordonare_id) ON DELETE SET NULL;

INSERT INTO angajati VALUES(1,'Marcel','Paraschiv','2000-12-03', 'M' ,20000,NULL,NULL);
INSERT INTO angajati VALUES(2,'Alexandru','Ion','1977-12-04', 'M' ,25000,NULL,NULL);
INSERT INTO angajati VALUES(3,'Ion','Cristian','1987-10-08', 'M' ,300000,NULL,NULL);
UPDATE angajati SET subordonare_id=100 WHERE angajati_id = 3;
UPDATE angajati SET subordonare_id=101 WHERE angajati_id = 2;
UPDATE angajati SET subordonare_id=102 WHERE angajati_id = 1;

INSERT INTO angajati VALUES(4,'Mihnea','Alexandru','1977-10-29', 'M' ,300000,2,103);
INSERT INTO angajati VALUES(5,'Popa','Ioana','1998-11-19', 'F' ,250000,2,104);
INSERT INTO angajati VALUES(6,'Marin','Florentina','2000-03-12', 'F' ,250000,2,105);

INSERT INTO angajati VALUES(7,'Voga','Lenuta','1990-05-07', 'F' ,310000,3,106);
INSERT INTO angajati VALUES(8,'Dragomir','Florin','1991-06-01', 'M' ,200000,3,107);
INSERT INTO angajati VALUES(9,'Popa','Alexandru','1993-07-22', 'M' ,100000,3,108);

INSERT INTO angajati VALUES(10,'Popescu','Gabriel','2000-05-03', 'M' ,300000,4,109);
INSERT INTO angajati VALUES(11,'Badea','Andreea','2001-01-22', 'F' ,200000,4,110);
INSERT INTO angajati VALUES(12,'Popescu','Iulian','1987-09-20', 'M' ,100000,4,111);

SELECT * FROM angajati;
DROP  TABLE angajati;
SET FOREIGN_KEY_CHECKS=0;

 


CREATE TABLE cafenele(
    filiala_id INT PRIMARY KEY,
    tara VARCHAR(20),
    oras VARCHAR(20),
    locatie VARCHAR(20)

);

INSERT INTO cafenele VALUES(1,"Romania","Craiova","Aeroport");
INSERT INTO cafenele VALUES(2,"Romania","Craiova","Teatrul Colibrii");
INSERT INTO cafenele VALUES(3,"Germania","Berlin","Aeroport");
INSERT INTO cafenele VALUES(4,"Franta","Paris","Aeroport"); 



UPDATE cafenele SET locatie ='Stadion' WHERE filiala_id = 4;
SELECT * FROM cafenele;
DROP TABLE cafenele;
SET FOREIGN_KEY_CHECKS=0;

 

CREATE TABLE produse(
    produse_id INT PRIMARY KEY,
    produs VARCHAR(20),
    pret INT,
    filiala_id INT
);



ALTER TABLE produse ADD
FOREIGN KEY (filiala_id) 
REFERENCES cafenele(filiala_id) ON DELETE SET NULL;

INSERT INTO produse VALUES(1,'cafea',6,1);
INSERT INTO produse VALUES(2,'ceai',5,1);
INSERT INTO produse VALUES(3,'biscuiti',6,1);
INSERT INTO produse VALUES(4,'Vedere_Muntii_Bucegi',10,1)

INSERT INTO produse VALUES(5,'cafea',6,2);
INSERT INTO produse VALUES(6,'ceai',5,2);
INSERT INTO produse VALUES(7,'biscuiti',6,2);
INSERT INTO produse VALUES(8,'bilet teatru',10,2);

INSERT INTO produse VALUES(9,'cafea',6,3);
INSERT INTO produse VALUES(10,'ceai',5,3);
INSERT INTO produse VALUES(11,'biscuiti',6,3);
INSERT INTO produse VALUES(12,'Vedere_Oras_Berlin',10,3);

INSERT INTO produse VALUES(13,'cafea',6,4);
INSERT INTO produse VALUES(14,'ceai',5,4);
INSERT INTO produse VALUES(15,'biscuiti',6,4);
INSERT INTO produse VALUES(16,'Vedere_Oras_Paris',10,4);

SELECT * FROM produse;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE produse;
 


CREATE TABLE ierarhie_angajati(
    subordonare_id INT PRIMARY KEY,
    filiala_id INT,
    angajati_id INT
);

ALTER TABLE ierarhie_angajati ADD
FOREIGN KEY (filiala_id) 
REFERENCES cafenele(filiala_id) ON DELETE SET NULL;

ALTER TABLE ierarhie_angajati ADD
FOREIGN KEY (angajati_id) 
REFERENCES angajati(angajati_id) ON DELETE SET NULL;

INSERT INTO ierarhie_angajati VALUES(100,1,3);
INSERT INTO ierarhie_angajati VALUES(101,1,2);
INSERT INTO ierarhie_angajati VALUES(102,1,1);

INSERT INTO ierarhie_angajati VALUES(103,2,4);
INSERT INTO ierarhie_angajati VALUES(104,2,5);
INSERT INTO ierarhie_angajati VALUES(105,2,6);

INSERT INTO ierarhie_angajati VALUES(106,3,7);
INSERT INTO ierarhie_angajati VALUES(107,3,8);
INSERT INTO ierarhie_angajati VALUES(108,3,9);

INSERT INTO ierarhie_angajati VALUES(109,4,10);
INSERT INTO ierarhie_angajati VALUES(110,4,11);
INSERT INTO ierarhie_angajati VALUES(111,4,12,'Angajat');

ALTER TABLE ierarhie_angajati ADD pozitie_in_firma VARCHAR(20);
UPDATE ierarhie_angajati SET pozitie_in_firma='Manager' WHERE subordonare_id = 100;
UPDATE ierarhie_angajati SET pozitie_in_firma='Angajat' WHERE subordonare_id = 101;
UPDATE ierarhie_angajati SET pozitie_in_firma='Angajat' WHERE subordonare_id = 102; 
UPDATE ierarhie_angajati SET pozitie_in_firma='Manager' WHERE subordonare_id = 103;
UPDATE ierarhie_angajati SET pozitie_in_firma='Angajat' WHERE subordonare_id = 104;
UPDATE ierarhie_angajati SET pozitie_in_firma='Angajat' WHERE subordonare_id = 105;
UPDATE ierarhie_angajati SET pozitie_in_firma='Manager' WHERE subordonare_id = 106;
UPDATE ierarhie_angajati SET pozitie_in_firma='Angajat' WHERE subordonare_id = 107;
UPDATE ierarhie_angajati SET pozitie_in_firma='Angajat' WHERE subordonare_id = 108;
UPDATE ierarhie_angajati SET pozitie_in_firma='Manager' WHERE subordonare_id = 109;
UPDATE ierarhie_angajati SET pozitie_in_firma='Angajat' WHERE subordonare_id = 110;
UPDATE ierarhie_angajati SET pozitie_in_firma='Angajat' WHERE subordonare_id = 111;  

SELECT * FROM ierarhie_angajati;
DROP TABLE ierarhie_angajati;
SET FOREIGN_KEY_CHECKS=0;



 

SELECT angajati.nume,angajati.prenume,angajati.angajati_id 
FROM angajati
WHERE  angajati.angajati_id IN(
    
    SELECT ierarhie_angajati.angajati_id
    FROM ierarhie_angajati
    WHERE ierarhie_angajati.pozitie_in_firma='Manager'
) ;


 
SELECT produse.produs,produse.pret
FROM produse
WHERE produse.filiala_id=3;

 

 




SELECT angajati.nume, angajati.prenume, angajati.data_nastere,angajati.salariu
FROM angajati
WHERE angajati.data_nastere <'1990-01-01' AND angajati.salariu>20000 AND angajati.angajati_id IN(
    SELECT ierarhie_angajati.angajati_id
    FROM ierarhie_angajati
    WHERE ierarhie_angajati.pozitie_in_firma='Manager'
);
