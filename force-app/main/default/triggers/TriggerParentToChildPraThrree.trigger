trigger TriggerParentToChildPraThrree on applicant__c (after update) {
  map<id,applicant__c> appmap=new map<id,applicant__c>();
    for(applicant__c objacc:trigger.new){
        
        appmap.put(objacc.id,objacc);
        
        
    }
    list<address__c>addlist=new list<address__c>();
    if(!appmap.isEmpty()){
    for(address__c objadr :[select id,Name,city__c,country__c,state__c ,applicant__c,pin_code__c from address__c where applicant__c IN:appmap.keySet()]){
        addlist.add(objadr);
        
    }   
    }
    if(!addlist.isEmpty()){
        for(address__c objadrr:addlist){
            if(appmap.containsKey(objadrr.applicant__c)){
                if(appmap.get(objadrr.applicant__c).police_varification__c==true && appmap.get(objadrr.applicant__c).gender__c=='male'){
                    if(objadrr.pin_code__c.startsWith('44')) {
                        objadrr.state__c='Maharashtra';
                        objadrr.country__c='India';
                        objadrr.city__c='Nagpur';
                        
                        
                        
                    }
                    else{
                         objadrr.state__c='';
                        objadrr.country__c='';
                        objadrr.city__c='';
                        
                        
                        
                    }
                    
                }
                
            }

        }
        database.update(addlist,false);
        
    }
    

}