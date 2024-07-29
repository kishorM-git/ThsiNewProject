trigger TriggerOpportuityAggregate on Opportunity (after insert,after update,after delete) {
    
    
    set<id>addset=new set<id>();
    if((trigger.isInsert || trigger.isupdate) && trigger.isAfter){
        for(Opportunity objopp:trigger.new){
            if(objopp.AccountId!=null){
                addset.add(objopp.Accountid); 
            }
        }
    }
    if(trigger.isDelete && trigger.isAfter){
        
        for(Opportunity obj :trigger.old){
            addset.add(obj.Accountid); 
        }
        
    }
    
    list<Account>accountsToUpdate=new list<Account>();
    for (AggregateResult result :[SELECT AccountId, SUM(Amount) totalAmount FROM Opportunity WHERE Accountid IN :addset GROUP BY AccountId]) {
        Account acc = new Account();
        acc.Id = (Id)result.get('AccountId');
        acc.Total_Amount__c = (Decimal)result.get('totalAmount');
        
        accountsToUpdate.add(acc);
    }
    
    
    
    database.update(accountsToUpdate,false);
}