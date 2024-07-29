public with sharing class ApexClassProvider {

     
    @AuraEnabled(cacheable=true)
    public static list<Account> myClass() {
//return [select id,Name,CreatedDate,Owner.Name  from Account limit 10];
return [SELECT Id, Name, accountcheckbox__c, CreatedDate,Owner.Name,OwnerId FROM Account limit 10];

    }
}