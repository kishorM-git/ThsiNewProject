trigger triggerTransactionsAggregate on TransactionS__c (after  insert,after update) {
    set<id>addset=new set<id>();
    for(TransactionS__c objtrac:trigger.new){
        
        addset.add(objtrac.customerT__c);
        
        
    }
    map<id,customerT__c>putmap=new map<id,customerT__c>();
    for(customerT__c objtrx:[select id,Total_balance__c from  customerT__c where id IN:addset]){
        putmap.put(objtrx.id,objtrx);
    }
     for(TransactionS__c objccc:trigger.new){
        if(putmap.containsKey(objccc.customerT__c)){
        if(objccc.Amount_Type__c=='Deposit'  ){
            if(putmap.get(objccc.customerT__c).Total_balance__c== null){
         putmap.get(objccc.customerT__c).Total_balance__c=objccc.amount__c;
        }
            else{
               putmap.get(objccc.customerT__c).Total_balance__c=putmap.get(objccc.customerT__c).Total_balance__c+objccc.amount__c;  
            }
        }
             if(objccc.Amount_Type__c=='Withdrawal' && putmap.get(objccc.customerT__c).Total_balance__c!=null){
                 if(putmap.get(objccc.customerT__c).Total_balance__c > objccc.amount__c){
         putmap.get(objccc.customerT__c).Total_balance__c= putmap.get(objccc.customerT__c).Total_balance__c - objccc.amount__c;
        }
                 
             }
        }
        
     }
    
               database.update(putmap.values(),false); 
   
    }