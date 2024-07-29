trigger TriggerParentToChildPra on Account (before update) {
    
    map<id,Account>accmap=new map<id,Account>();
    for(Account objacc:trigger.new){
        
        accmap.put(objacc.Id,objacc);
        
        
    }
    list<Opportunity>opplist=new list<Opportunity>();
    if(!accmap.isEmpty()){
    for(Opportunity objcon:[select id,Name,Amount,AccountId from Opportunity where AccountId IN:accmap.keySet()]){
opplist.add(objcon);
    }
   
    }
    if(!opplist.isEmpty()){
        for(Opportunity oppobj:opplist)  {
            if(accmap.containsKey(oppobj.AccountId)){
                if(accmap.get(oppobj.AccountId).Type=='Prospect'&& oppobj.Amount <10000){
                    if(string.isBlank(accmap.get(oppobj.AccountId).Description)){
                    accmap.get(oppobj.AccountId).Description=oppobj.Name;
                    }     
                    accmap.get(oppobj.AccountId).Description= accmap.get(oppobj.AccountId).Description+'\n'+oppobj.Name;
                }
                
                
            }
            
            
        } 
        
    }
    
}