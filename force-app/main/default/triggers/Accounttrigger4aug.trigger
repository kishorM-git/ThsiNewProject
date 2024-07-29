trigger Accounttrigger4aug on Account (before update) {
    map<id,Account>accmap=new map<Id,Account>();
    for(Account objacc:trigger.new){
        if(objacc.Type!=trigger.oldmap.get(objacc.id).Type){
         accmap.put(objacc.id, objacc) ; 
          
        }
    }
list<Opportunity>opplist=new list<Opportunity>();
    if(!accmap.isEmpty()){
        for(Opportunity objopp:[select id,Amount,Accountid,Name from Opportunity where Accountid IN:accmap.keySet()]){
            opplist.add(objopp);
        }
    }
    if(!opplist.isEmpty())  {
        for(Opportunity objopp:opplist){
            if(accmap.containsKey(objopp.AccountId)){
                if(accmap.get(objopp.AccountId).Type =='Prospect' && objopp.Amount<10000){
                    if(string.isBlank(accmap.get(objopp.AccountId).Description)){
                        accmap.get(objopp.AccountId).Description=objopp.Name;
                    }
                    else {
                        accmap.get(objopp.AccountId).Description=accmap.get(objopp.AccountId).Description+'\n'+objopp.Name;
                    }
                }
            
            }
        }
    }  
    
}