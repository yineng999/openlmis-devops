INSERT INTO supplemental_programs (code, name, description, active)
SELECT 'RAPID_TEST', 'Rapid Test', 'Rapid test', TRUE
WHERE
  NOT EXISTS (
    SELECT code FROM supplemental_programs WHERE code = 'RAPID_TEST'
  );

INSERT INTO program_data_columns (code, supplementalProgramId) SELECT
'CONSUME_HIVDETERMINE', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST')
WHERE
  NOT EXISTS (
    SELECT code FROM program_data_columns WHERE code = 'CONSUME_HIVDETERMINE'
  );

INSERT INTO program_data_columns (code, supplementalProgramId) SELECT
'POSITIVE_HIVDETERMINE', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST')
WHERE
  NOT EXISTS (
    SELECT code FROM program_data_columns WHERE code = 'POSITIVE_HIVDETERMINE'
  );

INSERT INTO program_data_columns (code, supplementalProgramId) SELECT
'CONSUME_HIVUNIGOLD', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST')
WHERE
  NOT EXISTS (
    SELECT code FROM program_data_columns WHERE code = 'CONSUME_HIVUNIGOLD'
  );

INSERT INTO program_data_columns (code, supplementalProgramId) SELECT
'POSITIVE_HIVUNIGOLD', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST')
WHERE
  NOT EXISTS (
    SELECT code FROM program_data_columns WHERE code = 'POSITIVE_HIVUNIGOLD'
  );

INSERT INTO program_data_columns (code, supplementalProgramId) SELECT
'CONSUME_SYPHILLIS', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST')
WHERE
  NOT EXISTS (
    SELECT code FROM program_data_columns WHERE code = 'CONSUME_SYPHILLIS'
  );

INSERT INTO program_data_columns (code, supplementalProgramId) SELECT
'POSITIVE_SYPHILLIS', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST')
WHERE
  NOT EXISTS (
    SELECT code FROM program_data_columns WHERE code = 'POSITIVE_SYPHILLIS'
  );

INSERT INTO program_data_columns (code, supplementalProgramId) SELECT
'CONSUME_MALARIA', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST')
WHERE
  NOT EXISTS (
    SELECT code FROM program_data_columns WHERE code = 'CONSUME_MALARIA'
  );

INSERT INTO program_data_columns (code, supplementalProgramId) SELECT
'POSITIVE_MALARIA', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST')
WHERE
  NOT EXISTS (
    SELECT code FROM program_data_columns WHERE code = 'POSITIVE_MALARIA'
  );
