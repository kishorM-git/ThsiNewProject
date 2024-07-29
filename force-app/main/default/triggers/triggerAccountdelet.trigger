trigger triggerAccountdelet on Account (after delete) {
    map<id,Account>putmap=new map<id,Account>();
for(Account objacc:trigger.old){
putmap.put(objacc.id,objacc);
}



list<Contact>addlist=new list<Contact>();
for(Contact objcon:[select id,Name ,AccountID from Contact where AccountID IN:putmap.keyset()]){

addlist.add(objcon);
}


Database.Delete(addlist,false);

}