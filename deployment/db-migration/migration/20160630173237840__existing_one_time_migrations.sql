INSERT INTO product_forms (code, displayOrder)
SELECT 'Sem',72
WHERE
    NOT EXISTS (
        SELECT code FROM product_forms WHERE code = 'Sem'
    );


INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId)
SELECT '08L01X', 'Agua para Injectavel', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '5ml', (SELECT id from product_forms where code='Embalagem')
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = '08L01X'
    );

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId)
SELECT '12D0YZ', 'Complexo B+Vitamina C', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '0,2%', (SELECT id from product_forms where code='Papel')
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = '12D0YZ'
    );

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId)
SELECT '15C0ZY', 'Benzoato de benzilo', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '0,2%', (SELECT id from product_forms where code='Embalagem')
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = '15C0ZY'
    );

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId)
SELECT '20A05', 'Cetrimida+Clorexidina', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '15 g + 1,5 g/100mL', (SELECT id from product_forms where code='Papel')
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = '20A05'
    );

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId)
SELECT 'MMC00001', 'Folheto, Mocambique Kit US & APE piece', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, 'SEM DOSAGEM', (SELECT id from product_forms where code='Sem')
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = 'MMC00001'
    );

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId)
SELECT 'MMC00002', 'Luvas de examinacao, Latex, medium ligeiramente polvilhadas', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, 'SEM DOSAGEM', (SELECT id from product_forms where code='Sem')
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = 'MMC00002'
    );

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId)
SELECT 'MMC00003', 'Poliamida 3/0, agulha curva 3/8 circlo,26 mm triangular', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, 'SEM DOSAGEM', (SELECT id from product_forms where code='Sem')
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = 'MMC00003'
    );

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId)
SELECT 'MMC00004', 'Caixa de incineracao para agulhas/seringas usadas,inflamavel, 5L', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, 'SEM DOSAGEM', (SELECT id from product_forms where code='Sem')
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = 'MMC00004'
    );

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId)
SELECT 'MMC00005', 'Sabao', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '110g', (SELECT id from product_forms where code='Sem')
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = 'MMC00005'
    );

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId)
SELECT 'MMC00006', 'Seringa descartavel, 10ml c/agulha 21gx1 1/2 3', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, 'SEM DOSAGEM', (SELECT id from product_forms where code='Sem')
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = 'MMC00006'
    );

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId, isKit)
SELECT 'SCOD10', 'KITS  (DE PME US)', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '1000', (SELECT id from product_forms where code='KIT'), TRUE
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = 'SCOD10'
    );

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId, isKit)
SELECT 'SCOD12', 'KITS  (DE PME APE)', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '250', (SELECT id from product_forms where code='KIT'), TRUE
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = 'SCOD12'
    );



INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = '08L01X'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = '08L01X' AND programs.code = 'ESS_MEDS'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = '12D0YZ'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = '12D0YZ' AND programs.code = 'ESS_MEDS'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = '15C0ZY'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = '15C0ZY' AND programs.code = 'ESS_MEDS'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = '20A05'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = '20A05' AND programs.code = 'ESS_MEDS'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'MMC00001'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = 'MMC00001' AND programs.code = 'ESS_MEDS'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'MMC00002'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = 'MMC00002' AND programs.code = 'ESS_MEDS'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'MMC00003'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = 'MMC00003' AND programs.code = 'ESS_MEDS'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'MMC00004'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = 'MMC00004' AND programs.code = 'ESS_MEDS'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'MMC00005'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = 'MMC00005' AND programs.code = 'ESS_MEDS'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'MMC00006'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = 'MMC00006' AND programs.code = 'ESS_MEDS'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'SCOD10'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = 'SCOD10' AND programs.code = 'ESS_MEDS'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'SCOD12'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = 'SCOD12' AND programs.code = 'ESS_MEDS'
    );




INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08L01X')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = '08L01X'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08L01X')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = '08L01X'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '12D0YZ')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = '12D0YZ'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '12D0YZ')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = '12D0YZ'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '15C0ZY')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = '15C0ZY'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '15C0ZY')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = '15C0ZY'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '20A05')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = '20A05'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '20A05')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = '20A05'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'MMC00001')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = 'MMC00001'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'MMC00001')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = 'MMC00001'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'MMC00002')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = 'MMC00002'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'MMC00002')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = 'MMC00002'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'MMC00003')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = 'MMC00003'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'MMC00003')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = 'MMC00003'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'MMC00004')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = 'MMC00004'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'MMC00004')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = 'MMC00004'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'MMC00005')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = 'MMC00005'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'MMC00005')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = 'MMC00005'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'MMC00006')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = 'MMC00006'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'MMC00006')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = 'MMC00006'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'SCOD10')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = 'SCOD10'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'SCOD10')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = 'SCOD10'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'SCOD12')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = 'SCOD12'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'SCOD12')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = 'SCOD12'
    );





INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '02A03', 200
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '02A03'
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
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '07A02'
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
SELECT 'SCOD10', '08L01X', 200
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '08L01X'
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
SELECT 'SCOD10', '11A23', 250
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '11A23'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '12D0YZ', 25
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
SELECT 'SCOD10', '15C0ZY', 10
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '15C0ZY'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '18C06', 1
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '18C06'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '20A05', 2
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '20A05'
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
SELECT 'SCOD10', '23D05', 96
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '23D05'
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

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', 'MMC00005', 3
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = 'MMC00005'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', 'MMC00006', 75
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = 'MMC00006'
    );


INSERT INTO losses_adjustments_types (name, description, additive)
SELECT 'UNPACK_KIT', 'Unpack kit', FALSE
WHERE
    NOT EXISTS (
        SELECT * FROM losses_adjustments_types WHERE name = 'UNPACK_KIT'
    );

INSERT INTO product_forms (code, displayorder) VALUES
('Esponjas', 73),
('Gotas oftálmicas', 74),
('Saqueta', 75),
('Shampô', 76),
('Tests', 77);

INSERT INTO requisition_periods(rnrid, periodstartdate, periodenddate)
SELECT r.id, p.startdate, p.enddate
FROM requisitions r LEFT JOIN processing_periods p ON r.periodid = p.id
WHERE r.id not in (select rnrid from requisition_periods);

CREATE OR REPLACE FUNCTION insert_into_role_assignments_by_user_name(uName VARCHAR(30))
  RETURNS SETOF VOID AS
$event$
DECLARE
  roleId       INTEGER;
  programCodes VARCHAR(30) ARRAY;
  pcode        VARCHAR(30);
  userId       INTEGER;

BEGIN

  programCodes := ARRAY ['TEST_KIT', 'TB', 'PME', 'MALARIA', 'NUTRITION', 'VIA', 'PTV', 'TARV'];

  SELECT id
  FROM roles
  WHERE name = 'Facility User'
  INTO roleId;

  SELECT id
  FROM users
  WHERE userName = uName
  INTO userId;
  IF userId IS NOT NULL
  THEN
    FOREACH pCode IN ARRAY programCodes LOOP

      INSERT INTO role_assignments
      (userId, roleId, programId, supervisoryNodeId) VALUES
        (userId, roleId, (SELECT id
                          FROM programs
                          WHERE code = pcode), NULL);
    END LOOP;
  END IF;

END;
$event$ LANGUAGE plpgsql;


UPDATE programs SET name = 'Medicamentos Essenciais' WHERE code = 'ESS_MEDS';

INSERT INTO programs (code, name, description, active, templateConfigured,
  regimenTemplateConfigured, budgetingApplies, usesDar, push)
SELECT 'TEST_KIT', 'Testes Rápidos Diag', 'Testes Rápidos Diag', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE
WHERE
  NOT EXISTS (
    SELECT * FROM programs WHERE code = 'TEST_KIT'
  );

INSERT INTO programs (code, name, description, active, templateConfigured,
  regimenTemplateConfigured, budgetingApplies, usesDar, push)
