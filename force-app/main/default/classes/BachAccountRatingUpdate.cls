global class BachAccountRatingUpdate implements Database.Batchable<sObject> {
     
    global Database.QueryLocator start(Database.BatchableContext BC) {
     return Database.getQueryLocator('select id,Name,Type,Rating from Account where Rating =\'Hot\' and Type!=\'Prospect\'');   
    }
    
    global void execute(Database.BatchableContext BC,list<Account>acclist){
        if(!acclist.isEmpty()){
            for(Account objacc:acclist){
               objacc.Type='Prospect' ;
            }
            Database.update(acclist,false);
            
        }
            
        
        
    }
    global void finish(Database.BatchableContext BC){
        
    }
    

}