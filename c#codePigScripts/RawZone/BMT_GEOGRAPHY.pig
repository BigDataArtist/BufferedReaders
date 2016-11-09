
SET mapreduce.output.basename 'cleanse-data';
incoming_data = LOAD '${INCOMING_DIR}' USING PigStorage('\u001C');
raw_stage_data = FOREACH incoming_data GENERATE
		$0 AS BMT_GEOGRAPHY_KY
		,$2 AS ISO_COUNTRY_CODE
		,$10 AS COUNTRY
		,$4 AS REGION
		,TBD AS SRC_SYS_KY;
STORE raw_stage_data INTO '${RAW_STAGE_DIR}' USING PigStorage('\u001C');