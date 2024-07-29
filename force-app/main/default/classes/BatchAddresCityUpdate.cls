global class BatchAddresCityUpdate implements Database.Batchable<sObject>{
    
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return  Database.getQueryLocator('select city__c,applicant__r.police_varification__c,applicant__r.gender__c from address__c where applicant__r.police_varification__c=true and city__c!=\'Pune\' and applicant__r.gender__c=\'male\'');
        
    }
    
    global void execute(Database.BatchableContext BC,list<address__c>addlist){
        if(!addlist.isempty()){
            for(address__c objadd:addlist){
             
                objadd.city__c='Pune';
                 
                
            }
            database.update(addlist,false);
        }
        
    }
    
    global  void finish(Database.BatchableContext BC){
        
    }

}