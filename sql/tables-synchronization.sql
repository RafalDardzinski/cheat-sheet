/*
	Identifies new / inconsistent records in migration.Deliverables compared to config.Deliverables (based on DeliverableGUID) and updates the config.Deliverables:
		new records are added to the table
		if in config.Deliverables is a record inconsistent with its version in migration.Deliverables, it is updated with data from migration.Deliverables
*/

begin tran

select * from dbo.source
select * from dbo.target

declare @department tinyint
set @department = 1 -- department that is currently being updated


merge 
	dbo.target target
using 
	(select * from dbo.source union select * from dbo.target where Department != @department) source
on
	target.ID = source.ID
when matched
then update set
	target.Name = source.Name,
	target.Job = source.Job,
	target.Department = source.Department
when not matched 
then
	insert (ID, Name, Job, Department)
	values (ID, Name, Job, Department)
WHEN NOT MATCHED BY SOURCE
THEN DELETE;

select * from dbo.target

rollback tran
