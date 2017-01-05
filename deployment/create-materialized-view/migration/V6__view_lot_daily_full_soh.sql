DROP MATERIALIZED VIEW IF EXISTS vw_lot_daily_full_soh;

CREATE MATERIALIZED VIEW vw_lot_daily_full_soh AS
  (SELECT DISTINCT ON (facility_code, drug_code, occurred_date)
     vw_lot_expiry_dates.stock_card_entry_id                                    AS stock_card_entry_id,
     vw_lot_expiry_dates.facility_name                                          AS facility_name,
     vw_lot_expiry_dates.facility_code                                          AS facility_code,

     vw_lot_expiry_dates.district_name                                          AS district_name,
     vw_lot_expiry_dates.district_code                                          AS district_code,

     vw_lot_expiry_dates.province_name                                          AS province_name,
     vw_lot_expiry_dates.province_code                                          AS province_code,

     vw_lot_expiry_dates.drug_code                                              AS drug_code,
     vw_lot_expiry_dates.drug_name                                              AS drug_name,

     set_value(vw_lot_expiry_dates.stock_card_entry_id, 'soh')                  AS soh,
     MIN(vw_lot_expiry_dates.expiration_date)                                   AS soonest_expiry_date,

     vw_lot_expiry_dates.occurred_date                                          AS occurred,
     vw_lot_expiry_dates.last_sync_date                                         AS last_sync_date,
     cmm_at_day(vw_lot_expiry_dates.facility_id, vw_lot_expiry_dates.drug_code, vw_lot_expiry_dates.occurred_date) AS cmm,
     uuid_in(md5(random() :: TEXT || now() :: TEXT) :: cstring)                 AS uuid

   FROM vw_lot_expiry_dates
     LEFT JOIN cmm_entries ON vw_lot_expiry_dates.facility_id = cmm_entries.facilityid
     GROUP BY vw_lot_expiry_dates.facility_name, vw_lot_expiry_dates.facility_code,
      vw_lot_expiry_dates.district_name, vw_lot_expiry_dates.district_code,
      vw_lot_expiry_dates.province_name, vw_lot_expiry_dates.province_code,
      vw_lot_expiry_dates.drug_name, vw_lot_expiry_dates.drug_code,
      vw_lot_expiry_dates.facility_id, vw_lot_expiry_dates.last_sync_date,
      vw_lot_expiry_dates.stock_card_entry_id, vw_lot_expiry_dates.occurred_date
   ORDER BY facility_code, drug_code, occurred_date DESC);

CREATE UNIQUE INDEX idx_vw_lot_daily_full_soh ON vw_lot_daily_full_soh (uuid, facility_code, drug_code, last_sync_date);