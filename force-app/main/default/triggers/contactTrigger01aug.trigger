trigger contactTrigger01aug on Contact (before insert,before update) {
    set<id>accset=new set<id>();
    for(Contact objcc:trigger.new){
        accset.add(objcc.AccountId);
    }
        System.debug('Set of Account ID = '+accset);
    map<id,Account>accmap=new map<id,Account>();
    for(Account objacc:[select id,Description from Account where id iN: accset]){
        accmap.put(objacc.Description, objacc);
        
    }
        
        System.debug('Map Account dgfdhgfdgfgdfgf = '+accmap);
    for(Contact objcc:trigger.new){
    if(accmap.containsKey(objcc.AccountId)){
        accmap.get(objcc.AccountId).Description = objcc.FirstName+' '+objcc.LastName;
        }
    }  
        
    if(!accMap.isEmpty())
    Database.update(accmap.values(), false);
            System.debug('Inside of Checker');
}