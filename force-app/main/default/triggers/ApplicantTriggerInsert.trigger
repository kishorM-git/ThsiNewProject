trigger ApplicantTriggerInsert on applicant__c (before insert) {
   
    for(applicant__c objacc:trigger.new){
        if(objacc.police_varification__c==true){
            if(string.isNotBlank(objacc.gender__c)){
            
            objacc.gender__c='male';
           
        }
     else
                
      objacc.gender__c.addError('gender not blank');
        
             
        
    }
        else
objacc.gender__c='';
}
}