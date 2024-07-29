public with sharing class DataTableStyleClass {
    @AuraEnabled(cacheable=true)

    public static list<Account> dataMethod(){

return [select id,Name,Phone,AnnualRevenue,Industry from Account limit 10 ];


    }
}