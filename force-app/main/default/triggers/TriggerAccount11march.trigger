trigger TriggerAccount11march on Account (after update) {
    
    map<id,Account>putmap=new map<id,Account>();

for(Account obj:trigger.new){

if(string.isNotBlank(obj.type)){
if(obj.Type!=trigger.oldmap.get(obj.id).Type){

putmap.put(obj.id,obj);

}
}
}




list<Contact>addlist=new list<Contact>();
if(!putmap.isempty()){

for(Contact objcon:[select id,Name,AccountID,LeadSource,Level__C from Contact where AccountID IN:putmap.keySet()]){
addlist.add(objcon);

}

}
if(!putmap.IsEmpty()){

for(Contact obj:addlist){
if(putmap.Containskey(obj.AccountID)){
if(putmap.get(obj.AccountID).Type=='Technology Partner'){
obj.LeadSource='Web';
obj.Level__C='Primary';

}
else{
obj.LeadSource='';
obj.Level__C='';

}
}
}
database.update(addlist,false);
}
    
    
    
    
    

}