public with sharing class SourceAccountToTriggerRequestAPI {
    @future(callout=true)
    public static void sendAccountRecordsToTarget(Set<Id> accIdSet){////A1, A2, A3{
        System.debug('#Trigger Records = '+accIdSet);  
        if(!accIdSet.isEmpty()){
            List<Account> accList = [select Id, Name, Type, sla__c from Account where Id IN : accIdSet];
            System.debug('Trigger Records = '+accList);   
            System.debug('Serialize = '+JSON.serialize(accList)); 
                        
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('callout:airlineNameCred/services/apexrest/getAccountDetailsTrrigger');    
            request.setMethod('POST');
                        
            //Set the Parameters
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');     
            request.setBody(JSON.serialize(accList));
            HttpResponse response = http.send(request);
   
            List<object> objList = (List<Object>) JSON.deserializeUntyped(response.getBody());
            for(object obj : objList){
                Map<String,Object> accMap = (Map<String,Object>) obj;
                
                System.debug('Id = '+accMap.get('Id'));
                System.debug('Name = '+accMap.get('Name'));
                System.debug('Type = '+accMap.get('Type'));
                System.debug('SLA = '+accMap.get('SLA__c'));                
            }
   
        }
}
}