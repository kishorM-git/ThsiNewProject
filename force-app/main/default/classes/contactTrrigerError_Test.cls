@isTest
public with sharing class contactTrrigerError_Test {
    @isTest
    public static  void  contactFirstLastNameMethod(){
        //INSERT START
        Account objAcc = new Account(Name='Gabbar');
        INSERT objAcc;
        
        Date dob = Date.parse('05/10/2000');
        Contact objCon = new Contact(FirstName='Bunty', LastName='Modi', Birthdate=dob, AccountId=objAcc.Id);
        INSERT objCon;   //CODE COVERAGE
        
        //TALLY
        
        String actualAccDescription = [select Description from Account where ID=:objAcc.Id].Description;
        System.assertEquals('Bunty Modi', actualAccDescription);
        //INSERT END
    }
    
    @isTest
    public static  void  contactFirstLastNameMethodUPDATE(){
        //INSERT START
        Account objAcc = new Account(Name='Gabbar');
        INSERT objAcc;
        
        Date dob = Date.parse('05/10/2000');
        Contact objCon = new Contact(FirstName='Bunty', LastName='Modi', Birthdate=dob, AccountId=objAcc.Id);
        INSERT objCon;   //CODE COVERAGE
        //INSERT END
        
        //UPDATE START
        objCon.FirstName = 'Pinky';
        objCon.LastName = 'Modi';
        UPDATE objCon;
        //UPDATE 
        
        
        //TALLY
        
        String actualAccDescription = [select Description from Account where ID=:objAcc.Id].Description;
        System.assertEquals('Pinky Modi', actualAccDescription);
        
    }
    
    public static testMethod void testDeleteMethod(){
        try{
            Date dob = Date.parse('05/10/2000');
            Contact objCon = new Contact(FirstName='Bunty', LastName='Modi', Birthdate=dob, LeadSource='Web');
            INSERT objCon;  
            
            Database.delete([select Id from Contact where Id=:objCon.id]);
            
            
        }
        catch(Exception e){
            System.assert(e.getMessage().contains('Web Contact Can not be Deleted'));
        }
    }
    
    
    
    
}