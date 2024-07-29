trigger countContact on Contact (after insert, after update, after delete, after undelete) {
Set<Id> accIdSet = new Set<Id>();
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate || trigger.isUndelete) ){
        for(Contact objCon : trigger.new){
            accIdSet.add(objCon.AccountId);
        }
    }
    
    if(trigger.isAfter && (trigger.isDelete || trigger.isUpdate) ){
        for(Contact objCon : trigger.old){
            accIdSet.add(objCon.AccountId);
        }
    }
    
    Map<Id,Account> accountMap = new Map<Id,Account>();
    if(!accIdSet.isEmpty()){
        for(Account objAcc : [select Id,Count_of_contact__c, (select id from Contacts) from Account where Id  IN :  accIdSet]){
            List<Contact> conList =  objAcc.Contacts; 
                    objAcc.Count_of_contact__c =  conList.size();  
                    accountMap.put(objAcc.Id, objAcc);
        }
    }
    
    if(!accountMap.isEmpty())
        Database.update(accountMap.values(), false);
    

    
}