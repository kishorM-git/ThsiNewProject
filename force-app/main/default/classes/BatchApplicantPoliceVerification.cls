global class BatchApplicantPoliceVerification implements Database.Batchable<sObject> {
      
    global Database.QueryLocator start(Database.BatchableContext BC){
    return Database.getQueryLocator('select id,Name,gender__c,police_varification__c from applicant__c where gender__c=\'male\' and police_varification__c=false');    
    }
    global void execute(Database.BatchableContext BC,list<applicant__c>applist){
        if(!applist.isEmpty()){
            for(applicant__c objapp:applist){
                if(string.isNotBlank(objapp.gender__c)){
                   objapp.police_varification__c=true;
                }
            }
            Database.update(applist,false);
        }
    }
    
    global void finish(Database.BatchableContext BC){
       
        
    }
        
    
}