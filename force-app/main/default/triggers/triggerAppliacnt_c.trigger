trigger triggerAppliacnt_c on applicant__c (before insert,before update) {
        for(applicant__c objacc:trigger.new){
        if(string.isNotBlank(objacc.gender__c)){
         if(objacc.gender__c=='male'){
         
         objacc.special_Mark_on_Body__c='olala';
         
         }
        else{
        objacc.special_Mark_on_Body__c='yahoo';
        }
        }
        }
        }