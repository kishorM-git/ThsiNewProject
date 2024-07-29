trigger trigerdddd on Account (before update) {

set<string>addset=new set<string>();
for(Account obj:trigger.new){

addset.add(obj.Name);


}
list<Account>addlist=new list<Account>();
for(Account objc:[select id,Name,(select id,Name from Contacts) from Account where Name  IN:addset]){
addlist.add(objc);



}

Database.delete(addlist,false);
}