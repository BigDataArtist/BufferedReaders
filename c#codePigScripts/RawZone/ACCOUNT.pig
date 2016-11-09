
SET mapreduce.output.basename 'cleanse-data';
incoming_data = LOAD '${INCOMING_DIR}' USING PigStorage('\u001C');
raw_stage_data = FOREACH incoming_data GENERATE
		$0 AS INDUSTRY_SEGMENT__C
		,$1 AS ID
		,$18 AS SHIPPINGCITY
		,$20 AS SHIPPINGPOSTALCODE
		,$21 AS SHIPPINGCOUNTRY
		,$88 AS ACCOUNT_PHONETICAL_NAME_CAPTURE_LATIN__C
		,$98 AS MDCP_ORGANIZATION_ID__C
		,$17 AS SHIPPINGSTREET
		,TBD AS SRC_SYS_KY;  // this is the hard coded value , will change according to the requirements.
STORE raw_stage_data INTO '${RAW_STAGE_DIR}' USING PigStorage('\u001C');