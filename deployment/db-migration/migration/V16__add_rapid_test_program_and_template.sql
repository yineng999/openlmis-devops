INSERT INTO supplemental_programs (code, name, description, active)
VALUES ('RAPID_TEST', 'Rapid Test', 'Rapid test', TRUE);

INSERT INTO program_data_columns (code, supplmentalProgramId) VALUES
('HIV-DETERMINE-CONSUME', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST'));

INSERT INTO program_data_columns (code, supplmentalProgramId) VALUES
('HIV-DETERMINE-POSITIVE', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST'));

INSERT INTO program_data_columns (code, supplmentalProgramId) VALUES
('HIV-UNIGOLD-CONSUME', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST'));

INSERT INTO program_data_columns (code, supplmentalProgramId) VALUES
('HIV-UNIGOLD-POSITIVE', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST'));

INSERT INTO program_data_columns (code, supplmentalProgramId) VALUES
('SYPHILLIS-CONSUME', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST'));

INSERT INTO program_data_columns (code, supplmentalProgramId) VALUES
('SYPHILLIS-POSITIVE', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST'));

INSERT INTO program_data_columns (code, supplmentalProgramId) VALUES
('MALARIA-CONSUME', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST'));

INSERT INTO program_data_columns (code, supplmentalProgramId) VALUES
('MALARIA-POSITIVE', (SELECT id FROM supplemental_programs WHERE code = 'RAPID_TEST'));
