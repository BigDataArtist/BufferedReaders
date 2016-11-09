
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($0 IS NULL ? '0' : $0)  AS ID
		,($40 IS NULL ? '0' : $40)  AS STATE__C
		,($56 IS NULL ? '0' : $56)  AS STREET_LINE_1__C
		,($57 IS NULL ? '0' : $57)  AS STREET_LINE_2__C
		,($58 IS NULL ? '0' : $58)  AS STREET_LINE_3__C
		,($44 IS NULL ? '0' : $44)  AS WORLDREGION_REGION__C
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');