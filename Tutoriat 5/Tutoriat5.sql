-- Tutoriat 5
-- Crearea tabelelor si inserarea datelor pentru diagrama MusicStream
-- Crearea tabelului
CREATE TABLE ABONAMENT(
    abonament_id NUMBER(5) PRIMARY KEY,
    tip_abonament VARCHAR(15) NOT NULL,
    pret NUMBER(5) NOT NULL,
    durata_aboment NUMBER(3) -- durata exprimata in luni
);

CREATE TABLE UTILIZATOR(
    utilizator_id NUMBER(5) PRIMARY KEY,
    username VARCHAR(20) NOT NULL UNIQUE,
    nume_utilizator VARCHAR(20),
    prenume_utilizator VARCHAR(20),
    data_inregistrarii DATE DEFAULT (sysdate),
    abonament_id NUMBER(5) REFERENCES abonament(abonament_id) ON DELETE SET NULL
);

CREATE TABLE PLAYLIST(
    playlist_id NUMBER(5) PRIMARY KEY,
    denumire_playlist VARCHAR(20) NOT NULL,
    mood VARCHAR(20),
    utilizator_id NUMBER(5) REFERENCES utilizator(utilizator_id) ON DELETE SET NULL
);

CREATE TABLE ARTIST(
    artist_id NUMBER(5) PRIMARY KEY,
    nume_scena VARCHAR(20) NOT NULL,
    nume_artist VARCHAR(20),
    prenume_artist VARCHAR(20),
    contact VARCHAR(50),
    nationalitate VARCHAR(15)
);

CREATE TABLE MELODIE(
    melodie_id NUMBER(5) PRIMARY KEY,
    denumire_melodie VARCHAR(20) NOT NULL,
    data_lansarii DATE,
    durata_melodie NUMBER(5), -- durata exprimata in secunde
    gen_muzical VARCHAR(20),
    artist_id NUMBER(5) REFERENCES artist(artist_id) ON DELETE SET NULL
);

CREATE TABLE ASCULTA(
    utilizator_id NUMBER(5),
    melodie_id  NUMBER(5),
    nr_streams NUMBER(5),
    ultima_data DATE,
    CONSTRAINT PK_Asculta PRIMARY KEY (utilizator_id, melodie_id),
    CONSTRAINT FK_Asculta_Utilizator FOREIGN KEY (utilizator_id) REFERENCES Utilizator(utilizator_id),
    CONSTRAINT FK_Asculta_Melodie FOREIGN KEY (melodie_id) REFERENCES Melodie(melodie_id)
);
CREATE TABLE CONTINE(
    playlist_id NUMBER(5),
    melodie_id  NUMBER(5),
    CONSTRAINT PK_Contine PRIMARY KEY (playlist_id, melodie_id),
    CONSTRAINT FK_Contine_Playlist FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id),
    CONSTRAINT FK_Contine_Melodie FOREIGN KEY (melodie_id) REFERENCES Melodie(melodie_id)
);

