trigger TriggerOpportunityChetan on Opportunity (before insert) {
     set<id> accIdset= new set<id>();
    for (opportunity objopp : trigger.new){
        
        accIdset.add(objopp.Accountid);
    }


Map<Id,Account> accmap= new Map<Id,Account>();
    for(Account objacc:[select Id,Name,Ownership,(select Id,Name,StageName from Opportunities where StageName ='Closed Won') from Account Where Id IN:accIdset]){
      accmap.put(objacc.Id,objacc);  
    }
        
        for(opportunity objopp : trigger.new){
            
            if (accmap.containskey(objopp.Accountid)){
               List<opportunity> objlist=  accmap.get(objopp.Accountid).opportunities;
               
                    system.debug('##########==='+objlist);
                
                if(accmap.get(objopp.AccountId).Ownership.Contains('Public') || objlist.size()==2){
                   objopp.adderror('NEW OPPORTUNITY CANNOT BE CREATED');
                
                
                }
              
                } 
                
            }
    
    

}