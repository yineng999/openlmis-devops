INSERT INTO requisition_period(rnrid, periodstartdate, periodenddate)
SELECT r.id, p.startdate, p.enddate
FROM requisitions r LEFT JOIN processing_periods p ON r.periodid = p.id
WHERE r.id not in (select rnrid from requisition_period);