-- Varianta alternativa
/*
CREATE TABLE ABONAMENT(
    abonament_id NUMBER(5) PRIMARY KEY,
    tip_abonament VARCHAR(15) NOT NULL,
    pret NUMBER(5) NOT NULL,
    durata_aboment NUMBER(3) -- durata exprimata in luni
);

CREATE TABLE UTILIZATOR(
    utilizator_id NUMBER(5) PRIMARY KEY,
    username VARCHAR(20) NOT NULL UNIQUE,
    nume_utilizator VARCHAR(20),
    prenume_utilizator VARCHAR(20),
    data_inregistrarii DATE DEFAULT (sysdate)
);

CREATE TABLE PLAYLIST(
    playlist_id NUMBER(5) PRIMARY KEY,
    denumire_playlist VARCHAR(20) NOT NULL,
    mood VARCHAR(20)
);

CREATE TABLE MELODIE(
    melodie_id NUMBER(5) PRIMARY KEY,
    denumire_melodie VARCHAR(20) NOT NULL,
    data_lansarii DATE,
    durata_melodie NUMBER(5), -- durata exprimata in secunde
    gen_muzical VARCHAR(20)
);

CREATE TABLE ASCULTA(
    utilizator_id NUMBER(5),
    melodie_id  NUMBER(5),
    nr_streams NUMBER(5),
    ultima_data DATE,
    CONSTRAINT PK_Asculta PRIMARY KEY (utilizator_id, melodie_id),
    CONSTRAINT FK_Asculta_Utilizator FOREIGN KEY (utilizator_id) REFERENCES Utilizator(utilizator_id),
    CONSTRAINT FK_Asculta_Melodie FOREIGN KEY (melodie_id) REFERENCES Melodie(melodie_id)
);

CREATE TABLE CONTINE(
    playlist_id NUMBER(5),
    melodie_id  NUMBER(5),
    CONSTRAINT PK_Contine PRIMARY KEY (playlist_id, melodie_id),
    CONSTRAINT FK_Contine_Playlist FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id),
    CONSTRAINT FK_Contine_Melodie FOREIGN KEY (melodie_id) REFERENCES Melodie(melodie_id)
);

CREATE TABLE ARTIST(
    artist_id NUMBER(5) PRIMARY KEY,
    nume_scena VARCHAR(20) NOT NULL,
    nume_artist VARCHAR(20),
    prenume_artist VARCHAR(20),
    contact VARCHAR(50),
    nationalitate VARCHAR(15)
);

ALTER TABLE MELODIE 
ADD artist_id NUMBER(5); 

ALTER TABLE MELODIE
ADD CONSTRAINT FK_Melodie_Artist
FOREIGN KEY (artist_id) REFERENCES Artist(artist_id);

ALTER TABLE UTILIZATOR 
ADD abonament_id NUMBER(5); 

ALTER TABLE UTILIZATOR
ADD CONSTRAINT FK_Utilizator_Abonament
FOREIGN KEY (abonament_id) REFERENCES Abonament(abonament_id);

ALTER TABLE PLAYLIST 
ADD utilizator_id NUMBER(5); 

ALTER TABLE PLAYLIST
ADD CONSTRAINT FK_Playlist_Utilizator
FOREIGN KEY (utilizator_id) REFERENCES Utilizator(utilizator_id);*/

-- Inserarea datelor

INSERT INTO ABONAMENT (ABONAMENT_ID, TIP_ABONAMENT, PRET, DURATA_ABOMENT) 
VALUES (100, 'lite', 10, 1);

INSERT INTO ABONAMENT (ABONAMENT_ID, TIP_ABONAMENT, PRET, DURATA_ABOMENT) 
VALUES (101, 'premium', 20, 1);

INSERT INTO ABONAMENT (ABONAMENT_ID, TIP_ABONAMENT, PRET, DURATA_ABOMENT) 
VALUES (102, 'pro', 40, 2);

INSERT INTO UTILIZATOR (UTILIZATOR_ID, USERNAME, NUME_UTILIZATOR, PRENUME_UTILIZATOR, DATA_INREGISTRARII, ABONAMENT_ID) 
VALUES (10, 'lauratender', 'Tender', 'Laura', to_date('2019/12/10', 'RRRR-MM-DD'), 102);

INSERT INTO UTILIZATOR (UTILIZATOR_ID, USERNAME, NUME_UTILIZATOR, PRENUME_UTILIZATOR, DATA_INREGISTRARII, ABONAMENT_ID) 
VALUES (11, 'anacomo', 'Comorasu', 'Ana', to_date('2020/05/01', 'RRRR-MM-DD'), 101);

INSERT INTO UTILIZATOR (UTILIZATOR_ID, USERNAME, NUME_UTILIZATOR, PRENUME_UTILIZATOR, DATA_INREGISTRARII, ABONAMENT_ID) 
VALUES (12, 'andreipopa', 'Popa', 'Andrei', to_date('2018/04/01', 'RRRR-MM-DD'), 102);

INSERT INTO UTILIZATOR (UTILIZATOR_ID, USERNAME, NUME_UTILIZATOR, PRENUME_UTILIZATOR, DATA_INREGISTRARII, ABONAMENT_ID) 
VALUES (13, 'georgepop', 'Pop', 'George', to_date('2019/03/02', 'RRRR-MM-DD'), 100);

INSERT INTO UTILIZATOR (UTILIZATOR_ID, USERNAME, NUME_UTILIZATOR, PRENUME_UTILIZATOR, DATA_INREGISTRARII, ABONAMENT_ID) 
VALUES (14, 'tudorpopescu', 'Popescu', 'Tudor', to_date('2018/04/07', 'RRRR-MM-DD'), 102);

INSERT INTO PLAYLIST (PLAYLIST_ID, DENUMIRE_PLAYLIST, MOOD, UTILIZATOR_ID) 
VALUES (10, 'Quarantine', 'confused', 13);

INSERT INTO PLAYLIST (PLAYLIST_ID, DENUMIRE_PLAYLIST, MOOD, UTILIZATOR_ID) 
VALUES (11, 'Piano', 'calm', 11);

