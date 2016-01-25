pg_dump open_lmis -U openlmis > ~/dumpForProdSim.sql
python anonymize_data.py
scp -i ~/.ssh/openlmis.pem ~/dumpForProdSim.sql ubuntu@52.193.130.59:/home/ubuntu/
scp -i ~/.ssh/openlmis.pem ~/dumpForProdSim.sql ubuntu@52.193.129.131:/home/ubuntu/
