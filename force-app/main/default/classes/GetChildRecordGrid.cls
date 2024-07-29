public with sharing class GetChildRecordGrid {
@AuraEnabled
public static list<Account> gridMethod(){
    try {


        list<Account>acclist= [select id,Name,(select id,FirstName,LastName from Contacts) from Account limit 3];

        if(!acclist.IsEmpty()){

return acclist;



        }
        return null;
        
    } 
    
    catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}




}