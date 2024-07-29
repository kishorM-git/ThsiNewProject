trigger triggerAmountContact on Contact (after insert,after update,after undelete,After delete) {
set<id>addset=new set<id>();
if((trigger.isinsert || trigger.isupdate || trigger.isundelete) && trigger.isAfter){
for(Contact objcon:trigger.new){
if(objcon.AccountID!=null){
addset.add(objcon.AccountID);
}

}
} 

if(trigger.isDelete &&trigger.isAfter){
    
    for(Contact objc:trigger.old){
addset.add(objc.AccountID);


    }

}



map<id,Account>putmap=new map<id,Account>();
if(!addset.isEmpty()){
for(Account objacc:[select id,Name,Total_Amount__c from Account where id IN:addset]){
putmap.put(objacc.id,objacc);
}
}

if(!putmap.isEmpty()){

if((trigger.isInsert || trigger.isUpdate || trigger.IsUndelete )&& trigger.isAFter){
for(Contact objcon:trigger.new){

if(putmap.Containskey(objcon.AccountID)){


for(AggregateResult obj:[select sum(Amount__c)acj,AccountID aid from Contact where Accountid =: objcon.AccountID  group by AccountID]){
putmap.get(objcon.AccountID).Total_Amount__c=integer.valueof(obj.get('acj'));

}
}
}

}



if(trigger.isDelete && trigger.isAfter){

for(Contact objcons:trigger.old){

if(putmap.Containskey(objcons.AccountID)){


for(AggregateResult objss:[select sum(Amount__c)acjs,AccountID aids from Contact where Accountid =:objcons.AccountID  group by AccountID]){
  
putmap.get(objcons.AccountID).Total_Amount__c=integer.valueof(objss.get('acjs'));
system.debug('valie='+putmap.get(objcons.AccountID).Total_Amount__c);
   
}
}
}
}
}
Database.update(putmap.values(),false);
}