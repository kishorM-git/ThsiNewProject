global class BatchAddressToApplicant implements Database.Batchable<sobject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC){
     return Database.getQueryLocator('select id,Name,city__c,pin_code__c,applicant__r.id,applicant__r.ListOfAddresses__c,applicant__r.police_varification__c,applicant__r.Name from address__c where city__c=\'Nagpur\' and pin_code__c like\'44%\' and applicant__r.police_varification__c=true');   
    }
    global void execute(Database.BatchableContext BC,list<address__c>addlist){
        set<id>appsetid=new set<id>();
        for(address__c objadd:addlist){
            if(objadd.applicant__c!=null){
              appsetid.add(objadd.applicant__c);  
            }
        }
        
        map<id,applicant__c> appmap=new map<id,applicant__c>();
        if(!appsetid.isEmpty()){
            for(applicant__c objapp:[select id,Name,ListOfAddresses__c,police_varification__c from applicant__c where id IN:appsetid]){
               appmap.put(objapp.id,objapp); 
            }
            if(!appmap.isEmpty()){
                for(address__c objadd:addlist){
                    if(appmap.containskey(objadd.applicant__c)){
                        
                        
                    }
                }
            }
        }
        
    }
    global void finish(Database.BatchableContext BC){
        
    }
}