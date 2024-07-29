//Upon Account Creation if Industry is not null and having value as ‘Media’ then     populate Rating as Hot


trigger TriggerSanjayGupta1 on Account (before insert,before update) {
    
    for(Account obj:trigger.new){
        
        if(obj.Industry=='Media'){
            obj.Rating='Hot';
            
            
            
        }
        
        
    }
    
    
    
    

}