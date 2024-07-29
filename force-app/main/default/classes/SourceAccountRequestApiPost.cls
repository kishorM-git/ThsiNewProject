public with sharing class SourceAccountRequestApiPost {
public static void createPanIndiaAccount(){
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('callout:airlineNameCred/services/apexrest/getAccountDetailsss');
    request.setMethod('POST');
            //Set the Parameters
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');     
            request.setBody('{"Name":"Pan Wala Babu" , "Type" : "Prospect" , "Rating" : "Cold" , "SLA" : "Gold"}');
    
            HttpResponse response = http.send(request);
            System.debug('Status Code = '+response.getStatusCode()); //OK 200
            if(response.getStatusCode() == 200){
                Map<String, Object> accMap = (Map<String,Object>) 
                JSON.deserializeUntyped(response.getBody());//Single Object Record
            
            System.debug('ID = '+accMap.get('Id')); 
            System.debug('NAME = '+accMap.get('Name'));  
            System.debug('TYPE = '+accMap.get('Type'));  
            System.debug('RATING = '+accMap.get('Rating'));  
            System.debug('SLA = '+accMap.get('SLA__c')); 
        
            }
    }

}