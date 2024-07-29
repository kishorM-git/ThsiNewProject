trigger triggerContacttestPractice on Contact (after insert,after update) {
    
    set<id>addset=new set<id>();
for(Contact objcon:trigger.new){
if(objcon.Accountid!=null){
addset.add(objcon.AccountId);
}
}
map<id,Account>putmap=new map<id,Account>();
    map<id,Account>putmapc=new map<id,Account>();

if(!addset.isEmpty()){
    

for(Account objacc:[select id,Name,NumberofLocations__c,Count_of_contact__c, (select id,firstName,Level__c,LastName from contacts where Level__c='Secondary') from Account where id IN:addset]){
objacc.NumberofLocations__c=objacc.Contacts.Size();

putmapc.put(objacc.id,objacc);
}
    for(Account objac:[select id,Name,NumberofLocations__c, Count_of_contact__c, (select id,firstName,Level__c,LastName from contacts where Level__c='Primary') from Account where id IN:addset]){
        objac.Count_of_contact__c=objac.Contacts.Size();
        
        putmap.put(objac.id,objac);
    }
        }
      database.update(putmap.values(),false);  
     database.update(putmapc.values(),false);  
}