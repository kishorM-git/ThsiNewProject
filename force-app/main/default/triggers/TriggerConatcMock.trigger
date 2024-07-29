trigger TriggerConatcMock on Contact (after insert) {
    
    map<id,contact>putmap=new map<id,contact>();
    for(contact objacc:trigger.new){
        if(objacc.AccountId!=null && string.isNotBlank(objacc.Phone)){
      putmap.put(objacc.AccountId,objacc);
        
        }
        
    }
    list<Account>addlist=new list<Account>();
    if(!putmap.isEmpty()){
        for(Account objacc:[select id,Phone from Account where id IN:putmap.keySet()]){
            objacc.Phone=putmap.get(objacc.id).Phone;
            addlist.add(objacc);
            
            
            
        }
        
        
    }
    if(!addlist.isEmpty()){
        database.update(addlist,false);
    }

}