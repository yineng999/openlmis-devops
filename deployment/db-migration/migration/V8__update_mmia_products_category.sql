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