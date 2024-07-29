trigger TriggerAccountDeleteAccount on Account (before insert) {
    
    set<String>addset=new set<string>();
for(Account objacc:trigger.new){

addset.add(objacc.Name);


}
map<string,Account>putmap=new map<string,Account>();
if(!addset.isEmpty()){

for(Account objData:[select id,Name,(select id,Name,AccountID,FirstName from Contacts) from Account  where Name IN:addset]){
putmap.put(objData.Name,objData);


}


}
database.delete(putmap.Values(),false);

}