trigger TriggerChildToParenrtPra on Contact (after insert,after update) {
        
        set<id>accset=new set<id>();
        for(Contact objacc:trigger.new){
            if(objacc.AccountId!= null){
            accset.add(objacc.AccountId);
            
           } 
        }
            map<id,Account>accmap=new map<id,Account>();
            if(!accset.isEmpty()){
                for(Account objaccc:[select id,Name,Description from Account where id IN:accset]){
                    accmap.put(objaccc.id,objaccc);
                    
                }
            }
        for(Contact objac:trigger.new){
            if(accmap.containsKey(objac.AccountId)){
                if(string.isBlank(accmap.get(objac.AccountId).Description)){
                    accmap.get(objac.AccountId).Description=objac.FirstName+''+objac.LastName;
                    
                }
                else{
                   accmap.get(objac.AccountId). Description=  accmap.get(objac.AccountId).Description+'\n'+objac.FirstName+''+objac.LastName;
                    
                    
                }
                
                
                
                
            }
            if(!accmap.isEmpty())
            
            database.update (accmap.values(),false);
            
        }
        
    }