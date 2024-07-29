trigger TriggerAccUPthDe on Account (after update,after delete) {
    map<id,Account>putmap=new map<id,Account>();
set<id>addset=new set<id>();

if(trigger.isUpdate && trigger.IsAfter){

for(Account objacc:trigger.new){
putmap.put(objacc.id,objacc);

}

}
else{

if(trigger.isDelete && trigger.isAfter){

for(Account objacca:trigger.old){

putmap.put(objacca.id,objacca);
}
}
}
list<Contact>addlist=new list<Contact>();

for(Contact objcon:[select id,Accountid from Contact where Accountid IN:putmap.keySet()]){
addlist.add(objcon);
}

if(trigger.isUpdate && trigger.isAfter){

for(Contact objcc:addlist){

if(putmap.Containskey(objcc.AccountID)){
objcc.Phone=putmap.get(objcc.AccountID).Phone;
}
}
Database.update(addlist,false);
}
    list<Contact>addlistl=new list<contact>();

if(trigger.isDelete && trigger.isAfter){
for(Contact objcondd:addlist){
if(putmap.containskey(objcondd.AccountID)){
addlistl.add(objcondd);
}
}
}

database.delete(addlistl,false);

}