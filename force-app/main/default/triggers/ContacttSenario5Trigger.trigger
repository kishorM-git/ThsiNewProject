trigger ContacttSenario5Trigger on Contact (after insert,after update) {
    set<id>contactset=new set<id>();
    for(Contact contactobj:trigger.new){
        if(contactobj.Phone!=null){
            if(trigger.isinsert && trigger.isafter){
                contactset.add(contactobj.AccountId);
      }
            if(trigger.isUpdate&& trigger.isAfter){
                if(contactobj.Phone!=trigger.oldmap.get(contactobj.Id).Phone){
                    contactset.add(contactobj.AccountId);
                }
            }
        }
    }
    map<id,Account>accmap=new map<id,Account>();
    if(!contactset.isEmpty())
    for(Account objacc:[select id,Name,Contact_Number__c,(select id,Phone from Contacts) from Account where id IN:contactset]){
        
       accmap.put(objacc.id,objacc); 
    }
    for(Contact contactobj:trigger.new){
        accmap.containsKey(contactobj.AccountId);
      accmap.get(contactobj.AccountId).Contact_Number__c=contactobj.Phone;
    }
    database.update(accmap.values(),false);
}