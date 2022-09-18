-- Warehouse wise Cancelled Shipment Count --

Select  CAST(dbo.ToBdt(sst.CreatedOn) AS date) Date,
		w.id WarehouseID,
		w.Name Warehouse,
		COUNT(s.id) ShipmentCOUNT 

FROM ShipmentStateTransition sst
JOIN Shipment s ON s.id=sst.ShipmentID
JOIN Warehouse w ON w.id=s.WarehouseID

WHERE sst.CreatedOn >='2022-08-04 00:00:00 +06:00'
AND  sst.CreatedOn <'2022-08-05 00:00:00 +06:00'
AND sst.ToState=9

GROUP BY	CAST(dbo.ToBdt(sst.CreatedOn) AS date),
			w.id,
			w.Name

ORDER BY 1,2 ASC