public with sharing class AccountClassLwc {
    @AuraEnabled
    public static list<Account> methodName(Account accname){
        try {
            list<Account>acclist=[select id,Name from Account where Name =: accname.Name];
            return acclist;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    public AccountClassLwc() {

    }
}