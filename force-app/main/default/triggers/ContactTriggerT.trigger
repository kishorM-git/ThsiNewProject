trigger ContactTriggerT on Contact (after insert,after update) {
    
    set<id>conset=new set<id>();
    for(Contact objcon:trigger.new){
     conset.add(objcon.AccountId);        
        
    }
    map<id,Account>accmap=new map<id,Account>();
    for(Account objacc: [select id, Description,Name from Account where id=:conset]){
        accmap.put(objacc.id,objacc);
        
    }
    for(Contact objcon:Trigger.new){
        if(accmap.containsKey(objcon.AccountId))  {
            
accmap.get(objcon.AccountId).Description=objcon.FirstName+' '+objcon.LastName;          
        }      
    }
    if(!accmap.isEmpty()){
        database.update(accmap.values(),false);
    }
}