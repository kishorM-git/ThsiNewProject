trigger triggerAccount_c on Account (before insert,before update) {

    for(Account objAcc:trigger.new){
    if(string.isNotBlank(objAcc.Type)){
    if(objacc.Type=='Prospect'){

    objacc.SLA__c='Gold';
        
    }
    else{
    if(objacc.Type=='Customer - Direct'){
    objacc.SLA__c='Silver';
    }
    
        else{
    objacc.SLA__c='';
        }
    }
    }
    }
    }