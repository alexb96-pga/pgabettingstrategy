--DESCRIBE
DESCRIBE AMEX2024;

--AMEX
SELECT * from AMEX2024
ORDER BY bdgcr asc;

--Insert Function
INSERT INTO AMEX2024 (PLAYER, WDIST, WACC, WAPP, WARG, WPUTT, SG, BDG, BRADAR)
VALUES ('Christiaan Bezuidenhout', '167', '75', '77', '42', '53', '85', '251.6', '338.7');

--Update Function
UPDATE AMEX2024
SET BRADARCR = '41'
WHERE PLAYER = 'Christiaan Bezuidenhout';

-- Update the WIN column
UPDATE AMEX2024
SET WIN = NVL(WIN, '0%');

-- Update the T10 column
UPDATE AMEX2024
SET T10 = NVL(T10, '0%');

-- Update the SGT5 column
UPDATE AMEX2024
SET SGT5 = NVL(SGT5, '0');

--CREATE PICKS VIEW
CREATE VIEW PICKS AS
SELECT
    PLAYER,
    BDGCR,
    BRADARCR,
    DGCR,
    RADARCR
    WIN,
    T10,
    SGT5,
    CASE
        WHEN BDGCR <= 3 AND BRADARCR <= 3 THEN 'WIN'
        WHEN BDGCR <= 3 AND BRADARCR > 3 THEN 'DG WIN'
        WHEN BDGCR > 3 AND BRADARCR <= 3 THEN 'RADAR WIN'
        WHEN DGCR <= 3 AND RADARCR <= 3 THEN 'T10'
        WHEN DGCR <= 3 AND RADARCR > 3 THEN 'DG T10'
        WHEN DGCR > 3 AND RADARCR <= 3 THEN 'RADAR PICK'
        ELSE 'NO PICK'
    END AS PICKS
FROM AMEX2024;

--PICKS CUSTOM VIEW
SELECT * FROM PICKS
WHERE PICKS <> 'NO PICK';
