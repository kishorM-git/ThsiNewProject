trigger TriggerAccount on Account (before insert,before update) {
set<string>addset=new set<string>();

for(Account objaaa:trigger.new){
addset.add(objaaa.Name);



}


map<String,Account> putmap=new map<string,Account>();
for(Account objaa:[select id,Name from Account where id IN:addset]){

putmap.put(objaa.Name,objaa);


}

for(Account objcc:trigger.new){
if(putmap.containsKey(objcc.Name)){

objcc.addError('dulicate name found');


}




}
}