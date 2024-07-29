public with sharing class LwcLeadClass {
    @AuraEnabled(cacheable=true)
    public static list<Lead> leadData(){
        try {

            return [select id,Name,CreatedDate  from Lead order by CreatedDate  desc limit 5 ];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static Task taskcallLoad(lead leadrecord){
        try {
         Task datatask=new task();
         datatask.Subject='Lrad related task show';
         datatask.WhoId=leadrecord.id;
         datatask.Status='In Progress';
         insert datatask;
         return datatask;
         
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    public LwcLeadClass() {

    }
}