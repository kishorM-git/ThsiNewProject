global class BatchApplicantPoliceUpdateT implements Database.Batchable<sObject> {
        global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('select id, gender__c, police_varification__c from applicant__c where gender__c=\'Male\' and police_varification__c =false ');
    }
    
    global void execute(Database.BatchableContext BC, List<applicant__c> appList){
        if(!appList.isEmpty()){
            for(applicant__c objApp : appList){
                if(String.isNotBlank(objApp.gender__c)){
                    objApp.police_varification__c = true;
                }
            }
            
            Database.update(appList, false);           
        
        }
    }
    
    global void finish(Database.BatchableContext BC){
       
    }
}