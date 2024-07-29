trigger PaassportPreventStatus on passport__c (before insert, before update) {
    
    
    
    for(passport__c objpass:trigger.new){
        if(objpass!=null){
            if(objpass.status__c=='hold'){
                
               objpass.addError('status is not hold');
            }
            
            
        }
        
        
    }

}