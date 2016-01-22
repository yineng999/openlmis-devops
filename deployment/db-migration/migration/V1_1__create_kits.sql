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