trigger triggerAccountupdatefiels on Account (after insert) {
    set<id>addset=new set<id>();
    list<Contact>addlist=new list<Contact>();
    for(Account objacc:trigger.new){
       
        Contact objcon= new Contact();
        objcon.FirstName=objacc.Name;
        objcon.LastName='ll1';
        objcon.AccountId=objacc.id;
        addlist.add(objcon);  
        addset.add(objacc.id);
    }
    database.insert(addlist,false);
    list<Contact>addlists=new list<Contact>();
 map<id,Account>putmap=new map<id,Account>();
    for(Account ob:[select id,ParentId,Name,Contact_of_Lookup__c,(select id,FirstName,LastName,Accountid from Contacts) from Account where id IN: addset]){
    addlists.add(ob.Contacts);
        putmap.put(ob.id,ob);
        
        
        
    }
    
    for(Contact obj:addlists){
        if(putmap.containsKey(obj.AccountId)){
            putmap.get(obj.AccountId).Contact_of_Lookup__c=obj.id;
            
        }
         
      
        
    }
     database.update(putmap.values(),false);
   

}