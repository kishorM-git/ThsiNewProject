trigger TriggerAccountListCreateContact on Account (after  insert) {
    
    list<Contact>addlist=new list<Contact>();
    for(Account objaa:trigger.new)  {
        
        for(integer i=0;i<objaa.Count_of_contact__c;i++){
            Contact obj=new Contact();
            obj.AccountId=objaa.id;
            obj.LastName='kk2';
            
            addlist.add(obj);
        }
        
        
        
        
    }  
    
database.insert(addlist,false);
}