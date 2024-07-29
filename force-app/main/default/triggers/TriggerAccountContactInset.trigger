trigger TriggerAccountContactInset on Account (after insert) {
    
    
    list<Contact>addlist=new list<Contact>();
for(Account objacc:trigger.new){

for(integer i=1;i<=10;i++){

Contact objcon= new contact();
objcon.Accountid=objacc.id;
objcon.firstName='kk2';
objcon.LastName='hh2';

addlist.add(objcon);


}

}

Database.insert(addlist,false);



}