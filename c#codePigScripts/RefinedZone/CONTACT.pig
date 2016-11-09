
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($0 IS NULL ? '0' : $0)  AS ID
		,($5 IS NULL ? '0' : $5)  AS LASTNAME
		,($6 IS NULL ? '0' : $6)  AS FIRSTNAME
		,($26 IS NULL ? '0' : $26)  AS PHONE
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');