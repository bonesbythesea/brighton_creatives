DROP VIEW IF EXISTS location_of_available_spaces;
CREATE VIEW location_of_available_spaces AS
(
    SELECT
        t.property_ref  AS property_ref,
        t.name          AS property_name,
        t.propdescr     AS description,
        t.property_1    AS address_line_1,
        t.property_2    AS address_line_2,
        t.property_3    AS address_line_3,
        t.property_4    AS address_line_4,
        t.property_5    AS address_line_5,
        t.property_6    AS postcode,
        t.voa_ref       AS voa_ref,
        t.uprn          AS uprn,
        t.empty_start   AS date_when_available,
        DATEDIFF('DAYS', t.empty_start, CURRENT_DATE) AS num_days_empty,
        m.X_COORDINATE  AS x_coordinate,
        m.Y_COORDINATE  AS y_coordinate,
        m.LATITUDE      AS latitude,
        m.LONGITUDE     AS longitude
    FROM
        brighton_and_hove_business_information_2025_04 t 
        INNER JOIN 'data/csv/osopenuprn_202505.csv'    m ON t.uprn=m.UPRN
    WHERE
        t.empty_start IS NOT NULL 
);

SELECT COUNT(*) FROM location_of_available_spaces;
SELECT * FROM location_of_available_spaces;


-- spatial opportunities
-- https://duckdb.org/docs/stable/extensions/spatial/functions
-- INSTALL spatial;
-- LOAD spatial;

