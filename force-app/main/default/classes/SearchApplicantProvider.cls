public with sharing class SearchApplicantProvider {
    @AuraEnabled
    public static applicant__c SearchApplicantProvider(applicant__c objapp){
        try {
            return [select id,first_name__c,last_name__c,gender__c from applicant__c where Name=:objapp.Name];   
              
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   
   
}