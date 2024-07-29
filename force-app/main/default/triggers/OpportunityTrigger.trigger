trigger OpportunityTrigger on Opportunity (after delete) {
    list<Opportunities_Backup__c>listobk=new list<Opportunities_Backup__c>();
    for(Opportunity objopp:trigger.old){
        
       Opportunities_Backup__c objobk=new Opportunities_Backup__c(); 
        objobk.Opportunity_Name__c=objopp.Name;
        objobk.Amount__c=objopp.Amount;
       listobk.add(objobk);
   
    }
    if(!listobk.isEmpty()){
        Database.insert(listobk,false);
    }
}