trigger ApplicantaisehiTrigger on applicant__c (before insert,before update) {

    
    for(Applicant__c objApp : trigger.new){
        if(!String.isBlank(objApp.Gender__c) && !String.isBlank(objApp.First_Name__c)){
            if(objApp.Gender__c == 'Male' && !objApp.First_Name__c.startsWith('Mr.')){
                objApp.First_Name__c = 'Mr.'+objApp.First_Name__c;
            }
            else{
                if(objApp.Gender__c == 'Female' && !objApp.First_Name__c.startsWith('Ms.')){
                    objApp.First_Name__c = 'Ms.'+objApp.First_Name__c;
                }
                else{
                    if(objApp.Gender__c == 'Transgender'){
                    objApp.Gender__c.addError('Transgender is currently not allowed...!!!!');
                    }
                }
            }
        }
    }
}