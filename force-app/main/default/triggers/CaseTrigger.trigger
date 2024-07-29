trigger CaseTrigger on Case (before insert,before update) {
    for(Case objcas:trigger.new){
        if(string.isNotBlank(objcas.Status)){
            if(objcas.Status=='New'&& objcas.Origin=='Phone')  {
                
                objcas.Product__c='GC1020';
                
            }
            else{
                if(objcas.Status=='Working'&& objcas.Origin=='Web'){
                    
                    objcas.Product__c='GC1060';
                    
                }
                else{
                    if(objcas.Status=='Escalated'&&objcas.Origin=='Email') {
                        
                        objcas.addError('This case can not be escalated trigger');
                    } 
                    
                } 
            }   
            
        }
        
        
    }

}