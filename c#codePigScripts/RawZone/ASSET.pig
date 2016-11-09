
SET mapreduce.output.basename 'cleanse-data';
incoming_data = LOAD '${INCOMING_DIR}' USING PigStorage('\u001C');
raw_stage_data = FOREACH incoming_data GENERATE
		$0 AS ID
		,$2 AS NAME
		,$12 AS DESCRIPTION
		,$17 AS SERIALNUMBER
		,$29 AS HP_PRODUCT_NUMBER__C
		,$42 AS FIRMWARE_VERSION__C
		,$45 AS PRODUCT_LINE__C
		,$46 AS SOFTWARE_PRODUCT_VERSION__C
		,TBD AS SRC_SYS_KY;
STORE raw_stage_data INTO '${RAW_STAGE_DIR}' USING PigStorage('\u001C');