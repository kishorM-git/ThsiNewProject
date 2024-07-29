trigger TriggerChildToParenrtPra10 on Contact (before insert,before update) {
    
  set<id>accset=new set<id>();
    
    for(Contact objcom:trigger.new){
        
        if(objcom.AccountId!=null){
            if(trigger.isInsert && trigger.isBefore){
           accset.add(objcom.AccountId);
            }
            if(trigger.isUpdate && trigger.isBefore){
                
                if(objcom.AccountId!=trigger.oldmap.get(objcom.id).AccountId){
                    accset.add(objcom.AccountId);
                    
                    
                }
                
            }
        }
        map<id,Account>accmap=new map<id,Account>();
       
        if(!accset.isEmpty()){
          for(Account objacc:[select id ,Rating from Account where id IN:accset]){
            accmap.put(objacc.id,objacc);
            
            
        }   
        }
        if(!accmap.isEmpty())
             system.debug('#####='+accmap);
        for(Contact objcon:trigger.new){
            if(accmap.containsKey(objcon.AccountId)) {
                if(accmap.get(objcon.AccountId).Rating=='Hot'){
                   objcon.Level__c='Primary'; 
                    
                }
                else{
                    
                  if(accmap.get(objcon.AccountId).Rating=='Cold'){
                   objcon.Level__c='Secondary'; 
                    
                } 
                  
                else{
                    
                if(accmap.get(objcon.AccountId).Rating=='Warm'){
                   objcon.Level__c='Tertiary'; 
                    
                } 
                  
                    
                }
               
                    
                } 
                
                
            }
            
            
            
        }
        
        
        
    }
   

}