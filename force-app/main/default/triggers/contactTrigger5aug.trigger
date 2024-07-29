trigger contactTrigger5aug on Contact (before insert,before update,after undelete) {
    set<id>accset=new set<id>();
    for(contact objcon:trigger.new){
        if(objcon.AccountId!=null){
            if((trigger.isBefore && trigger.isinsert) || (trigger.isAfter &&trigger.isundelete)){
                accset.add(objcon.AccountId);
                
                
            }
            if(trigger.isbefore && trigger.isupdate) {
                if(objcon.LeadSource!=trigger.oldmap.get(objcon.id).LeadSource                                                                           )
                accset.add(objcon.AccountId);
            } 
        }
        
        
    }

}