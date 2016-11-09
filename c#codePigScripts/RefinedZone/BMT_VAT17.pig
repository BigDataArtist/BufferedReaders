
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($0 IS NULL ? '0' : $0)  AS BMT_VAT_17_KY
		,($2 IS NULL ? '0' : $2)  AS HPL
		,($5 IS NULL ? '0' : $5)  AS SUB_GBU
		,($7 IS NULL ? '0' : $7)  AS SPL
		,($19 IS NULL ? '0' : $19)  AS GBU_L1
		,($20 IS NULL ? '0' : $20)  AS GBU_L2
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');