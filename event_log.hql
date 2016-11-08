use ea_shared;
CREATE TABLE ea_shared.event_log_audit
(
   job_key STRING
, oozie_id STRING
, source_system_name STRING
, process_type STRING
, process_type_name STRING
, script_name STRING
, service_account STRING
, host_address STRING
, event_msg STRING
, event_log_url STRING
, event_ts STRING
, job_step_num STRING
, job_status STRING
, log_type STRING
)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cf:oozie_id,cf:source_system_name,cf:process_type,cf:process_type_name,cf:script_name,cf:service_account,cf:host_address,cf:event_msg,cf:event_log_url,cf:event_ts,cf:job_step_num,cf:job_status,cf:log_type")
TBLPROPERTIES ("hbase.table.name" = "event_log_audit_gsd");

