INSERT INTO kit_products_relation (kitCode, productCode, quantity)
SELECT 'SCOD10', '07A02', 1000
WHERE
    NOT EXISTS (
        SELECT * FROM kit_products_relation WHERE kitCode = 'SCOD10' AND productCode = '07A02'
    );