SELECT 'TB', 'Tuberculose', 'Tuberculose', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE
WHERE
  NOT EXISTS (
    SELECT * FROM programs WHERE code = 'TB'
  );

INSERT INTO programs (code, name, description, active, templateConfigured,
  regimenTemplateConfigured, budgetingApplies, usesDar, push)
SELECT 'MALARIA', 'Malaria', 'Malaria', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE
WHERE
  NOT EXISTS (
    SELECT * FROM programs WHERE code = 'MALARIA'
  );

INSERT INTO programs (code, name, description, active, templateConfigured,
  regimenTemplateConfigured, budgetingApplies, usesDar, push)
SELECT 'PTV', 'PTV', 'PTV', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE
WHERE
  NOT EXISTS (
    SELECT * FROM programs WHERE code = 'PTV'
  );

INSERT INTO programs (code, name, description, active, templateConfigured,
  regimenTemplateConfigured, budgetingApplies, usesDar, push)
SELECT 'TARV', 'TARV', 'TARV', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE
WHERE
  NOT EXISTS (
    SELECT * FROM programs WHERE code = 'TARV'
  );

INSERT INTO programs (code, name, description, active, templateConfigured,
  regimenTemplateConfigured, budgetingApplies, usesDar, push)
SELECT 'PME', 'PME', 'PME', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE
WHERE
  NOT EXISTS (
    SELECT * FROM programs WHERE code = 'PME'
  );

INSERT INTO programs (code, name, description, active, templateConfigured,
  regimenTemplateConfigured, budgetingApplies, usesDar, push)
SELECT 'NUTRITION', 'NUTRITION', 'NUTRITION', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE
WHERE
  NOT EXISTS (
    SELECT * FROM programs WHERE code = 'NUTRITION'
  );

INSERT INTO programs (code, name, description, active, templateConfigured,
  regimenTemplateConfigured, budgetingApplies, usesDar, push)
SELECT 'VIA', 'VIA', 'VIA', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE
WHERE
  NOT EXISTS (
    SELECT * FROM programs WHERE code = 'VIA'
  );

UPDATE programs SET parentId = (SELECT id FROM programs WHERE code = 'VIA')
WHERE code in ('ESS_MEDS', 'NUTRITION', 'TEST_KIT', 'TB', 'MALARIA', 'PME');

UPDATE programs SET parentId = (SELECT id FROM programs WHERE code = 'MMIA')
WHERE code in ('TARV', 'PTV');

INSERT INTO programs_supported (facilityId, programId, active, startDate) VALUES
((SELECT id FROM facilities WHERE code = 'HF1'), (SELECT id FROM programs WHERE code = 'TEST_KIT'),TRUE,'12/7/2015'),
((SELECT id FROM facilities WHERE code = 'HF1'), (SELECT id FROM programs WHERE code = 'TB'),TRUE,'12/7/2015'),
((SELECT id FROM facilities WHERE code = 'HF1'), (SELECT id FROM programs WHERE code = 'MALARIA'),TRUE,'12/7/2015'),
((SELECT id FROM facilities WHERE code = 'HF1'), (SELECT id FROM programs WHERE code = 'PME'),TRUE,'12/7/2015'),
((SELECT id FROM facilities WHERE code = 'HF1'), (SELECT id FROM programs WHERE code = 'NUTRITION'),TRUE,'12/7/2015'),
((SELECT id FROM facilities WHERE code = 'HF1'), (SELECT id FROM programs WHERE code = 'VIA'),TRUE,'12/7/2015'),
((SELECT id FROM facilities WHERE code = 'HF1'), (SELECT id FROM programs WHERE code = 'TARV'),TRUE,'12/7/2015'),
((SELECT id FROM facilities WHERE code = 'HF1'), (SELECT id FROM programs WHERE code = 'PTV'),TRUE,'12/7/2015'),

