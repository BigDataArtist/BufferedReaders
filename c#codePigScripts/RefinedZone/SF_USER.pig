
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($0 IS NULL ? '0' : $0)  AS ID
		,($4 IS NULL ? '0' : $4)  AS NAME
		,($31 IS NULL ? '0' : $31)  AS ISACTIVE
		,($231 IS NULL ? '0' : $231)  AS USEREMAIL__C
		,($1 IS NULL ? '0' : $1)  AS USERNAME
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');