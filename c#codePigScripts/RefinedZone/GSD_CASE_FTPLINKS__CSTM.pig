
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($0 IS NULL ? '0' : $0)  AS ID
		,($2 IS NULL ? '0' : $2)  AS NAME
		,($10 IS NULL ? '0' : $10)  AS LINK_URL__C
		,($11 IS NULL ? '0' : $11)  AS COMMENT__C
		,($14 IS NULL ? '0' : $14)  AS TITLE__C
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');