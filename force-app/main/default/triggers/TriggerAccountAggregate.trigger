trigger TriggerAccountAggregate on Account (before update) {
    map<id,Account>putmap=new map<id,Account>();
    for(Account objacc:trigger.new){
        
        putmap.put(objacc.id,objacc);
        
        
    }
    
    
    list<AggregateResult>adrlist=new list<Aggregateresult>();
    
        
        for(AggregateResult objAgr:[select sum(Amount) sumAmt,AccountId from Opportunity where AccountId IN:putmap.keySet() group by AccountID]){
            
adrlist.add(objAgr);
            
      
    }
    
 
        for(Opportunity objjjj:[select id,AccountID,Amount from Opportunity where AccountID IN:putmap.keySet()]){
            if(putmap.containsKey(objjjj.AccountId)){
                putmap.get(objjjj.AccountId).Total_Amount__c=integer.valueOf(adrlist[0].get('sumAmt'));
                
                
            
            
            
        }
        
        
        
    }

}