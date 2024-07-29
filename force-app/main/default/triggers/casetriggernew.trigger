trigger casetriggernew on Case (before insert,before update) {
    for(Case objca:trigger.new){
        if(objca.Priority=='High'){
            objca.SLAViolation__c='yes';
            
        }
        else{
            objca.SLAViolation__c='';
        }
    }
        
    

}