((SELECT id FROM facilities WHERE code = 'HF2'), (SELECT id FROM programs WHERE code = 'TEST_KIT'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF2'), (SELECT id FROM programs WHERE code = 'TB'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF2'), (SELECT id FROM programs WHERE code = 'MALARIA'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF2'), (SELECT id FROM programs WHERE code = 'PME'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF2'), (SELECT id FROM programs WHERE code = 'NUTRITION'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF2'), (SELECT id FROM programs WHERE code = 'VIA'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF2'), (SELECT id FROM programs WHERE code = 'TARV'),TRUE,'1/21/2016'),
((SELECT id FROM facilities WHERE code = 'HF2'), (SELECT id FROM programs WHERE code = 'PTV'),TRUE,'1/21/2016'),

((SELECT id FROM facilities WHERE code = 'HF3'), (SELECT id FROM programs WHERE code = 'TEST_KIT'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF3'), (SELECT id FROM programs WHERE code = 'TB'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF3'), (SELECT id FROM programs WHERE code = 'MALARIA'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF3'), (SELECT id FROM programs WHERE code = 'PME'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF3'), (SELECT id FROM programs WHERE code = 'NUTRITION'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF3'), (SELECT id FROM programs WHERE code = 'VIA'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF3'), (SELECT id FROM programs WHERE code = 'PTV'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF3'), (SELECT id FROM programs WHERE code = 'TARV'),TRUE,'1/1/2016'),

((SELECT id FROM facilities WHERE code = 'HF4'), (SELECT id FROM programs WHERE code = 'TEST_KIT'),TRUE,'9/21/2015'),
((SELECT id FROM facilities WHERE code = 'HF4'), (SELECT id FROM programs WHERE code = 'TB'),TRUE,'9/21/2015'),
((SELECT id FROM facilities WHERE code = 'HF4'), (SELECT id FROM programs WHERE code = 'MALARIA'),TRUE,'9/21/2015'),
((SELECT id FROM facilities WHERE code = 'HF4'), (SELECT id FROM programs WHERE code = 'PME'),TRUE,'9/21/2015'),
((SELECT id FROM facilities WHERE code = 'HF4'), (SELECT id FROM programs WHERE code = 'NUTRITION'),TRUE,'9/21/2015'),
((SELECT id FROM facilities WHERE code = 'HF4'), (SELECT id FROM programs WHERE code = 'VIA'),TRUE,'9/21/2015'),
((SELECT id FROM facilities WHERE code = 'HF4'), (SELECT id FROM programs WHERE code = 'PTV'),TRUE,'3/4/2015'),
((SELECT id FROM facilities WHERE code = 'HF4'), (SELECT id FROM programs WHERE code = 'TARV'),TRUE,'3/4/2015'),

((SELECT id FROM facilities WHERE code = 'HF5'), (SELECT id FROM programs WHERE code = 'TEST_KIT'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF5'), (SELECT id FROM programs WHERE code = 'TB'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF5'), (SELECT id FROM programs WHERE code = 'MALARIA'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF5'), (SELECT id FROM programs WHERE code = 'PME'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF5'), (SELECT id FROM programs WHERE code = 'NUTRITION'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF5'), (SELECT id FROM programs WHERE code = 'VIA'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF5'), (SELECT id FROM programs WHERE code = 'PTV'),TRUE,'12/21/2015'),
((SELECT id FROM facilities WHERE code = 'HF5'), (SELECT id FROM programs WHERE code = 'TARV'),TRUE,'12/21/2015'),

((SELECT id FROM facilities WHERE code = 'HF6'), (SELECT id FROM programs WHERE code = 'TEST_KIT'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF6'), (SELECT id FROM programs WHERE code = 'TB'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF6'), (SELECT id FROM programs WHERE code = 'MALARIA'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF6'), (SELECT id FROM programs WHERE code = 'PME'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF6'), (SELECT id FROM programs WHERE code = 'NUTRITION'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF6'), (SELECT id FROM programs WHERE code = 'VIA'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF6'), (SELECT id FROM programs WHERE code = 'PTV'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF6'), (SELECT id FROM programs WHERE code = 'TARV'),TRUE,'9/20/2015'),

((SELECT id FROM facilities WHERE code = 'HF7'), (SELECT id FROM programs WHERE code = 'TEST_KIT'),TRUE,'3/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF7'), (SELECT id FROM programs WHERE code = 'TB'),TRUE,'3/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF7'), (SELECT id FROM programs WHERE code = 'MALARIA'),TRUE,'3/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF7'), (SELECT id FROM programs WHERE code = 'PME'),TRUE,'3/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF7'), (SELECT id FROM programs WHERE code = 'NUTRITION'),TRUE,'3/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF7'), (SELECT id FROM programs WHERE code = 'VIA'),TRUE,'3/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF7'), (SELECT id FROM programs WHERE code = 'PTV'),TRUE,'3/23/2016'),
((SELECT id FROM facilities WHERE code = 'HF7'), (SELECT id FROM programs WHERE code = 'TARV'),TRUE,'3/23/2016'),

