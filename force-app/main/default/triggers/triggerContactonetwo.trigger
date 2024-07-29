trigger triggerContactonetwo on Contact (before insert,before update) {
 set<string>addset=new set<string>();
for(contact objcc:trigger.new){



if((trigger.isInsert || trigger.isUpdate) && trigger.isBefore){

addset.add(objcc.Email);


}



}
map<string,contact>putmap=new map<string,Contact>();
if(!addset.isEmpty()){

for(contact objcon:[select id,Name,Email from Contact where Email IN:addset]){

putmap.put(objcon.Email,objcon);

}

}
if(!putmap.isEmpty()){

for(contact obj:trigger.new){

if(putmap.Containskey(obj.Email)){
    
obj.addError('duplicate email id found');
    
}

}

}
}