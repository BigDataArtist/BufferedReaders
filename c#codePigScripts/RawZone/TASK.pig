
SET mapreduce.output.basename 'cleanse-data';
incoming_data = LOAD '${INCOMING_DIR}' USING PigStorage('\u001C');
raw_stage_data = FOREACH incoming_data GENERATE
		$0 AS ID
		,$6 AS SUBJECT
		,$8 AS STATUS
		,$11 AS DESCRIPTION
		,$19 AS LASTMODIFIEDDATE
		,$40 AS COMPLETION_DATE__C
		,$57 AS ASSIGNED_TO_ROLE__C
		,$3 AS WHATID
		,TBD AS SRC_SYS_KY;
STORE raw_stage_data INTO '${RAW_STAGE_DIR}' USING PigStorage('\u001C');