trigger contactTrigger102 on Contact (after insert,after update,after delete,after undelete) {
set<id>addset=new set<id>();
if((trigger.isInsert ||trigger.isUndelete || trigger.isUpdate ) && trigger.isAfter){

for(Contact obj:trigger.new){
addset.add(obj.AccountId);

}

}
if(trigger.isDelete   && trigger.isAfter){
for(Contact objcon:trigger.Old){

addset.add(objcon.AccountId);

}



}
list<Account>addlist=new list<Account>();
if(!addset.isEmpty()){
for(AggregateResult objagr:[select AccountId,sum(Amount__c)amosum from Contact where AccountId IN:addset group bY AccountID]){
Account obj= new Account();
obj.id=(id)objagr.get('AccountId');
obj.Total_Amount__c=(decimal)objagr.get('amosum');

addlist.add(obj);





}

}

database.update(addlist,false);
  
}