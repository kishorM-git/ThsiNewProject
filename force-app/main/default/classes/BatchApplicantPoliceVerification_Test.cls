@isTest
public class BatchApplicantPoliceVerification_Test {
    @testsetup
    public static void testSetupMethod(){
       list<applicant__c> applist=new list<applicant__c>();
        for(integer i=1; i<=200;i++){
            applicant__c objacc=new applicant__c(first_name__c='kishor +i',last_name__c='bhai +i',mobile_no__c='1111111111',gender__c='male');

         applist.add(objacc);
            
            
            
        }
         if(!applist.isEmpty())
        		Database.insert(applist,false);

     
    }

    @isTest
    public static void testBatchApplicantPoliceUpdatec(){  
        test.startTest();
        Database.executeBatch(new BatchApplicantPoliceUpdateT(),200);
        test.stopTest();
        List<applicant__c> actualAppList =  [select id, gender__c, police_varification__c from applicant__c where police_varification__c=true]; //200
         System.assertEquals(200, actualAppList.size());

        
       
      
    }
}