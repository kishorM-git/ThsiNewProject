public with sharing class AddressProvider {

    
   @AuraEnabled
   public static List<address__c> serchAddresMethod (string applicantId){
    try {

        ID aaapid=[select id ,Name from applicant__c where Name =: applicantId].id;
        
        return  [select Name,state__c,city__c from address__c where applicant__c =:aaapid];
   
} catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }
}