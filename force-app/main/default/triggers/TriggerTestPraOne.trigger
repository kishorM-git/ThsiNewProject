trigger TriggerTestPraOne on Contact (before insert,before update,After Undelete) {
set<id>accset=new set<id> ();

for(Contact objcon:Trigger.new){
if((trigger.isInsert ||trigger.isUpdate)&& trigger.isBefore){
accset.add(objcon.AccountId);
}
if(trigger.isUndelete && trigger.isAfter){
accset.add(objcon.AccountId);

}

}

map<id,Account>accmap=new map<id,Account>();
if(!accset.isEmpty()){
for(Account objacc:[select id ,Name, (select id from Contacts) from Account where id IN:accset]){

accmap.put(objacc.id,objacc);
}
}
for(Contact objcc:trigger.new){
    if(accmap.containsKey(objcc.AccountId)){
        list<Contact>objconq=accmap.get(objcc.AccountId).Contacts;
        if(objconq.size()>0){
            
       objcc.addError('eroororo....');
            
        }
        
        
        
    }

}
}