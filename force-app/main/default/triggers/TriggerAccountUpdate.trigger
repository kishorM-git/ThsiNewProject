trigger TriggerAccountUpdate on Account (after update) {
  map<id,Account> accmap=new map<id,Account>(); 
    for(Account objacc:trigger.new){
        if(string.isNotBlank(objacc.Name)){
          accmap.put(objacc.id,objacc);  
        }            
        }
        list<contact>acclist=new list<Contact>();
        for(Contact objcc:[select id ,Name ,AccountId,description from Contact where AccountId IN:accmap.keySet()]){
            acclist.add(objcc);
        }
        if(!acclist.isEmpty()){
            for(Contact objas:acclist){
                if(  accmap.containsKey(objas.AccountId)){
                    objas.Description=accmap.get(objas.AccountId).Name;
                }
            }
         }
        database.update(acclist,false);
    }