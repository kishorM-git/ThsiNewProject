trigger TriggerPracticeLinktin5 on address1__c (after update) {
    
    list<string>addlist=new list<string>();
    list<customer__c>cuslist=[select id, first_name__c,last__c from customer__c where first_name__c='yes'];
    for(address1__c objacc:trigger.New){
        if(string.isNotEmpty(objacc.address_line1__c)){
         addlist.add(objacc.address_line1__c)  ; 
            
            
        }
        for(customer__c objdd:cuslist){
            for(integer i=0;i<cuslist.size();i++){
           objdd.first_name__c= addlist.get(i); 
            }
            
            
        }
        
        update cuslist;
    }

}