trigger AccountTrigger on Account (before insert,before update) {
    for(Account objAcc:trigger.new){
        
        if(string.isNotEmpty(objAcc.Type)){
            if(objAcc.Type=='Prospect'){
                
                objAcc.SLA__c='Gold';
               }
            
            else{
            if(objAcc.Type=='Customer - Direct') {
                
               objAcc.SLA__c='Silver' ;
            }
                else {
                    
                     objAcc.SLA__c=''; 
                    
                }
        }
    }
    }
}