((SELECT id FROM facilities WHERE code = 'HF8'), (SELECT id FROM programs WHERE code = 'TEST_KIT'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF8'), (SELECT id FROM programs WHERE code = 'TB'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF8'), (SELECT id FROM programs WHERE code = 'MALARIA'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF8'), (SELECT id FROM programs WHERE code = 'PME'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF8'), (SELECT id FROM programs WHERE code = 'NUTRITION'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF8'), (SELECT id FROM programs WHERE code = 'VIA'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF8'), (SELECT id FROM programs WHERE code = 'PTV'),TRUE,'1/1/2016'),
((SELECT id FROM facilities WHERE code = 'HF8'), (SELECT id FROM programs WHERE code = 'TARV'),TRUE,'1/1/2016'),

((SELECT id FROM facilities WHERE code = 'HF9'), (SELECT id FROM programs WHERE code = 'TEST_KIT'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF9'), (SELECT id FROM programs WHERE code = 'TB'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF9'), (SELECT id FROM programs WHERE code = 'MALARIA'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF9'), (SELECT id FROM programs WHERE code = 'PME'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF9'), (SELECT id FROM programs WHERE code = 'NUTRITION'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF9'), (SELECT id FROM programs WHERE code = 'VIA'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF9'), (SELECT id FROM programs WHERE code = 'PTV'),TRUE,'9/20/2015'),
((SELECT id FROM facilities WHERE code = 'HF9'), (SELECT id FROM programs WHERE code = 'TARV'),TRUE,'9/20/2015');

UPDATE programs SET templateConfigured = FALSE WHERE id = (SELECT id FROM programs WHERE code = 'ESS_MEDS');

