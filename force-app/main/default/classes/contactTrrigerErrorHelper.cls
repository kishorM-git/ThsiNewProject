public with sharing class contactTrrigerErrorHelper {
    public static void preventContactDelete(List<Contact> oldList){
        for(Contact objCon : oldList){
            if(objCon.LeadSource =='Web'){
                objCon.addError('Web Contact Can not be Deleted');
            }
        }
    }
    

    public static void updateaccountDesc(List<Contact> conList){

        Set<Id> accIdSet = new Set<Id>();
        for(Contact objCon : conList){        
                    accIdSet.add(objCon.AccountId);
        }
        
        Map<Id,Account> accMap = new Map<Id,Account>();
        
        for(Account objAcc : [select Id,Description from Account where Id IN : accIdSet]){
            accMap.put(objAcc.Id , objAcc);
        }
        
         for(Contact objCon : conList){
             if(accMap.containsKey(objCon.AccountId)){
                 accMap.get(objCon.AccountId).Description = objCon.FirstName+' '+objCon.LastName;
             }
         }
        
        if(!accMap.isEmpty())
                Database.update(accMap.values(), false);
    
    }

}