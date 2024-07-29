trigger ApplicantTrigger003Aug on applicant__c (before update) {
    map<id,applicant__c>appmap=new map<id,applicant__c>();
    for(applicant__c objapp:trigger.new){
        if((objapp.police_varification__c!=trigger.oldmap.get(objapp.id).police_varification__c)||(objapp.gender__c!=trigger.oldmap.get(objapp.id).gender__c)){
            
             appmap.put(objapp.id,objapp);
        }
     
    }
    system.debug('map detail ='+appmap);
    list<address1__c> addlist=new list<address1__c>();
    if(!appmap.isEmpty()){
    for(address1__c objadd:[select id,city__c,pin_code__c,applicant__c from address1__c where applicant__c IN:appmap.keySet()]){
   addlist.add(objadd);
    } 
    }
    system.debug('list detail ='+addlist);
    if(!addlist.isEmpty()){
        for(address1__c objadd:addlist){
            if(appmap.containsKey(objadd.applicant__c)){
                if(appmap.get(objadd.applicant__c).police_varification__c && appmap.get(objadd.applicant__c).gender__c=='male'){
                    if(objadd.pin_code__c.startsWith('44')) {
                        objadd.country__c='India';
                            objadd.state__c='Maharashtra';
                            objadd.city__c='Pune';
                    }
                    else{objadd.country__c='';
                            objadd.state__c='';
                            objadd.city__c='';
                        } 
                }
                    
                
                    }
        }
        Database.update(addlist,false);
    } 
}