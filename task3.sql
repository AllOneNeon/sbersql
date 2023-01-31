
ALTER TABLE task3 ADD COLUMN valid_from_dt date;
ALTER TABLE task3 ADD COLUMN valid_to_dt date;

UPDATE task3 SET valid_from_dt = created_dttm;
UPDATE task3 SET valid_to_dt = '9999-12-31';