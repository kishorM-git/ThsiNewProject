trigger ContactIncreement on Contact (after  update) {
   
set<Id> accIdset = new set <Id>();
for(contact objcon: trigger.new){
if(objcon.phone!=null){
if(objcon.phone!= trigger.oldmap.get(objcon.Id).phone){

accIdset.add(objcon.AccountId);
}
}
}
map<Id,Account> accmap= new map<Id,Account>();
for (Account objacc: [Select Id,Count_of_contact__c,phone from Account Where Id IN: accIdset]){

accmap.put(objacc.Id,objacc);

}  

for(contact objcons: trigger.new){

if(accmap.containskey(objcons.AccountId)){
  integer i=1;
    if(accmap.get(objcons.AccountId).Count_of_contact__c == Null){  
      accmap.get(objcons.AccountId).Count_of_contact__c=i;    
    
    }
    
    else{
        accmap.get(objcons.AccountId).Count_of_contact__c= i +  accmap.get(objcons.AccountId).Count_of_contact__c;
        
        
    }
    

}

}
Database.update(accmap.values(),false);

}