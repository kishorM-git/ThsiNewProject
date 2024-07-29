public  class Applicant_CX1 {
    public applicant__c objApp {get; set;}

    public Applicant_CX1(ApexPages.StandardController controller) {
        Id appId = ApexPages.currentPage().getParameters().get('Id');
        System.debug('Id is = '+appId);
        
        objApp   =  [select Id, first_name__c, last_name__c ,gender__c from applicant__c  where Id=: appId ];
        System.debug(objApp.Id+' '+objApp.First_Name__c);
    }

}