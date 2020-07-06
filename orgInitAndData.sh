#!/bin/bash

#create scratch org
sfdx force:org:create -f config/project-scratch-def.json -a FSCADK2 --setdefaultusername -d 7

#pckg installs
sfdx force:package:install --package 04t1E000000cmtN -w 20 
#FSC Extn
#Has all fieldsets for Lightning pages like Financial Account tab on Account
sfdx force:package:install --package 04t1E000001Iql5 -w 20
#FSC Extn Commercial Banking* 
#Requires higher dashboard limit
#sfdx force:package:install --package 04t80000000lTrZ -w 20
#FSC Extn Retail Banking
#sfdx force:package:install --package 04t80000000lTp4 -w 20
#FSC Einstein Bots
#sfdx force:package:install --package 04t80000000lTqH -w 20
#FSC Lightning Flow Templates
#sfdx force:package:install --package 04t3i000000jP1g -w 20


sfdx force:source:push 

sfdx force:user:permset:assign -n FinancialServicesCloudStandard
#This permission set is for data load as some permissions are not assigned yet
#You can remove this after data load
sfdx force:user:permset:assign -n FSC_DataLoad_Custom


#SFDX DMU plugin: https://help.sfdmu.com/hc/en-us
#Data Extract from existing org; if needed
#sfdx sfdmu:run --sourceusername FSCTrialOrg --targetusername csvfile -p data/sfdmu/

#Cleanup an existing org
#Sometimes order of delete may need to be changed/updated
#sfdx force:apex:execute -f config/cleanup.apex

#sfdx force:data:soql:query -q "select id,Name,AccountId from Account" -u FSCTrialOrg

#data load
sfdx sfdmu:run --sourceusername csvfile --targetusername FSCADK2 -p data/sfdmu/ --noprompt
#Send user password reset email
sfdx force:apex:execute -f config/setup.apex




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
#Delete [select id from  FinServ__ReciprocalRole__c];
#Delete [select id from FinServ__AccountAccountRelation__c];
#Delete [select id from FinServ__ContactContactRelation__c];


#Delete [select id from Claim];
#Delete [select id from InsurancePolicy];
#Delete [select id from Lead];
#Delete [select id from Contact];
#Delete [select id from Account];
