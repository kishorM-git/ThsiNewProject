//Upon Opportunity Creation if Amount is not null and is greater than 100000 then populate ‘Hot Opportunity’ in description field.


trigger TriggerSanjayGupta2 on Opportunity (before insert,before update) {
    for(Opportunity objopp:trigger.new){
        
        
        if(objopp.Amount<=1000000){
            objopp.description='Hot Opportunity';
            
            
            
            
        }        
        
        
        
    }
}