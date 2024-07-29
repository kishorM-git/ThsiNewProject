public with sharing class AccountTable {
    @AuraEnabled
    public static list<Account> accountDetail(Account objacc){
        try {
            if(objacc!=null){

         return   [select id,Name,Type,SLA__c,CreatedDate,Rating from Account where Type=:objacc.Type and SLA__c=:objacc.SLA__c];
            }
            else{

                return null;
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}