#Run this after running orgInit.sh if sample data is needed

#This permission set is for data load as some permissions are not assigned yet
#You can remove this after data load
sfdx force:user:permset:assign -n FSC_DataLoad_Custom


#SFDX DMU plugin: https://github.com/forcedotcom/SFDX-Data-Move-Utility/wiki
#Data Extract from existing org; if needed
#sfdx sfdmu:run --sourceusername FSCTrialOrg --targetusername csvfile -p data/sfdmu/

#Cleanup an existing org
#Sometimes order of delete may need to be changed/updated
#sfdx force:apex:execute -f config/cleanup.apex

#sfdx force:data:soql:query -q "select id,Name,AccountId from Account" -u FSCTrialOrg

#Cleanup before running import (if needeD)
#sfdx force:apex:execute -f config/cleanup.apex
#data load
sfdx sfdmu:run --sourceusername csvfile --targetusername FSCADK2 -p data/sfdmu/ --noprompt

sfdx force:org:open

#Delete [select id from FinServ__BillingStatement__c];
#Delete [select id from FinServ__Employment__c];
#Delete [select id from FinServ__AssetsAndLiabilities__c];
#Delete [select id from FinServ__Card__c];
#Delete [select id from FinServ__Alert__c];
#Delete [select id from FinServ__LifeEvent__c];
#Delete [select id from FinServ__Revenue__c];
#Delete [select id from FinServ__FinancialAccountTransaction__c];
#Delete [select id from FinServ__PolicyPaymentMethod__c];


#Delete [select id from FinServ__Securities__c];
#Delete [select id from FinServ__FinancialGoal__c];
#Delete [select id from FinServ__IdentificationDocument__c];
#Delete [select id from FinServ__Education__c];
#Delete [select id from FinServ__FinancialHolding__c];
#Delete [select id from FinServ__FinancialAccountRole__c where FinServ__Active__c =false];
#Delete [select id from FinServ__ChargesAndFees__c];
#Delete [select id from FinServ__FinancialAccount__c];
#Delete [select id from Case];
#Delete [select id from Opportunity];


#Delete [select id from Claim];
#Delete [select id from InsurancePolicy];
#Delete [select id from Lead];
#Delete [select id from Account];
#Delete [select id from Contact];
#Delete [select id from FinServ__AccountAccountRelation__c];
#Delete [select id from FinServ__ContactContactRelation__c];
#Delete [select id from  FinServ__ReciprocalRole__c];
