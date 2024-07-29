trigger AccountTrriderNew2 on Account (before insert,before update ) {
    for(Account objacc:trigger.new){
        if(string.isNotBlank(objacc.SLA__c)){
            if(objacc.SLA__c=='Gold'){
                objacc.Description='Oo lala';
                
            }
            else{
                if(objacc.SLA__c=='Silver'){
                    
                    objacc.Description='Yahoo';
                }
                else{
                    
                    objacc.Description='';
                }   
                  
                    
                    
                }  
            }      
        
            
        }
            
            
        
        
        
        
    }