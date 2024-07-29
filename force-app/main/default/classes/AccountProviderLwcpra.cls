public with sharing class AccountProviderLwcpra {
    @AuraEnabled
    public static list<Account> serverMethod(Date  toDateField , Date fromDateField ){
        try {



            return [select Id,Name,CreatedDate from Account  where (CreatedDate>=:fromDateField and CreatedDate<=:toDateField)];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}