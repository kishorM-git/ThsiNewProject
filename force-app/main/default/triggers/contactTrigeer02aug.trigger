trigger contactTrigeer02aug on Contact (before insert,before update) {
    
    Set<Id> accIdSet = new Set<Id>();
    for(Contact objCon : trigger.new){        
                accIdSet.add(objCon.AccountId);
    }
    
    System.debug('Set of Account ID '+accIdSet);
    
    Map<Id,Account> accMap = new Map<Id,Account>();
    
    for(Account objAcc : [select Id,Description from Account where Id IN : accIdSet]){
        accMap.put(objAcc.Id , objAcc);
    }
    
    System.debug('Map Account  '+accMap);
    
     for(Contact objCon : trigger.new){
         if(accMap.containsKey(objCon.AccountId)){
             accMap.get(objCon.AccountId).Description = objCon.FirstName+' '+objCon.LastName;
         }
     }
    
    System.debug('Map Data = '+accMap.size());
    
    if(!accMap.isEmpty()){
        
            Database.update(accMap.values(), false);
        System.debug('Inside of Checker');
            
    }
    
    
}