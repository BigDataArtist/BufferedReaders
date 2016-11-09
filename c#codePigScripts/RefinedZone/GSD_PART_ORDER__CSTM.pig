
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($0 IS NULL ? '0' : $0)  AS ID
		,($1 IS NULL ? '0' : $1)  AS OWNERID
		,($14 IS NULL ? '0' : $14)  AS ADDRESS_TYPE_CODE__C
		,($16 IS NULL ? '0' : $16)  AS CITY__C
		,($17 IS NULL ? '0' : $17)  AS COMPANY_NAME__C
		,($18 IS NULL ? '0' : $18)  AS CONTACT_FIRST_NAME__C
		,($19 IS NULL ? '0' : $19)  AS CONTACT_LAST_NAME__C
		,($20 IS NULL ? '0' : $20)  AS CONTACT_PHONE__C
		,($21 IS NULL ? '0' : $21)  AS COUNTRY__C
		,($22 IS NULL ? '0' : $22)  AS DELIVERY_PRIORITY_CODE__C
		,($23 IS NULL ? '0' : $23)  AS ISO2_CHARACTER_COUNTRY_CODE__C
		,($25 IS NULL ? '0' : $25)  AS LEGACY_PART_ORDER_NUMBER__C
		,($28 IS NULL ? '0' : $28)  AS LOGISTIC_ORDER_IDENTIFIER__C
		,($31 IS NULL ? '0' : $31)  AS ORDER_REASON_CODE__C
		,($32 IS NULL ? '0' : $32)  AS ORDER_STATUS_CODE__C
		,($33 IS NULL ? '0' : $33)  AS ORDER_TYPE_CODE_IDENTIFIER__C
		,($34 IS NULL ? '0' : $34)  AS PART_DELIVERY_REQUESTED_TIMESTAMP__C
		,($35 IS NULL ? '0' : $35)  AS PART_ORDER_IDENTIFIER__C
		,($42 IS NULL ? '0' : $42)  AS REPAIR_TASK__C
		,($45 IS NULL ? '0' : $45)  AS SENT_INSTRUCTIONS__C
		,($48 IS NULL ? '0' : $48)  AS SHIPPING_CONDITION_CODE__C
		,($51 IS NULL ? '0' : $51)  AS STATE__C
		,($52 IS NULL ? '0' : $52)  AS STREET2__C
		,($53 IS NULL ? '0' : $53)  AS STREET__C
		,($62 IS NULL ? '0' : $62)  AS CASE_NUMBER__C
		,($55 IS NULL ? '0' : $55)  AS ZIP_POSTAL_CODE__C
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');