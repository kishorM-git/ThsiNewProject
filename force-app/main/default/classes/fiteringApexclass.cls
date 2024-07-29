public with sharing class fiteringApexclass {
   @auraEnabled(cacheable=true)
   public static list<Contact> filterMethod(){
    try {

        return [SELECT Id,Name,Title,Email from Contact];
        
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }
}