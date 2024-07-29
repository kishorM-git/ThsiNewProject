trigger CustomerSenario6Trigger on customer__c (after update) {
    list<customerT__c> objcublist=new list<customerT__c>();
    for(customer__c objcu:trigger.old){
        if(objcu.Name!=trigger.newmap.get(objcu.Id).Name){
        customerT__c objcub=new customerT__c();
        objcub.first_name__c=objcu.first_name__c;
        objcub.last_name__c=objcu.last__c;
        objcub.Total_balance__c=objcu.Total_amount__c;
        objcublist.add(objcub);
        }
    }
    if(!objcublist.isEmpty()){
        database.insert(objcublist,false);
    }
}