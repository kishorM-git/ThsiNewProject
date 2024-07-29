trigger applicantriggernew1 on applicant__c (before insert,before update) {
    for(applicant__c objapp:trigger.new){
     if(string.isNotEmpty(objapp.first_name__c)) {
         if(objapp.gender__c=='male'){
             if(objapp.first_name__c.contains('.')){
                 
                 objapp.first_name__c=objapp.first_name__c.substringAfter('.');
                 objapp.first_name__c='Mr.'+objapp.first_name__c;
             }
             else
                 objapp.first_name__c='Mr.'+objapp.first_name__c;
             } 
             else if(objapp.gender__c=='female') {
                     if(objapp.first_name__c.contains('.')) {
                       objapp.first_name__c=objapp.first_name__c.substringAfter('.');  
                         objapp.first_name__c='Ms.'+objapp.first_name__c;
                         
                     }
                     else
                         objapp.first_name__c='Ms.'+objapp.first_name__c;
                     } 
         else if(objapp.gender__c=='transgender'){
             if(objapp.first_name__c.contains('.')) {
                 objapp.first_name__c=objapp.first_name__c.substringAfter('.');
                 objapp.addError('transgender not aalowed');
             }
            
             
         }
           else
                objapp.addError('not blank first name');
           
                 }
                 
             }
         }