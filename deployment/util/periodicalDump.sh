pg_dump open_lmis -U openlmis > ~/dumpForProdSim.sql
pg_dump -U openlmis open_lmis -T 'vw_carry_start_dates' -T 'vw_daily_full_soh' -T 'vw_lot_daily_full_soh' -T 'vw_lot_expiry_dates' -T 'vw_period_movements' -T 'vw_stockouts' -T 'vw_weekly_tracer_soh'> ~/dumpWithoutMVForProdSim.sql
python anonymize_data.py

scp -i ~/.ssh/openlmis.pem ~/dumpForProdSim.sql ubuntu@52.193.130.59:/home/ubuntu/
scp -i ~/.ssh/openlmis.pem ~/dumpForProdSim.sql ubuntu@52.193.129.131:/home/ubuntu/

scp -i ~/.ssh/openlmis.pem ~/dumpWithoutMVForProdSim.sql ubuntu@52.193.130.59:/home/ubuntu/
scp -i ~/.ssh/openlmis.pem ~/dumpWithoutMVForProdSim.sql ubuntu@52.193.129.131:/home/ubuntu/
