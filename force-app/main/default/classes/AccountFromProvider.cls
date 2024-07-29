public with sharing class AccountFromProvider {

  @AuraEnabled
  public static list<Account>  createNewAccountde( Account accountObj){
    try {
return [select id,Name ,Owner.Name from Account where Name =:accountObj.Name];
     
      
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
@AuraEnabled
public static void newAccountMethode(string accounNamel){
  try {
Account objaa=new Account(Name=accounNamel);
insert objaa;
   
    
  } catch (Exception e) {
    throw new AuraHandledException(e.getMessage());
   
  }
}


    @AuraEnabled
    public static  String createNewAccount(Account objacc) {


  if(objacc!=null){
        insert objacc;
      return'New account has been created';
    }
      else{
        return'New account has been wrong';


      }

    }
    @AuraEnabled
    public static Account searchAcountRecord(Account objacc){
      try {
        if(objacc!=null){
         return   [select id,Name,Type,SLA__c,CreatedDate from Account where Name=:objacc.Name];

        }
        else{
          return null;
        }
        
      } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
      }
    }

@AuraEnabled
public static String createNewAccountPractice(Account accountinsert){
  try {
    
    insert accountinsert;
   return'good';
  } catch (Exception e) {
   
    throw new AuraHandledException(e.getMessage());
    
  }
}
@AuraEnabled
public static Account cretateAccountRecord(Account Accountd){
  try {

  
   Account bjlist=[select ID ,Name from Account where Name =:Accountd.Name];
    return bjlist;
    
  } catch (Exception e) {
    throw new AuraHandledException(e.getMessage());
  }
}
    
    
  }