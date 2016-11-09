
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($0 IS NULL ? '0' : $0)  AS ID
		,($2 IS NULL ? '0' : $2)  AS NAME
		,($12 IS NULL ? '0' : $12)  AS DESCRIPTION
		,($17 IS NULL ? '0' : $17)  AS SERIALNUMBER
		,($29 IS NULL ? '0' : $29)  AS HP_PRODUCT_NUMBER__C
		,($42 IS NULL ? '0' : $42)  AS FIRMWARE_VERSION__C
		,($45 IS NULL ? '0' : $45)  AS PRODUCT_LINE__C
		,($46 IS NULL ? '0' : $46)  AS SOFTWARE_PRODUCT_VERSION__C
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');