SELECT
    COUNT(*) AS num_properties,
    COUNT(DISTINCT uprn) AS num_uprns
FROM brighton_and_hove_business_information_2025_04
;
-- ┌──────────────┬──────────────────────┐
-- │       11,164 │              10,624  │  ---???
-- └──────────────┴──────────────────────┘
-- 
DROP TABLE IF EXISTS uprn_map_limited;
CREATE TABLE uprn_map_limited AS
(
    SELECT
        m.UPRN,
        m.X_COORDINATE,
        m.Y_COORDINATE,
        m.LATITUDE,
        m.LONGITUDE
    FROM
        brighton_and_hove_business_information_2025_04 t 
        INNER JOIN 'data/csv/osopenuprn_202505.csv'    m ON t.uprn=m.UPRN
)
;
-- save a copy of the limited file.
COPY uprn_map_limited TO 'data/csv/uprn_map_limited.csv' (HEADER, DELIMITER ','); -- manageable 514k

SELECT COUNT(*) AS num_mapped_uprns FROM uprn_map_limited;

SELECT
    bi.property_ref,
    bi.uprn,
    m.UPRN,
    m.X_COORDINATE,
    m.Y_COORDINATE,
    m.LATITUDE,
    m.LONGITUDE
FROM
    brighton_and_hove_business_information_2025_04 bi
    LEFT JOIN uprn_map_limited                      m ON bi.uprn=m.UPRN
WHERE m.UPRN IS NULL 
; -- 413 properties with '0' as their uprn. 

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

