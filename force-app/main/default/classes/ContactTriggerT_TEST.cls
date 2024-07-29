@isTest
public class ContactTriggerT_TEST {
    @istest
    public static void ContactfirstlastNameMethod(){
        Account objacc=new Account (Name='krishna');
        
        insert objacc;
        date dob=date.parse('05/10/2000');
        Contact objcon= new Contact(FirstName='bunty',LastName='bubli',Birthdate=dob , AccountId=objacc.Id);
        insert objcon;
              String actualAccType =  [select Id, Name, Type, Rating ,Description from Account where Id=: objAcc.Id].Description;
      System.assertEquals('bunty bubli', actualAccType); 

    }
    
    

}