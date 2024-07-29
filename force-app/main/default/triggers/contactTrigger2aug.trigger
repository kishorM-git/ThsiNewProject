trigger contactTrigger2aug on Contact (before insert,before update) {
    set<id>accset=new set<id>();
    for(Contact objcon:trigger.new){
        if(objcon.AccountId!=null){
        if(trigger.isinsert && trigger.isBefore){
       accset.add( objcon.AccountId);
        }
            if(trigger.isupdate &&trigger.isBefore){
                if(objcon.AccountId!=trigger.oldmap.get(objcon.id).AccountId){
                    accset.add(objcon.AccountId);
                    
                }
                
            }
    }
    }  
    
map<id,Account>mapacc=new map<id,Account>();
    if(!mapacc.isEmpty()){
    for(Account objacc:[select id,Rating from Account where id IN: accset]){
       mapacc.put(objacc.id, objacc) ;
    }
    }
    if(!mapacc.isEmpty()){
        for(Contact objcon:trigger.new){
            if(mapacc.containsKey(objcon.AccountId)){
                if(mapacc.get(objcon.AccountId).Rating=='hot'){
                    objcon.Level__c='Primary';
                    
                }
                else{
                    objcon.Level__c='';
                }
            }
        }
        
    }
}