INSERT INTO program_rnr_columns
(masterColumnId, rnrOptionId, programId, visible, source, position, label) VALUES
(1, null, (select id from programs where code = 'VIA'),  TRUE,'U', 1,  'Skip'),
(2, null, (select id from programs where code = 'VIA'),  TRUE, 'R', 2,  'Product Code'),
(3, null, (select id from programs where code = 'VIA'),  FALSE, 'R', 3,  'Product'),
(4, null, (select id from programs where code = 'VIA'),  FALSE, 'R', 4,  'Unit/Unit of Issue'),
(5, null, (select id from programs where code = 'VIA'),  TRUE, 'U', 5,  'Beginning Balance'),
(6, null, (select id from programs where code = 'VIA'),  TRUE, 'U', 6,  'Total Received Quantity'),
(7, null, (select id from programs where code = 'VIA'),  FALSE, 'C', 7,  'Total'),
(8, null, (select id from programs where code = 'VIA'),  TRUE, 'U', 8,  'Total Consumed Quantity'),
(9, null, (select id from programs where code = 'VIA'),  TRUE, 'U', 9,  'Total Losses / Adjustments'),
(10, null, (select id from programs where code = 'VIA'), TRUE, 'U', 10,  'Stock on Hand'),
(11, 1   , (select id from programs where code = 'VIA'), FALSE, 'U', 11, 'New Patients'),
(12, null, (select id from programs where code = 'VIA'), FALSE, 'U', 12, 'Total Stockout Days'),
(13, null, (select id from programs where code = 'VIA'), FALSE, 'C', 13, 'Monthly Normalized Consumption'),
(25, null, (select id from programs where code = 'VIA'), FALSE, 'C', 14, 'Period Normalized Consumption'),
(14, null, (select id from programs where code = 'VIA'), FALSE, 'C', 15, 'Average Monthly Consumption(AMC)'),
(15, null, (select id from programs where code = 'VIA'), FALSE, 'C', 16, 'Maximum Stock Quantity'),
(16, null, (select id from programs where code = 'VIA'), TRUE, 'U', 17, 'Calculated Order Quantity'),
(17, null, (select id from programs where code = 'VIA'), TRUE, 'U', 18, 'Requested Quantity'),
(18, null, (select id from programs where code = 'VIA'), TRUE, 'U', 19, 'Requested Quantity Explanation'),
(19, null, (select id from programs where code = 'VIA'), TRUE, 'U', 20, 'Approved Quantity'),
(20, null, (select id from programs where code = 'VIA'), FALSE, 'C', 21, 'Packs to Ship'),
(21, null, (select id from programs where code = 'VIA'), FALSE, 'R', 22, 'Price per Pack'),
(22, null, (select id from programs where code = 'VIA'), FALSE, 'C', 23, 'Total Cost'),
(23, null, (select id from programs where code = 'VIA'), FALSE, 'U', 24, 'Expiration Date(MM/YYYY)'),
(24, null, (select id from programs where code = 'VIA'), FALSE, 'U', 25, 'Remarks');
UPDATE programs SET templateConfigured = TRUE WHERE id = (SELECT id FROM programs WHERE code = 'VIA');

UPDATE requisition_group_program_schedules SET programId = (SELECT id FROM programs WHERE code = 'VIA')
WHERE requisitiongroupid = (SELECT id FROM requisition_groups WHERE code = 'RG2');

SELECT insert_into_role_assignments_by_user_name('Marracuene');
SELECT insert_into_role_assignments_by_user_name('Mali');
SELECT insert_into_role_assignments_by_user_name('Ricatla');
SELECT insert_into_role_assignments_by_user_name('Ed-Mondlane');
SELECT insert_into_role_assignments_by_user_name('Mumemo');
SELECT insert_into_role_assignments_by_user_name('Matalane');
SELECT insert_into_role_assignments_by_user_name('Habel-Jafar');
SELECT insert_into_role_assignments_by_user_name('Michafutene');
SELECT insert_into_role_assignments_by_user_name('Machubo');

UPDATE role_assignments
  SET programId = (SELECT id FROM programs WHERE code = 'VIA')
  WHERE userId = (SELECT id FROM users WHERE username = 'DDM_Marracuene');

UPDATE role_assignments
  SET programId = (SELECT id FROM programs WHERE code = 'VIA')
  WHERE userId = (SELECT id FROM users WHERE username = 'Admin123')
  AND programID =  (SELECT id FROM programs WHERE code = 'ESS_MEDS');

UPDATE requisitions SET programid = (SELECT id FROM programs WHERE code = 'VIA') WHERE programid = (SELECT id FROM programs WHERE code = 'ESS_MEDS');

UPDATE programs SET isSupportEmergency = TRUE WHERE code IN ('VIA','TEST_KIT','TB','MALARIA','PME','NUTRITION','ESS_MEDS');

DELETE FROM product_categories WHERE name NOT IN ('Adult', 'Children', 'Solution', 'Other');


INSERT INTO product_categories (code, name, displayorder)
SELECT '12', 'Adult', '12'
WHERE
    NOT EXISTS (
        SELECT code FROM product_categories WHERE name = 'Adult'
    );

INSERT INTO product_categories (code, name, displayorder)
SELECT '13', 'Children', '13'
WHERE
    NOT EXISTS (
        SELECT code FROM product_categories WHERE name = 'Children'
    );

