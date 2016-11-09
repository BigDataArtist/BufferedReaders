
SET mapreduce.output.basename 'cleanse-data';
incoming_data = LOAD '${INCOMING_DIR}' USING PigStorage('\u001C');
raw_stage_data = FOREACH incoming_data GENERATE
		$0 AS ID
		,$3 AS NAME
		,$11 AS ACTIVE__C
		,TBD AS SRC_SYS_KY;
STORE raw_stage_data INTO '${RAW_STAGE_DIR}' USING PigStorage('\u001C');