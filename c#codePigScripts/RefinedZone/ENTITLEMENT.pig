
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($0 IS NULL ? '0' : $0)  AS ID
		,($8 IS NULL ? '0' : $8)  AS SYSTEMMODSTAMP
		,($13 IS NULL ? '0' : $13)  AS SERVICECONTRACTID
		,($23 IS NULL ? '0' : $23)  AS STATUS
		,($12 IS NULL ? '0' : $12)  AS TYPE
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');