DROP DATABASE IF EXISTS apartamenty;
CREATE DATABASE apartamenty;

USE apartamenty;

/* *************************************************************** 
***************************CREATING TABLES************************
**************************************************************** */
DROP TABLE IF EXISTS apartament;
CREATE TABLE apartament (
	apartment_id INT (3) UNSIGNED NOT NULL AUTO_INCREMENT,
	apartament_strefa INT(4) NOT NULL,
    strefa_czynsz INT (10) NOT NULL,
    pokoj INT (5) NOT NULL,
	pietro int(2) NOT NULL,
	PRIMARY KEY (apartment_id)
	);

DROP TABLE IF EXISTS klient;
CREATE TABLE klient (
	klient_id INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
	klient_imie VARCHAR(25),
	klient_nazwisko VARCHAR(25) NOT NULL,
    pesel VARCHAR(11) NOT NULL,
	klient_email VARCHAR(50) NOT NULL,
	klient_telefon VARCHAR(15) NOT NULL,
	nr_dowodu VARCHAR(25) NOT NULL,
	nr_paszportu VARCHAR(25) NOT NULL,
	PRIMARY KEY (klient_id)
    )
    DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

DROP TABLE IF EXISTS czynsz;
CREATE TABLE czynsz (
	czynsz_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	apartament_id INT(3) NOT NULL,
	czynsz_strefa DECIMAL(8, 0) NOT NULL,
	czynsz_od DATE NOT NULL,
    czynsz_do DATE NOT NULL,
    czynsz_suma DECIMAL(8, 0) NOT NULL,
	PRIMARY KEY (czynsz_id)
	)
    DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

DROP TABLE IF EXISTS gaz;
CREATE TABLE gaz (
	gaz_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	apartament_id INT(3) NOT NULL,
	gaz_taryfa DECIMAL(8, 0) NOT NULL,
	gaz_od DATE NOT NULL,
    gaz_do DATE NOT NULL,
    gaz_suma DECIMAL(8, 0) NOT NULL,
	PRIMARY KEY (gaz_id)
    )
    DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;
    
DROP TABLE IF EXISTS prad;    
CREATE TABLE prad (
	prad_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	apartament_id INT(2) NOT NULL,
	prad_taryfa DECIMAL(8, 0) NOT NULL,
	prad_od DATE NOT NULL,
    prad_do DATE NOT NULL,
    prad_suma DECIMAL(8, 0) NOT NULL,
	PRIMARY KEY (prad_id)
	);

DROP TABLE IF EXISTS internet;
CREATE TABLE internet (
	internet_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	apartament_id INT(3) NOT NULL,
	internet_taryfa DECIMAL(8, 0) NOT NULL,
	internet_od DATE NOT NULL,
    internet_do DATE NOT NULL,
    internet_suma DECIMAL(8, 0) UNSIGNED NOT NULL,
	PRIMARY KEY (internet_id)
	) 
    DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

DROP TABLE IF EXISTS sprzatanie;
CREATE TABLE sprzatanie (
	sprzatanie_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	apartament_id INT(3) NOT NULL,
	sprzatanie_cena DECIMAL(8, 0) NOT NULL,
	sprzatanie_od DATE NOT NULL,
    sprzatanie_do DATE NOT NULL,
    sprzatanie_suma DECIMAL(8, 0) NOT NULL,
	PRIMARY KEY (sprzatanie_id)
	)
    DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;
 
DROP TABLE IF EXISTS tv;
CREATE TABLE tv (
	tv_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	apartament_id INT(3) NOT NULL,
	tv_cena_pakiet_podstawowy DECIMAL(8, 0) NOT NULL,
    tv_cena_pakiet_premium DECIMAL(8, 0) NOT NULL,
	tv_od DATE NOT NULL,
    tv_do DATE NOT NULL,
    tv_suma DECIMAL(8, 0) UNSIGNED NOT NULL,
	PRIMARY KEY (tv_id))
    DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

DROP TABLE IF EXISTS parking;
CREATE TABLE parking (
	parking_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	apartament_id INT(3) NOT NULL,
	parking_cena_benzyna DECIMAL(8, 0) NOT NULL,
    parking_cena_elektryczny DECIMAL(8, 0) NOT NULL,
	parking_od DATE NOT NULL,
    parking_do DATE NOT NULL,
    parking_suma DECIMAL(8, 0) UNSIGNED NOT NULL,
	PRIMARY KEY (parking_id)
	)
    DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;
    
DROP TABLE IF EXISTS faktura;
CREATE TABLE faktura (
	faktura_id INT (11) UNSIGNED NOT NULL,
	faktura_numer VARCHAR(10) NOT NULL,
	apartament_id INT(3) NOT NULL,
	klient_imie VARCHAR(10) NOT NULL,
	klient_nazwisko INT (11) NOT NULL,
    czynsz_suma DECIMAL(8, 0) NOT NULL,
    gaz_suma DECIMAL(8, 0) NOT NULL,
    prad_suma DECIMAL(8, 0) NOT NULL,
    internet_suma DECIMAL(8, 0),
    tv_suma DECIMAL(8, 0),
    sprzatanie_suma DECIMAL(8, 0),
    faktura_suma DECIMAL(8, 0)  NOT NULL,
    parking_suma DECIMAL(8, 0)  NOT NULL,
    PRIMARY KEY (faktura_id)
	)
    DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

DROP TABLE IF EXISTS powiadomienie;
CREATE TABLE powiadomienie (
	klient_id INT (10) NOT NULL,
	klient_email VARCHAR(50) NOT NULL,
    klient_telefon VARCHAR(15) NOT NULL,
    wyslano VARCHAR(50) NOT NULL
	)
    DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS oplata;
CREATE TABLE oplata (
	klient_id INT (10) NOT NULL,
    faktura_numer DATE NOT NULL,
    oplacone CHAR(3) NOT NULL,
    rodzaj_platnosci CHAR(5) NOT NULL
	)
     DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
     
DROP TABLE IF EXISTS strefa;
CREATE TABLE strefa (
	strefa_id INT (10) NOT NULL,
    strefa_czynsz DATE NOT NULL
	)
     DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS rezerwacja;
CREATE TABLE rezerwacja(
	id INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
	klient_id INT (10) NOT NULL,
    apartment_id INT (3) UNSIGNED NOT NULL,
    rezerwacja_od DATE NOT NULL,
    rezerwacja_do DATE NOT NULL,
    kaucja DECIMAL(8, 0) NOT NULL,
	PRIMARY KEY (rezerwacja_id)
	)
    DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

    
/*Dostepnosc rozpisanie do poprawy*/

DROP TABLE IF EXISTS dostepnosc;
CREATE TABLE dostepnosc(
	apartament_id INT (10) NOT NULL,
    dostepnosc_od DATE NOT NULL,
    dostepnosc_do DATE NOT NULL
	)
    DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