INSERT INTO product_categories (code, name, displayorder)
SELECT '14', 'Solution', '14'
WHERE
    NOT EXISTS (
        SELECT code FROM product_categories WHERE name = 'Solution'
    );


UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Adult'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S42';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Adult'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S18Y';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Adult'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S40';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Adult'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S36';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Adult'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S32';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Adult'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S18Z';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Adult'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S39Z';

  UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Adult'), modifieddate = now()
  FROM products p WHERE p.id = program_products.productid AND p.code='08S21';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Adult'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S01';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Adult'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S22';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Adult'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S13';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Adult'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S15';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Children'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S34B';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Children'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S32Z';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Children'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S42B';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Children'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S40Z';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Children'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S39B';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Children'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S39Y';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Children'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S01ZZ';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Children'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S20';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Children'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S19';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Children'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S01B';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Solution'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S23';

UPDATE program_products SET productcategoryid = (SELECT id FROM product_categories WHERE name='Solution'), modifieddate = now()
FROM products p WHERE p.id = program_products.productid AND p.code='08S17';

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId, isKit)
SELECT 'SCOD10-AL', 'KITS  (DE PME US AL)180 TREATMENT', 'KIT', 1, 1, TRUE, TRUE, FALSE, 0, FALSE, '180', (SELECT id from product_forms where code='KIT'), TRUE
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = 'SCOD10-AL'
    );

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId, isKit)
SELECT 'SCOD12-AL', 'KITS  (DE PME APE AL)75 TREATMENT', 'KIT', 1, 1, TRUE, TRUE, FALSE, 0, FALSE, '75', (SELECT id from product_forms where code='KIT'), TRUE
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = 'SCOD12-AL'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'SCOD10-AL'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = 'SCOD10-AL' AND programs.code = 'ESS_MEDS'
    );

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'SCOD12-AL'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = 'SCOD12-AL' AND programs.code = 'ESS_MEDS'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'SCOD10-AL')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = 'SCOD10-AL'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'SCOD10-AL')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = 'SCOD10-AL'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'SCOD12-AL')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = 'SCOD12-AL'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'SCOD12-AL')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = 'SCOD12-AL'
    );


INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10-AL', '08O05', 60
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10-AL' AND productCode = '08O05'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10-AL', '08O05Z', 30
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10-AL' AND productCode = '08O05Z'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10-AL', '08O05Y', 20
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10-AL' AND productCode = '08O05Y'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10-AL', '08O05X', 60
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10-AL' AND productCode = '08O05X'
    );

INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10-AL', '22A08', 14
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10-AL' AND productCode = '22A08'
    );

UPDATE losses_adjustments_types SET category = 'RECEIVE' WHERE name IN ('DISTRICT_DDM','PROVINCE_DPM','DEFAULT_RECEIVE');
UPDATE losses_adjustments_types SET category = 'ISSUE' WHERE name IN ('PUB_PHARMACY','MATERNITY','GENERAL_WARD','ACC_EMERGENCY','MOBILE_UNIT','LABORATORY','UATS','PNCTL','PAV','DENTAL_WARD','UNPACK_KIT','DEFAULT_ISSUE');

UPDATE losses_adjustments_types SET category = 'NEGATIVE_ADJUST' WHERE name IN ('EXPIRED_RETURN_TO_SUPPLIER','DAMAGED','LOANS_DEPOSIT','INVENTORY_NEGATIVE','PROD_DEFECTIVE','DEFAULT_NEGATIVE_ADJUSTMENT');

UPDATE losses_adjustments_types SET category = 'POSITIVE_ADJUST' WHERE name IN ('CUSTOMER_RETURN','EXPIRED_RETURN_FROM_CUSTOMER','DONATION','LOANS_RECEIVED','INVENTORY_POSITIVE','RETURN_FROM_QUARANTINE','DEFAULT_POSITIVE_ADJUSTMENT');

UPDATE losses_adjustments_types SET category = 'PHYSICAL_INVENTORY' WHERE name IN ('INVENTORY');


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