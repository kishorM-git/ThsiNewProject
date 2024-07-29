trigger TriggerContactTwoAmountAccount on Contact (after insert,after update,after delete) {
    
    
   set<id>addset=new set<id>();

for(Contact obj:trigger.new){
    

addset.add(obj.AccountId);



}


list<Account>addlis=new list<Account>();

if(!addset.isEmpty()){
for(AggregateResult objagr:[select AccountId,sum(Amount__c) sumone,sum(Amount2__c)sumtwo from Contact where AccountID IN:addset group by AccountId]){

Account obj=new Account();
obj.Id=(id)objagr.get('AccountId');
obj.Total_Amount__c=(decimal)objagr.get('sumone');
obj.Total_amount2__c=(decimal)objagr.get('sumtwo');
addlis.add(obj);
}
}
database.update(addlis,false);

}