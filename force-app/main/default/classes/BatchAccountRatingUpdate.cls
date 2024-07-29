global class BatchAccountRatingUpdate implements Database.Batchable<sobject>{
   
        
    global Database.QueryLocator start(Database.BatchableContext BC){
       string query='select id,Name,Rating,SLA__c from Account where SLA__c=\'Gold\'  and Rating!=\'Cold\'';
      return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList){//6
        if(!accList.isEmpty()){
            for(Account objAcc : accList){//6
               
                objAcc.Rating = 'Cold';
            
            }
            
            Database.update(accList, false);
        }
    }
    
    global void finish(Database.BatchableContext BC){
        
    }
}