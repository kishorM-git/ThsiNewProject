global class BatchApplicantPolmark implements Database.Batchable<sObject> {
    
    global  Database.QueryLocator start( Database.BatchableContext BC){
        string query='select ID,gender__c,police_varification__c,special_Mark_on_Body__c from applicant__c where gender__c!=\'transgender\' ';
        return Database.getQueryLocator(query);
    }
    global void execute( Database.Batchablecontext BC, List<applicant__c> applist){
        if(!applist.isEmpty()){
            for(applicant__c objapp:applist){
                if(objapp.gender__c=='male'&& !objapp.police_varification__c){
                    objapp.police_varification__c=true;
                    objapp.special_Mark_on_Body__c='Yahoo';
                }
                else
                if(objapp.gender__c=='female'&& objapp.police_varification__c){
                    objapp.police_varification__c=false;
                    objapp.special_Mark_on_Body__c='Google';
                }
            }
                
            Database.update(applist,false);
        }
            
        
        
        
    }    
    
    global void finish( Database.Batchablecontext BC){
        
        
    } 

}