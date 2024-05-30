{% snapshot T_BILL_PRVDR_DIM_HST %}  

{{    
  config(      
    target_schema='snapshots',      
    strategy='check',      
    unique_key='PRVDR_ID',      
    check_cols='all',      
    invalidate_hard_deletes=True    
  )  
}}  

SELECT SQ_EXP_LKP.* FROM 						
						
(						
            SELECT 						
                    123 AS BILL_PRVDR_PK					
        			,LKP_ETL_CTRL_BTCH_RUN.DATA_DT AS DATA_DT 			
        			,SQ_EXP.SRC_CD AS SRC_CD			
        			,LKP_ETL_CTRL_BTCH_RUN.ETL_CTRL_BTCH_RUN_ID AS RUN_ID 			
        			,LKP_ETL_CTRL_BTCH_RUN.ETL_CTRL_BTCH_RUN_ID AS SRC_FILE_ID 			
        			,'I' AS RCD_TYP, --goes to update flow			
        			LKP_ETL_CTRL_BTCH_RUN.DATA_DT AS ROW_EFF_DT,		
        			'05/22/2024' AS ROW_XPTN_DT,
        			'A' AS RCD_ACTN_TYP,	
        			'C' AS ROW_STAT			
                    ,SQ_EXP.PVDIDNO						
					,SQ_EXP.PVDMID	
					,SQ_EXP.PVDSOURCE	
					,SQ_EXP.PVDTIN	
					,SQ_EXP.PVDLICNO	
					,SQ_EXP.PVDCERTNO	
					,SQ_EXP.PVDLASTNAME	
					,SQ_EXP.PVDFIRSTNAME	
					,SQ_EXP.PVDMI	
					,SQ_EXP.PVDTITLE	
					,SQ_EXP.PVDGROUP	
					,SQ_EXP.PVDADDR1	
					,SQ_EXP.PVDADDR2	
					,SQ_EXP.PVDCITY	
					,SQ_EXP.PVDSTATE	
					,SQ_EXP.PVDZIP	
					,SQ_EXP.PVDZIPPERF	
					,SQ_EXP.PVDPHONE	
					,SQ_EXP.PVDFAX	
					,SQ_EXP.PVDSPC_LIST	
					,SQ_EXP.PVDAUTHNO	
					,SQ_EXP.PVDSPC_ACD	
					,SQ_EXP.PVDUPDATECOUNTER	
					,SQ_EXP.PVDPPO_PROVIDER	
					,SQ_EXP.PVDFLAGS	
					,SQ_EXP.PVDERRATE	
					,SQ_EXP.PVDSUBNET	
					,SQ_EXP.INUSE	
					,SQ_EXP.PVDSTATUS	
					,SQ_EXP.PVDELECTROSTARTDATE	
					,SQ_EXP.PVDELECTROENDDATE	
					,SQ_EXP.PVDACCREDSTARTDATE	
					,SQ_EXP.PVDACCREDENDDATE	
					,SQ_EXP.PVDREHABSTARTDATE	
					,SQ_EXP.PVDREHABENDDATE	
					,SQ_EXP.PVDTRAUMASTARTDATE	
					,SQ_EXP.PVDTRAUMAENDDATE	
					,SQ_EXP.OPCERT	
					,SQ_EXP.PVDDENTALSTARTDATE	
					,SQ_EXP.PVDDENTALENDDATE	
					,SQ_EXP.PVDNPINO	
					,SQ_EXP.PVDCMSID	
					,SQ_EXP.CREATEDATE	
					,SQ_EXP.LASTCHANGEDON	
            FROM						
				(		
                    SELECT 						
					 'MITCHELL' AS SRC_CD	
					,'CO_CD'AS CO_CD	
					,PVDIDNO /*PRVDR_ID from source file*/	
					,PVDMID	
					,PVDSOURCE	
					,PVDTIN	
					,PVDLICNO	
					,PVDCERTNO	
					,PVDLASTNAME	
					,PVDFIRSTNAME	
					,PVDMI	
					,PVDTITLE	
					,PVDGROUP	
					,PVDADDR1	
					,PVDADDR2	
					,PVDCITY	
					,PVDSTATE	
					,PVDZIP	
					,PVDZIPPERF	
					,PVDPHONE	
					,PVDFAX	
					,PVDSPC_LIST	
					,PVDAUTHNO	
					,PVDSPC_ACD	
					,PVDUPDATECOUNTER	
					,PVDPPO_PROVIDER	
					,PVDFLAGS	
					,PVDERRATE	
					,PVDSUBNET	
					,INUSE	
					,PVDSTATUS	
					,PVDELECTROSTARTDATE	
					,PVDELECTROENDDATE	
					,PVDACCREDSTARTDATE	
					,PVDACCREDENDDATE	
					,PVDREHABSTARTDATE	
					,PVDREHABENDDATE	
					,PVDTRAUMASTARTDATE	
					,PVDTRAUMAENDDATE	
					,OPCERT	
					,PVDDENTALSTARTDATE	
					,PVDDENTALENDDATE	
					,PVDNPINO	
					,PVDCMSID	
					,CREATEDATE	
					,LASTCHANGEDON	
					FROM 	
						PRA_POC_DBT.INFA.S_BILLROVIDER BP
                        --LEFT JOIN PARAMETER_TABLE PT WHERE 1=1						
				) SQ_EXP		
						
			LEFT JOIN			
				(		
					SELECT	
					SRC_CD	
					,ETL_CTRL_BTCH_RUN_ID	
					,DATA_DT	
					FROM	
					INFA.T_ETL_CTRL_BTCH_RUN	
					--where SRC_CD = '$$SRC_CD' AND BTCH_STAT='$$START_STAT'	
				) LKP_ETL_CTRL_BTCH_RUN		
			ON LKP_ETL_CTRL_BTCH_RUN.SRC_CD = SQ_EXP.SRC_CD			
    ) SQ_EXP_LKP						
						
LEFT JOIN						
	(					
			SELECT			
			--NAME?			
			BILL_PRVDR_PK --maps to next val			
            ,PRVDR_ID						
			FROM			
			PRA_POC_DBT.INFA.T_BILL_PRVDR_DIM_HST			
		   WHERE SRC_CD = 'MITCHELL'				
						
    )LKP_BILL_PRVDR_DIM_HST						
ON LKP_BILL_PRVDR_DIM_HST.PRVDR_ID = SQ_EXP_LKP.PVDIDNO

{% endsnapshot %}
