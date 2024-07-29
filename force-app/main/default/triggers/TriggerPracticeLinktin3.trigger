trigger TriggerPracticeLinktin3 on Opportunity (after insert) {
     set<Id>addset=new set<id>();
  for(Opportunity onjopp:trigger.new){
  
  if(onjopp.AccountID!=null){
  
  addset.add(onjopp.AccountID);
  }
  
  
  
  
  }
  map<id,Account>putmap=new map<id,Account>();
  if(!addset.isEmpty()){
  for(Account obj:[select id,Name ,Count_of_contact__c,Total_Amount__c, (select id,Amount from Opportunities)from Account where id IN:addset]){
  putmap.put(obj.id,obj);
  
  
  }
  
  }
  
if(!putmap.isEmpty()){
for(Opportunity objopp:trigger.new){
if(putmap.containskey(objopp.AccountID)){
putmap.get(objopp.AccountID).Count_of_contact__c=putmap.get(objopp.AccountID).Opportunities.Size();

if(putmap.get(objopp.AccountID).Total_Amount__c==null){
putmap.get(objopp.AccountID).Total_Amount__c=objopp.Amount;



}

else{
putmap.get(objopp.AccountID).Total_Amount__c=objopp.Amount+putmap.get(objopp.AccountID).Total_Amount__c;



}
}

}


}
 database.update(putmap.values(),false);
}