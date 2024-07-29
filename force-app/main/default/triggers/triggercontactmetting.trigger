trigger triggercontactmetting on Contact (before insert,before update) {
    set<id>addset=new set<id>();
for(Contact obj:trigger.new){

if(obj.AccountID!=null){
addset.add(obj.AccountID);


}
map<id,Account>putmap=new map<id,Account>();
if(!addset.isempty()){
for(Account objacc:[select id,Name,Phone from Account where id IN:addset]){
putmap.put(objacc.id,objacc);

}



}

if(!putmap.isEmpty()){
for(contact objccc:trigger.new){
if(putmap.containskey(objccc.AccountID)){

objccc.MobilePhone=putmap.get(objccc.AccountID).Phone;

}

}

}

}



}