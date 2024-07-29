trigger adreesTrigger02aug on address1__c (before insert,before update) {
    set<id>applicantidset=new set<id>();
    for(address1__c objadr:trigger.new){
        if(trigger.isinsert && trigger.isBefore){
            applicantidset.add(objadr.applicant__c);  
        }
        if(trigger.isUpdate&&trigger.isBefore) {
            if(objadr.city__c!=trigger.oldmap.get(objadr.Id).city__c){
                applicantidset.add(objadr.applicant__c);
            }
        }     
        
    }
    map<id,applicant__c>applicantidmap=new map<id,applicant__c>();
    if(!applicantidset.isEmpty())  {
        for(applicant__c objapp:[select id,police_varification__c,pan_card__c from applicant__c where id IN:applicantidset ]){
            applicantidmap.put(objapp.Id,objapp);
        } 
        
    }
    if(!applicantidmap.isEmpty()){
        for(address1__c objadr:trigger.new){
            if(applicantidmap.containsKey(objadr.applicant__c)){
                if(trigger.isInsert &&trigger.isBefore){
                    if(objadr.city__c=='Pune'){
                        if(applicantidmap.get(objadr.applicant__c).police_varification__c){
                            objadr.appivcant_pan_card__c=applicantidmap.get(objadr.applicant__c).pan_card__c;
                        }
                    }
                }
                if(trigger.isUpdate&trigger.isBefore){
                    if(objadr.city__c=='Pune'&& trigger.oldmap.get(objadr.id).city__c=='Nagpur'){
                        if(applicantidmap.get(objadr.applicant__c).police_varification__c){
                            objadr.appivcant_pan_card__c=applicantidmap.get(objadr.applicant__c).pan_card__c;
                        }
                    }
                    else{
                        objadr.appivcant_pan_card__c='';
                    }
                }
            }
        }
    }
}