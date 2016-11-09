
SET mapreduce.output.basename 'cleanse-data';
raw_stage_data = LOAD '${RAW_STAGE_DIR}' USING PigStorage('\u001C');
refined_stage_data = FOREACH raw_stage_data GENERATE
		($0 IS NULL ? '0' : $0)  AS ID
		,($1 IS NULL ? '0' : $1)  AS ISDELETED
		,($2 IS NULL ? '0' : $2)  AS CASENUMBER
		,($3 IS NULL ? '0' : $3)  AS CONTACTID
		,($4 IS NULL ? '0' : $4)  AS ACCOUNTID
		,($5 IS NULL ? '0' : $5)  AS ASSETID
		,($7 IS NULL ? '0' : $7)  AS ENTITLEMENTID
		,($18 IS NULL ? '0' : $18)  AS STATUS
		,($20 IS NULL ? '0' : $20)  AS ORIGIN
		,($23 IS NULL ? '0' : $23)  AS PRIORITY
		,($26 IS NULL ? '0' : $26)  AS CLOSEDDATE
		,($31 IS NULL ? '0' : $31)  AS OWNERID
		,($38 IS NULL ? '0' : $38)  AS CREATEDDATE
		,($70 IS NULL ? '0' : $70)  AS REGION__C
		,($73 IS NULL ? '0' : $73)  AS REQUESTOR__C
		,($74 IS NULL ? '0' : $74)  AS RESOLUTION_CATEGORY__C
		,($77 IS NULL ? '0' : $77)  AS STREET__C
		,($84 IS NULL ? '0' : $84)  AS COUNTRY__C
		,($119 IS NULL ? '0' : $119)  AS ACCOUNTNAME__C
		,($172 IS NULL ? '0' : $172)  AS LOCATION__C
		,($182 IS NULL ? '0' : $182)  AS RECORD_NAME__C
		,($217 IS NULL ? '0' : $217)  AS REQUESTOR_TIMEZONE__C
		,($242 IS NULL ? '0' : $242)  AS INDUSTRY_VERTICAL__C
		,($260 IS NULL ? '0' : $260)  AS PRODUCT_LINE__C
		,($274 IS NULL ? '0' : $274)  AS REQUESTOR_PHONE__C
		,($303 IS NULL ? '0' : $303)  AS ACCOUNT_SHIPPING_CITY__C
		,($307 IS NULL ? '0' : $307)  AS ACCOUNT_SHIPPING_ZIP_POSTAL_CODE__C
		,($327 IS NULL ? '0' : $327)  AS REPORT_REGION__C
		,($367 IS NULL ? '0' : $367)  AS CONTRACT_IDENTIFIER__C
		,($378 IS NULL ? '0' : $378)  AS SEVERITY__C
		,($380 IS NULL ? '0' : $380)  AS PRODUCT_NUMBER__C
		,($381 IS NULL ? '0' : $381)  AS ENTITLEMENT_SUMMARY__C
		,($391 IS NULL ? '0' : $391)  AS CAUSE__C
		,($394 IS NULL ? '0' : $394)  AS SERVICE_PORTFOLIO__C
		,($402 IS NULL ? '0' : $402)  AS DELAY_REASON__C
		,($419 IS NULL ? '0' : $419)  AS RESOLUTION_TYPE__C
		,($423 IS NULL ? '0' : $423)  AS ASSET_COUNTRY__C
		,($426 IS NULL ? '0' : $426)  AS COVERAGE__C
		,($427 IS NULL ? '0' : $427)  AS COVERAGE_RESPONSE__C
		,($431 IS NULL ? '0' : $431)  AS ASSET_SERIAL_NUMBER__C
		,($432 IS NULL ? '0' : $432)  AS CAUSE_PLAIN_TEXT__C
		,($434 IS NULL ? '0' : $434)  AS ENTITLEMENT_SLA_RESPONSE__C
		,($435 IS NULL ? '0' : $435)  AS GSD_ENVIRONMENT_PLAIN_TEXT__C
		,($445 IS NULL ? '0' : $445)  AS ISSUE__C
		,($447 IS NULL ? '0' : $447)  AS INSTALL_ISSUE__C
		,($449 IS NULL ? '0' : $449)  AS OUTAGE_DURATION_IN_HOURS__C
		,($451 IS NULL ? '0' : $451)  AS RESOLUTION_CODE__C
		,($453 IS NULL ? '0' : $453)  AS RESOLUTION_PLAIN_TEXT__C
		,($454 IS NULL ? '0' : $454)  AS RESOLUTION__C
		,($462 IS NULL ? '0' : $462)  AS PHONE__C
		,($475 IS NULL ? '0' : $475)  AS RESOLUTION_SUB_CODE__C
		,($494 IS NULL ? '0' : $494)  AS CUSTOMER_REFERENCE_ID__C
		,($505 IS NULL ? '0' : $505)  AS L3_OWNER__C
		,($506 IS NULL ? '0' : $506)  AS L3_GROUP__C
		,($514 IS NULL ? '0' : $514)  AS STREET_LINE_2__C
		,($516 IS NULL ? '0' : $516)  AS CONTACTFIRSTNAME__C
		,($517 IS NULL ? '0' : $517)  AS CONTACTLASTNAME__C
		,($530 IS NULL ? '0' : $530)  AS SERVICE_ADVISORY_NUMBER__C
		,($601 IS NULL ? '0' : $601)  AS ERROR_CODES__C
		,($602 IS NULL ? '0' : $602)  AS IS_ISSUE_INTERMITTENT__C
		,($633 IS NULL ? '0' : $633)  AS OPERATING_SYSTEM_VERSION__C
		,($634 IS NULL ? '0' : $634)  AS OPERATING_SYSTEM__C
		,($22 IS NULL ? '0' : $22)  AS SUBJECT
		,TBD AS SRC_SYS_KY;
STORE refined_stage_data INTO '${REFINED_STAGE_DIR}' USING PigStorage('\u001C');