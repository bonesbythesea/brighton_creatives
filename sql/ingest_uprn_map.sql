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
