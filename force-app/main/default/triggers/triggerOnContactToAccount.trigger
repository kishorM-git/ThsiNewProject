trigger triggerOnContactToAccount on Contact (after insert) {
    list<Account>addlist=new list<Account>();
    
    for(Contact objcon:trigger.new){
        if(objcon.Phone!=null  && objcon.AccountId!=null){
            Account objacc=new Account(id=objcon.AccountId);
            objacc.Phone=objcon.Phone;
            addlist.add(objacc);            
        }
    }
    database.update(addlist,false);
    
    
    
    
}