trigger Triggeraaaaaa on Account (before insert) {
    
    set<string>addset=new set<string>();

for(Account obj:trigger.new){

addset.add(obj.Name);




}
map<string,Account>putmap=new map<string,Account>();
if(!addset.isempty()){
for(Account objc:[select id,Name from Account where Name IN:addset]){
putmap.put(objc.Name,objc);

}

}

if(!putmap.isempty()){

for(Account objccc:trigger.new){
if(putmap.containskey(objccc.Name)){

objccc.addError('Duplicate Account name  Found');



}




}



}

}