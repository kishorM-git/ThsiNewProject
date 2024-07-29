trigger ApplicantSenario2Trigger on applicant__c (before insert,before Update) {
  
  For(applicant__c Acc : trigger.new) 
    {
        if(trigger.isbefore && trigger.isinsert){
             String S6= Acc.first_name__c;
                
                if(Acc.gender__c=='male') {
                    
                    String S1= S6.removeStart('Ms.');
                   system.debug('name='+S1);
                    Acc.first_name__c = 'Mr.'+S1;
                    
                }
                
                if(Acc.gender__c=='female'){
                    
                    String S2= S6.removeStart('Mr.');
                    Acc.first_name__c = 'Ms.' + S2;  
                    
               
                }
        }
             
        if(Trigger.isupdate && trigger.isbefore){
            
            if (Acc.gender__c != trigger.oldMap.get(Acc.Id).gender__c)
            { 
                String S= Acc.first_name__c;
                
                if(Acc.gender__c=='male') {
                    
                    String S1= S.removeStart('Ms.');
                    Acc.first_name__c = 'Mr.' + S1;
                    
                }
                
                if(Acc.gender__c=='female'){
                    
                    String S2= S.removeStart('Mr.');
                    Acc.first_name__c = 'Ms.' + S2;  
                    
                }
                
            }
            
        }  
    }
}