
SET mapreduce.output.basename 'cleanse-data';
incoming_data = LOAD '${INCOMING_DIR}' USING PigStorage('\u001C');
raw_stage_data = FOREACH incoming_data GENERATE
		$7 AS LASTMODIFIEDBYID
		,$10 AS CASE__C
		,$11 AS CONDITION_ID__C
		,$15 AS ONSITE_TASK_ID__C
		,$16 AS OVERRIDE_REASON__C
		,$18 AS PART_ORDER_IDENTIFIER__C
		,$19 AS STATUS__C
		,TBD AS SRC_SYS_KY;
STORE raw_stage_data INTO '${RAW_STAGE_DIR}' USING PigStorage('\u001C');