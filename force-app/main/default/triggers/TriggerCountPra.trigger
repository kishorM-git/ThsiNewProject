trigger TriggerCountPra on Contact (after insert,after update,after delete,after undelete) {
    set<id>accset=new set<id>();
    if(trigger.isAfter&&(trigger.isInsert || trigger.isUpdate ||trigger.isUndelete)){
        
 for(Contact objcon:trigger.new){
     accset.add(objcon.AccountId);
            
            
        }
    }
        if(trigger.isAfter&&(  trigger.isUpdate || trigger.isdelete)){
            for(Contact objcon:trigger.old){
                accset.add(objcon.AccountId);
                
                
           
            
            
            
        }
    }
    map<id,Account>accmap=new map<id,account>();
    for(Account objconc:[select id , Count_of_contact__c,Name,(select id  from Contacts) from account where id IN:accset]){
       
         list<Contact>conList=objconc.Contacts;
   integer a= conlist.size();
        objconc.Count_of_contact__c=a;
      
        accmap.put(objconc.id,objconc);
        
        
    }
database.update(accmap.values(),false);
}