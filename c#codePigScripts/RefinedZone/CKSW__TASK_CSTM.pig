
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($0 IS NULL ? '0' : $0)  AS ID
		,($2 IS NULL ? '0' : $2)  AS NAME
		,($10 IS NULL ? '0' : $10)  AS ACTION_TYPE__C
		,($32 IS NULL ? '0' : $32)  AS CKSW__ASSIGNED_RESOURCE__C
		,($58 IS NULL ? '0' : $58)  AS CLOSING_SUMMARY__C
		,($107 IS NULL ? '0' : $107)  AS EXTERNAL_TASK_IDENTIFIER__C
		,($121 IS NULL ? '0' : $121)  AS MANUAL_DISPATCH_FLAG__C
		,($143 IS NULL ? '0' : $143)  AS ONSITE_DATE__C
		,($156 IS NULL ? '0' : $156)  AS PRODUCT_NUMBER__C
		,($175 IS NULL ? '0' : $175)  AS CKSW__STATUS__C
		,($176 IS NULL ? '0' : $176)  AS SERIAL_NUMBER__C
		,($188 IS NULL ? '0' : $188)  AS CKSW__STATE__C
		,($192 IS NULL ? '0' : $192)  AS SYSTEM_DOWN_DURATION__C
		,($202 IS NULL ? '0' : $202)  AS CKSW__WORKORDER__C
		,($204 IS NULL ? '0' : $204)  AS CKSW__ZIP_POSTAL_CODE__C
		,($205 IS NULL ? '0' : $205)  AS DELAY_CODE__C
		,($218 IS NULL ? '0' : $218)  AS RESCHEDULE_REASON__C
		,($229 IS NULL ? '0' : $229)  AS CASE_NUMBER__C
		,($233 IS NULL ? '0' : $233)  AS DELAY_REQUEST_REASON__C
		,($258 IS NULL ? '0' : $258)  AS ASSIGNED_PARTNER__C
		,($309 IS NULL ? '0' : $309)  AS CUSTOMER_REQUESTED_START_TIME__C
		,($310 IS NULL ? '0' : $310)  AS CUSTOMER_REQUESTED_END_TIME__C
		,($193 IS NULL ? '0' : $193)  AS SYSTEM_FIX_TIME__C
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');