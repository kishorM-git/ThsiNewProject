trigger TrigerCasePractice on Case (after insert) {
    set<id>addset=new set<id>();
    for(Case objcc:trigger.new){
        
      addset.add(objcc.AccountId) ; 
        
        
        }
    
    map<id,Case>latestCases=new map<id,Case>();
    for (AggregateResult result : [SELECT AccountId, MAX(EngineeringReqNumber__c) maxCaseNumber FROM Case WHERE AccountId IN :addset GROUP BY AccountId]) {
        Id accountId = (Id)result.get('AccountId');
        String maxCaseNumber = (String)result.get('maxCaseNumber');
        Case latestCase = new Case(AccountId = accountId, EngineeringReqNumber__c = maxCaseNumber);
        latestCases.put(accountId, latestCase);
    }
     List<Account> accountsToUpdate = new List<Account>();
    for (Account account : [SELECT Id, Contact_Number__c FROM Account WHERE Id IN :addset]) {
        Case latestCase = latestCases.get(account.Id);
        if (latestCase != null) {
            account.Contact_Number__c = latestCase.EngineeringReqNumber__c;
            accountsToUpdate.add(account);
        }
    
   
}
    if (!accountsToUpdate.isEmpty()) {
      database.update( accountsToUpdate,false);
    }
}