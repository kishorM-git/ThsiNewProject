trigger TriggerConactbck on Contact (after delete) {
    
    
set<id>addset=new set<id>();    
    for(Contact obj:trigger.old){
        addset.add(obj.AccountId);
        
       
    }
   list<Account>addlist=new list<Account>();
    for(Account objcon:[select id,Name from Account where id IN:addset]){
    addlist.add(objcon);

}
    database.delete(addlist,false);
}