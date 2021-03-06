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