INSERT INTO PLAYLIST (PLAYLIST_ID, DENUMIRE_PLAYLIST, MOOD, UTILIZATOR_ID) 
VALUES (12, 'Breakup Songs', 'sad', 12);

INSERT INTO PLAYLIST (PLAYLIST_ID, DENUMIRE_PLAYLIST, MOOD, UTILIZATOR_ID) 
VALUES (13, 'Summer', 'happy', 10);

INSERT INTO ARTIST (ARTIST_ID, NUME_SCENA, NUME_ARTIST, PRENUME_ARTIST, CONTACT, NATIONALITATE) 
VALUES (101, 'Shawn Mendes', 'Mendes', 'Shawn', 'New Artist', 'canadian');

INSERT INTO ARTIST (ARTIST_ID, NUME_SCENA, NUME_ARTIST, PRENUME_ARTIST, CONTACT, NATIONALITATE) 
VALUES (102, 'Ed Sheeran', 'Sheeran', 'Edward', 'Forever Ballade', 'british');

INSERT INTO ARTIST (ARTIST_ID, NUME_SCENA, NUME_ARTIST, PRENUME_ARTIST, CONTACT, NATIONALITATE) 
VALUES (103, 'Dua Lipa', 'Lipa', 'Dua', 'New Rules', 'american');

INSERT INTO ARTIST (ARTIST_ID, NUME_SCENA, NUME_ARTIST, PRENUME_ARTIST, CONTACT, NATIONALITATE) 
VALUES (104, 'Olivia Rodrigo', 'Rodrigo', 'Olivia', 'Record', 'american');

INSERT INTO MELODIE (MELODIE_ID, DENUMIRE_MELODIE, DATA_LANSARII, DURATA_MELODIE, GEN_MUZICAL, ARTIST_ID) 
VALUES (1000, 'Wonder', to_date('2020/12/12', 'RRRR-MM-DD'), 3, 'pop', 101);
COMMIT;

-- 12. Implementarea a 3 opera?ii de actualizare sau suprimare a datelor utilizând subcereri.
-- UPDATE Fiecare utilizator reasculta melodia pe care a ascultat-o cel mai des.
UPDATE Asculta a
SET nr_streams = nr_streams + 1
WHERE melodie_id IN (SELECT melodie_id
                    FROM Asculta a1
                    WHERE a.utilizator_id = a1. utilizator_id and 
                    nr_streams = (SELECT max(nr_streams)
                                    FROM Asculta a2
                                    WHERE a1.utilizator_id = a2.utilizator_id));

-- UPDATE Utilizatorul lauratender isi schimba abomanentul curent cu cel mai ieftin abonament.
UPDATE Utilizator
SET abonament_id = (SELECT abonament_id
                    FROM Abonament
                    WHERE pret = (SELECT MIN(PRET) FROM ABONAMENT))
WHERE username = 'lauratender';

SELECT * FROM UTILIZATOR;
ROLLBACK;

-- DELETE Stergeti abonamentele pe care nu le detine niciun utilizator
-- Modific baza de date pentru a sesiza o modificare
UPDATE Utilizator
SET ABONAMENT_ID = 101
WHERE USERNAME = 'georgepop';

DELETE FROM Abonament
WHERE abonament_id NOT IN (SELECT DISTINCT abonament_id
                            FROM Utilizator);
                        
SELECT * FROM ABONAMENT;
ROLLBACK;

-- UPDATE Username-ul pentru fiecare utilizator sa fie in formatul prenume_nume.
UPDATE Utilizator
SET username = prenume_utilizator || '_' || nume_utilizator
WHERE prenume_utilizator IS NOT NULL AND nume_utilizator IS NOT NULL;

SELECT * FROM UTILIZATOR;
ROLLBACK;

-- DELETE Stergem toate playlisturile care contin in denumire "breakup" sau au moodul "sad".
DELETE FROM PLAYLIST
WHERE UPPER(DENUMIRE_PLAYLIST) LIKE '%BREAKUP%' OR MOOD = 'sad';

SELECT * FROM PLAYLIST;

ROLLBACK;

-- UPDATE Pentru artistul care a lansat cele mai multe melodii creez cu un contract cu "Record"
UPDATE Artist A
SET CONTACT = 'Record'
WHERE artist_id in (SELECT artist_id 
                    FROM MELODIE m1
                    WHERE m1.artist_id = (SELECT ARTIST_ID
                                            FROM (SELECT COUNT(*), ARTIST_ID
                                                FROM MELODIE m2
                                                GROUP BY artist_id
                                                ORDER BY COUNT(*) DESC)
                                                WHERE ROWNUM = 1));

SELECT * FROM ARTIST; 

