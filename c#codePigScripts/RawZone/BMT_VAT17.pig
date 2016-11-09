
SET mapreduce.output.basename 'cleanse-data';
incoming_data = LOAD '${INCOMING_DIR}' USING PigStorage('\u001C');
raw_stage_data = FOREACH incoming_data GENERATE
		$0 AS BMT_VAT_17_KY
		,$2 AS HPL
		,$5 AS SUB_GBU
		,$7 AS SPL
		,$19 AS GBU_L1
		,$20 AS GBU_L2
		,TBD AS SRC_SYS_KY;
STORE raw_stage_data INTO '${RAW_STAGE_DIR}' USING PigStorage('\u001C');