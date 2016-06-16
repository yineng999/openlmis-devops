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

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId)
SELECT '12D09Z', 'Vitamina A 200.000 lU + Vitamine E 40IU, capsulas', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '200.000 lU + 40IU', (SELECT id from product_forms where code='Cápsulas')
WHERE
    NOT EXISTS (
        SELECT code FROM products WHERE code = '12D09Z'
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

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder)
SELECT (SELECT id FROM programs WHERE code = 'NUTRITION'), (SELECT id FROM products WHERE code = '12D09Z'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = '11'), 0.0,  14
WHERE
    NOT EXISTS (
        SELECT * FROM program_products LEFT JOIN products ON products.id = productId LEFT JOIN programs ON programs.id = programId WHERE products.code = '12D09Z' AND programs.code = 'NUTRITION'
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

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-I'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '12D09Z')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-I' AND p.code = '12D09Z'
    );

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock)
SELECT (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '12D09Z')), 1
WHERE
    NOT EXISTS (
        SELECT * FROM facility_approved_products LEFT JOIN facility_types f ON f.id = facilityTypeId LEFT JOIN program_products pp ON pp.id = programProductId LEFT JOIN products p ON p.id = pp.productId WHERE f.code = 'CSRUR-II' AND p.code = '12D09Z'
    );