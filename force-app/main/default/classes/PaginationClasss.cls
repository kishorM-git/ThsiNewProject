public with sharing class PaginationClasss {

    @AuraEnabled(cacheable=true)
    public static list<Contact> getConactList(){
        try {

           return [select id,Name from Contact  limit 20];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   
}