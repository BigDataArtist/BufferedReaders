
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($12 IS NULL ? '0' : $12)  AS PART_ORDER_HEADER_NUMBER__C
		,($29 IS NULL ? '0' : $29)  AS OFFERED_PART_IDENTIFIER__C
		,($32 IS NULL ? '0' : $32)  AS PART_CONSUMPTION__C
		,($33 IS NULL ? '0' : $33)  AS PART_DELIVERED_TIMESTAMP__C
		,($34 IS NULL ? '0' : $34)  AS PART_DESCRIPTION__C
		,($37 IS NULL ? '0' : $37)  AS PART_LINE_STATUS__C
		,($40 IS NULL ? '0' : $40)  AS PART_RETURNABLE_CODE_IDENTIFIER__C
		,($42 IS NULL ? '0' : $42)  AS PART_SHIPPED_TIMESTAMP__C
		,($44 IS NULL ? '0' : $44)  AS PART_USAGE__C
		,($50 IS NULL ? '0' : $50)  AS REQUESTED_PART_IDENTIFIER__C
		,($65 IS NULL ? '0' : $65)  AS ROHS_CODE__C
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');