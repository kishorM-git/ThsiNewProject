trigger TriggerContact16march on Contact (before insert) {
    set<id>setadd=new set<id>();
    for(Contact objcon:trigger.new){
        if(string.isBlank(objcon.MailingCountry)){
            
setadd.add(objcon.AccountId);            
            
        }  
    }   
    map<id,Account>putmap=new map<id,Account>();
    if(!setadd.isempty()){
        
        for(Account objacc:[select id,Name ,BillingCountry from Account where Id IN:setadd]){            
            putmap.put(objacc.id,objacc);
        } 
    }
    if(!putmap.isempty()){
        for(Contact objcon:trigger.new){
            if(putmap.containskey(objcon.AccountId)){
                objcon.MailingCountry=putmap.get(objcon.AccountId).BillingCountry;
                
                
                
                
            }
            
            
            
            
        }
        
        
        
    }
    

}