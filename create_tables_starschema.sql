-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."FactTrips"
(
    "Tripid" integer NOT NULL,
    "Dateid" integer NOT NULL,
    "Stationid" integer NOT NULL,
    "Truckid" integer NOT NULL,
    "Wastecollected" numeric NOT NULL,
    PRIMARY KEY ("Tripid")
);

CREATE TABLE IF NOT EXISTS public."DimStation"
(
    "Stationid" integer NOT NULL,
    "City" "char",
    PRIMARY KEY ("Stationid")
);

CREATE TABLE IF NOT EXISTS public."DimTruck"
(
    "Truckid" integer NOT NULL,
    "TruckType" "char",
    PRIMARY KEY ("Truckid")
);

CREATE TABLE IF NOT EXISTS public."DimDate"
(
    dateid integer NOT NULL,
    date date NOT NULL,
    "Year" integer,
    "Quarter" integer,
    "QuarterName" "char",
    "Month" integer,
    "Monthname" "char",
    "Day" integer,
    "Weekday" integer,
    "WeekdayName" "char",
    PRIMARY KEY (dateid)
);

ALTER TABLE IF EXISTS public."FactTrips"
    ADD FOREIGN KEY ("Dateid")
    REFERENCES public."DimDate" (dateid) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."FactTrips"
    ADD FOREIGN KEY ("Stationid")
    REFERENCES public."DimStation" ("Stationid") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."FactTrips"
    ADD FOREIGN KEY ("Truckid")
    REFERENCES public."DimTruck" ("Truckid") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;