trigger ApplicantTrigger on applicant__c (before insert) {
    for(applicant__c objapp:trigger.new){
        if(string.isNotEmpty(objapp.gender__c)){
            if(objapp.gender__c=='male'){
                
            objapp.first_name__c='mela';   
                
           }
            
            else{
        objapp.last_name__c='gva';
    }  
        }
    }
}