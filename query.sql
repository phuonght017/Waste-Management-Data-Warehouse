SELECT f."Stationid", d."TruckType", SUM(f."Wastecollected") as Total_waste_collected
FROM public."FactTrips" f
LEFT JOIN public."DimTruck" d
ON f."Truckid" = d."Truckid"
GROUP BY grouping sets (f."Stationid", d."TruckType");

SELECT d."Year", f."Stationid", s."City", AVG(f."Wastecollected") as Average_waste_collected
FROM public."FactTrips" f
LEFT JOIN public."DimDate" d
ON f."Dateid" = d."dateid"
LEFT JOIN public."DimStation" s
ON f."Stationid" = s."Stationid"
GROUP BY CUBE(d."Year", f."Stationid", s."City");

CREATE MATERIALIZED VIEW max_waste_stats AS
SELECT
    f."Stationid", s."City", d."TruckType",
	MAX(f."Wastecollected") as Average_waste_collected
FROM public."FactTrips" f
LEFT JOIN public."DimTruck" d
ON f."Truckid" = d."Truckid"
LEFT JOIN public."DimStation" s
ON f."Stationid" = s."Stationid"
GROUP BY f."Stationid", s."City", d."TruckType";