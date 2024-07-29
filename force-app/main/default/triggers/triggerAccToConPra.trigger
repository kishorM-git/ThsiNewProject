trigger triggerAccToConPra on Account (after insert) {
    
    
    
    list<Contact>addlist=new list<contact>();
for(Account objacc:trigger.new){


Contact objcon=new contact();


objcon.AccountID=objacc.id;
 objcon.LastName=objacc.Name;   

addlist.add(objcon);





}
database.insert(addlist,false);

}