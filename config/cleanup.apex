
Delete [select id from FinServ__Securities__c];
Delete [select id from FinServ__FinancialGoal__c];
Delete [select id from FinServ__IdentificationDocument__c];
Delete [select id from FinServ__Education__c];
Delete [select id from FinServ__FinancialHolding__c];
Delete [select id from FinServ__AssetsAndLiabilities__c];
	
Delete [select id from FinServ__Revenue__c];
Delete [select id from FinServ__FinancialAccountRole__c where FinServ__Active__c =false];
Delete [select id from FinServ__ChargesAndFees__c];
Delete [select id from FinServ__FinancialAccount__c];
Delete [select id from Case];
Delete [select id from Opportunity];


Delete [select id from Claim];
Delete [select id from InsurancePolicy];
Delete [select id from Lead];
Delete [select id from Account];
Delete [select id from Contact];


Delete [select id from FinServ__ContactContactRelation__c];
Delete [select id from FinServ__AccountAccountRelation__c];
Delete [select id from  FinServ__ReciprocalRole__c];