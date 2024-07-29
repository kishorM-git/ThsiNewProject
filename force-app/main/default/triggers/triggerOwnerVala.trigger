trigger triggerOwnerVala on Account (after update) {
 map<id,Account>addlist=new map<id,Account>();  
    for(Account obj:trigger.new){
        
        if(obj.OwnerId != trigger.oldmap.get(obj.id).OwnerId){
            addlist.put(obj.id,obj);
        } 
        }
        
        list<Contact>addslist=new list<Contact>();
        for(Contact objc:[select id,AccountId,OwnerId from Contact where AccountId IN:addlist.keyset()]){
            addslist.add(objc);
            
        }
        
    for(Contact objcc:addslist){
        if(addlist.containsKey(objcc.AccountId)){
            objcc.OwnerId=addlist.get(objcc.AccountId).OwnerId;
            
            
        }
        
        
        
        
    }
database.update(addslist,false);
}