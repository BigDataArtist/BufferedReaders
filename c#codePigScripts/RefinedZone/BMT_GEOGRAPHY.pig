
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($0 IS NULL ? '0' : $0)  AS BMT_GEOGRAPHY_KY
		,($2 IS NULL ? '0' : $2)  AS ISO_COUNTRY_CODE
		,($10 IS NULL ? '0' : $10)  AS COUNTRY
		,($4 IS NULL ? '0' : $4)  AS REGION
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');