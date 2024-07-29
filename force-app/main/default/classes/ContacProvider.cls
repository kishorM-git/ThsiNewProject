public with sharing class ContacProvider {

    @AuraEnabled(cacheable=true)
    public static List<Account>  getAccountRecords11(){
        try {
            return[Select Id, Name from Account ];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static list<Contact> serverMethod(String accountI){
        try {

            return [select id,FirstName,LastName,Phone,Email,AccountId  from Contact where AccountId =:accountI];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}