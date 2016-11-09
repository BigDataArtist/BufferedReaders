
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($11 IS NULL ? '0' : $11)  AS CKSW__CASE__C
		,($0 IS NULL ? '0' : $0)  AS ID
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');