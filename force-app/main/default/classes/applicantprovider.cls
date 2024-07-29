public with Sharing class applicantprovider {
    @AuraEnabled
   public static List<applicant__c> sarchApplicantNameWise(applicant__c objapp){
    try {
       if(string.isNotEmpty(objapp.first_name__c)){
        return[select Name,first_name__c,last_name__c from applicant__c where first_name__c like:objapp.first_name__c+'%'];
       
    }
        else{
            return null;
        }
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }
 @AuraEnabled
 public static list<applicant__c> deleteSelectedApplicantRecords(List<id>appDlist,applicant__c objApp){
    try {
        database.delete([select id from applicant__c where id IN:appDlist],false);
         return[select Name,first_name__c,last_name__c from applicant__c where first_name__c like:objapp.first_name__c+'%'];
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
 }
 
}