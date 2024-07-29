public with sharing class PanCardVerificationRequestAPI {
    public String  getPanCardInformationFromNSDL(String panCard) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:PanIndiaNamedCred/services/apexrest/v1/getPanCardDetails?PanCardNumber='+panCard);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug('Status Code = '+response.getStatusCode()); //OK 200
        if(response.getStatusCode() == 200){
            String receivedData;

            System.debug('Received = '+response.getBody());
            Map<String,Object> panMap = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());

            receivedData = 'First Name = '+panMap.get('First_Name__c')+', Last Name = '+panMap.get('Last_Name__c')+', Mobile Number = '+panMap.get('Mobile_Number__c')+', Pan Card Number = '+panMap.get('Pan_Card_Number__c')+', Created Date = '+panMap.get('CreatedDate');

            return receivedData;
            }
            else{
                return 'Record Not Found';
            }

    }
}