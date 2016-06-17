INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId)
SELECT '11A23B', 'Sais de Rehidratacao Oral 20.5g, WHO mod. Saquetas', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '20.5g', (SELECT id from product_forms where code='Saquetas')
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = '11A23B'
    );

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId)
SELECT '11A23A', 'Sais de Rehidratacao Oral 27.9g, WHO mod. Saquetas', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '27.9g', (SELECT id from product_forms where code='Saquetas')
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = '11A23A'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = '11A23B'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = '11A23B' AND programs.code = 'ESS_MEDS'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = '11A23A'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = '11A23A' AND programs.code = 'ESS_MEDS'
    );


INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '11A23B')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = '11A23B'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '11A23B')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = '11A23B'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '11A23A')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = '11A23A'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '11A23A')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = '11A23A'
    );


UPDATE products
SET primaryName = 'Clorexidina 1.5% + Cetrimida 15%,500ml. Frasco',
    strength = '1.5% + 15%,500ml'
WHERE code = '20A05';

UPDATE products
SET primaryName = 'Diazepam 5mg/ml,2ml,Ampolas',
    strength = '5mg/ml, 2ml'
WHERE code = '07I07';

UPDATE products
SET primaryName = 'Sulfato Ferroso 300mg (Eq to 97.5mg Fe) + Acido Folico 1mg, comprimidos',
    strength = '300mg + 1mg'
WHERE code = '06A07';

UPDATE products
SET primaryName = 'Saquetas para Comprimidos, 100x150x0.05mm',
    strength = '100x150x0.05mm'
WHERE code = '26B03';

UPDATE products
SET primaryName = 'Tetraciclina HCI 1%, 5g, pomada para vista,tubos',
    strength = '1%, 5g'
WHERE code = '17C07';

UPDATE products
SET primaryName = 'Agua para injeccao, 10ml, ampolas',
    strength = '10ml'
WHERE code = '11A0XX';


DELETE FROM kit_products_relation WHERE kitCode = 'SCOD10';

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '02A01', 200
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '02A01'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '02E02', 25
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '02E02'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '04B05', 40
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '04B05'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '05A01', 500
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '05A01'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '05A09', 400
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '05A09'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '06A07', 5000
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '06A07'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '07A02', 1000
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '05A01'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '07A03', 5000
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '07A03'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '07A06', 20
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '07A06'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '07I07', 5
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '07I07'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '08A01', 1500
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '08A01'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '08A04', 25
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '08A04'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '08A06', 25
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '08A06'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '08A08', 60
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '08A08'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '08F06', 500
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '08F06'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '08G01', 300
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '08G01'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '08H01', 400
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '08H01'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '08I01', 4000
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '08I01'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '08I03', 50
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '08I03'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '08K04', 2000
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '08K04'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '08N01Z', 150
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '08N01Z'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '08N06', 30
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '08N06'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '08Q07', 10
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '08Q07'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '10A07', 75
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '10A07'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '11A0XX', 250
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '11A0XX'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '11A23A', 250
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '11A23A'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '11A23B', 50
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '11A23B'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '12D09Z', 25
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '12D0YZ'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '13A01', 5
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '13A01'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '13A02', 500
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '13A02'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '14A03', 800
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '14A03'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '15C08', 5
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '15C08'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '15C0ZX', 10
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '15C0ZX'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '17C07', 50
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '17C07'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '18C05', 1
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '18C05'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '20A05', 2
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '20A05'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '20A09ZY', 3
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '20A09ZY'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '23A02Y', 8
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '23A02Y'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '23B01', 6
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '23B01'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '23C01', 40
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '23C01'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '23D02', 96
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '23D02'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '24B08', 75
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '24B08'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '26B03', 2500
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '26B03'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', 'MMC00001', 1
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = 'MMC00001'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', 'MMC00002', 100
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = 'MMC00002'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', 'MMC00003', 10
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = 'MMC00003'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', 'MMC00004', 1
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = 'MMC00004'
    );