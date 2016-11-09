
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($0 IS NULL ? '0' : $0)  AS ID
		,($6 IS NULL ? '0' : $6)  AS SUBJECT
		,($8 IS NULL ? '0' : $8)  AS STATUS
		,($11 IS NULL ? '0' : $11)  AS DESCRIPTION
		,($19 IS NULL ? '0' : $19)  AS LASTMODIFIEDDATE
		,($40 IS NULL ? '0' : $40)  AS COMPLETION_DATE__C
		,($57 IS NULL ? '0' : $57)  AS ASSIGNED_TO_ROLE__C
		,($3 IS NULL ? '0' : $3)  AS WHATID
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');