
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($0 IS NULL ? '0' : $0)  AS INDUSTRY_SEGMENT__C
		,($1 IS NULL ? '0' : $1)  AS ID
		,($18 IS NULL ? '0' : $18)  AS SHIPPINGCITY
		,($20 IS NULL ? '0' : $20)  AS SHIPPINGPOSTALCODE
		,($21 IS NULL ? '0' : $21)  AS SHIPPINGCOUNTRY
		,($88 IS NULL ? '0' : $88)  AS ACCOUNT_PHONETICAL_NAME_CAPTURE_LATIN__C
		,($98 IS NULL ? '0' : $98)  AS MDCP_ORGANIZATION_ID__C
		,($17 IS NULL ? '0' : $17)  AS SHIPPINGSTREET
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');