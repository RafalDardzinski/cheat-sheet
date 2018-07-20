/*
	Identifies new / inconsistent records in migration.Deliverables compared to config.Deliverables (based on DeliverableGUID) and updates the config.Deliverables:
		new records are added to the table
		if in config.Deliverables is a record inconsistent with its version in migration.Deliverables, it is updated with data from migration.Deliverables
*/

begin tran

merge 
	config.Deliverables as prod
using 
	(select * from migration.Deliverables except select * from config.Deliverables) as new
on
	(prod.DeliverableGUID = new.DeliverableGUID)
when matched
then update set
	prod.DeliverableLabel = new.DeliverableLabel,
	prod.DeliverableDescription = new.DeliverableDescription,
	prod.Level0Max = new.Level0Max,
	prod.Level1Max = new.Level1Max,
	prod.Level2Min = new.Level2Min,
	prod.IndicatorLabel = new.IndicatorLabel
when not matched by target
then
	insert (DeliverableGUID, DeliverableLabel, DeliverableDescription, TeamId, Level0Max, Level1Max, Level2Min, IndicatorLabel)
	values (DeliverableGUID, DeliverableLabel, DeliverableDescription, TeamId, Level0Max, Level1Max, Level2Min, IndicatorLabel);

commit tran
