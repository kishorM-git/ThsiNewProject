trigger TriggerParentToChildPraTwo on Account (after update) {
 
  map<id,Account> accmap=new map<id,Account>();
    for(Account objacc:trigger.new){
        
        accmap.put(objacc.id,objacc);
        
        
        
    }
    list<Contact>conlist=new list<Contact>();
    if(!accmap.isEmpty()){
        
        
        for(Contact objcon:[select id ,LeadSource,AccountId,Name from Contact where AccountId  IN:accmap.keySet()]){
            
            conlist.add(objcon);
            
        }

        
        
        
    }
    if(!conlist.isEmpty()){
        for(Contact con:conlist){
            if(accmap.containsKey(con.AccountId)){
                if(accmap.get(con.AccountId).Type=='Prospect'){
                    
                    con.LeadSource='Web';
                    con.Level__c='Primary';
                }
                
            }
            
            
        }
        database.update(conlist,false);
        
        
    }
    
}