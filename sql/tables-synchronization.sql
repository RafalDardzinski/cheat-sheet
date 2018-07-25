/*
	Identifies new / inconsistent records in migration.Deliverables compared to config.Deliverables (based on DeliverableGUID) and updates the config.Deliverables:
		new records are added to the table
		if in config.Deliverables is a record inconsistent with its version in migration.Deliverables, it is updated with data from migration.Deliverables
*/

begin tran

begin tran

merge 
	data.Reports as prod
using 
	(select * from migration.Reports) as new
on
	(prod.GUID = new.GUID)
when matched
then update set
	prod.DeliverableLabel = new.DeliverableLabel,
	prod.IndicatorValue = new.IndicatorValue,
	prod.ReportYear = new.ReportYear,
	prod.ReportInterval = new.ReportInterval,
	prod.TeamId = new.TeamId

when not matched by target
then
	insert (GUID, DeliverableLabel, IndicatorValue, ReportYear, TeamId, ReportInterval)
	values (GUID, DeliverableLabel, IndicatorValue, ReportYear, TeamId, ReportInterval)
WHEN NOT MATCHED BY SOURCE
THEN DELETE;

commit tran
