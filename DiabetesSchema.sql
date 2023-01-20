-- Creating tables for Diabetes project

CREATE TABLE DIABETES (
    id serial,
    _STATE FLOAT,
    IYEAR INT,
    GENHLTH FLOAT,
    PHYSHLTH FLOAT,
    MENTHLTH FLOAT,
    POORHLTH FLOAT,
    HLTHPLN1 FLOAT,
    PERSDOC2 FLOAT,
    MEDCOST FLOAT,
    CHECKUP1 FLOAT,
    BPHIGH4 FLOAT,
    TOLDHI2 FLOAT,
    CVDINFR4 FLOAT,
    CVDCRHD4 FLOAT,
    CVDSTRK3 FLOAT,
    ASTHMA3 FLOAT,
    ASTHNOW FLOAT,
    CHCCOPD1 FLOAT,
    HAVARTH3 FLOAT,
    ADDEPEV2 FLOAT,
    CHCKIDNY FLOAT,
    DIABETE3 FLOAT,
    SEX FLOAT,
    MARITAL FLOAT,
    EDUCA FLOAT,
    RENTHOM1 FLOAT,
    EMPLOY1 FLOAT,
    SMOKE100 FLOAT,
    SMOKDAY2 FLOAT,
    USENOW3 FLOAT,
    AVEDRNK2 FLOAT,
    EXERANY2 FLOAT,
    SCNTMNY1 FLOAT,
    SCNTMEL1 FLOAT,
    ADPLEASR FLOAT,
    ADDOWN FLOAT,
    ADSLEEP FLOAT,
    ADENERGY FLOAT,
    ADEAT1 FLOAT,
    ADFAIL FLOAT,
    ADTHINK FLOAT,
    ADMOVE FLOAT,
    MISTMNT FLOAT,
    ADANXEV FLOAT,
    _RACE FLOAT,
    _AGE_G FLOAT,
    HTM4 FLOAT,
    WTKG3 FLOAT,
    _BMI5 FLOAT,
    _FRUTSUM FLOAT,
    _VEGESUM FLOAT,
    PRIMARY KEY (id)
);

CREATE TABLE STATES (
    _STATE FLOAT   NOT NULL,
    STATE varchar   NOT NULL,
    PRIMARY KEY (_STATE)
);