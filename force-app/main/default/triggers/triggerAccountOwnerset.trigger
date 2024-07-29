trigger triggerAccountOwnerset on Account (before insert,before update) {
    set<id>addset=new set<id>();
    for(Account objacc:trigger.new){
        if(trigger.isBefore && trigger.isinsert){
  addset.add(objacc.OwnerId);      
        }
         if(trigger.isBefore && trigger.isUpdate){
             if(objacc.OwnerId!= trigger.oldMap.get(objacc.id).OwnerId){
                 addset.add(objacc.OwnerId);  
                 
             }
        
        
    }
    
    }
   
    map<id,User>putmap=new map<id,User>();
    for(user objac:[select id,Name from user where id IN:addset]){
        putmap.put(objac.id,objac);
        
    }
    
    for(Account objccc:trigger.new){
        if(putmap.containskey(objccc.OwnerId)){
            objccc.Description=putmap.get(objccc.OwnerId).Name;
            
            
        }
        
        
    }

}