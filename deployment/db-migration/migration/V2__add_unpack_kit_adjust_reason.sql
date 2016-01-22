INSERT INTO losses_adjustments_types (name, description, additive)
SELECT 'UNPACK_KIT', 'Unpack kit', FALSE
WHERE
    NOT EXISTS (
        SELECT * FROM losses_adjustments_types WHERE name = 'UNPACK_KIT'
    );