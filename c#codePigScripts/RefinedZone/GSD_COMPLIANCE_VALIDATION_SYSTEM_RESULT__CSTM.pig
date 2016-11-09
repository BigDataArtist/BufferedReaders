
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($7 IS NULL ? '0' : $7)  AS LASTMODIFIEDBYID
		,($10 IS NULL ? '0' : $10)  AS CASE__C
		,($11 IS NULL ? '0' : $11)  AS CONDITION_ID__C
		,($15 IS NULL ? '0' : $15)  AS ONSITE_TASK_ID__C
		,($16 IS NULL ? '0' : $16)  AS OVERRIDE_REASON__C
		,($18 IS NULL ? '0' : $18)  AS PART_ORDER_IDENTIFIER__C
		,($19 IS NULL ? '0' : $19)  AS STATUS__C
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');