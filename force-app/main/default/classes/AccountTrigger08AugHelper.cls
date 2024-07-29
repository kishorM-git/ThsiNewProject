public class AccountTrigger08AugHelper {
        public static void preventAccountDeletion(List<Account> accOldList){
        if(!accOldList.isEmpty()){
                for(Account objAcc : accOldList){
                    if(objAcc.SLA__c == 'Gold'){
                        objAcc.SLA__c.addError('SLA Gold Account can not be deleted...!!!');
                    }
                }
        }
    }
    
    public static void updateAccountRecord(List<Account> accNewList, Map<Id,Account> accOldMap){
        System.debug('From Helper Method = '+accNewList);
        
         for(Account objAcc : accNewList){
        if(!String.isBlank(objAcc.Type)) {
            if(trigger.isBefore && trigger.isInsert){
                if(objAcc.Type == 'Prospect'){
                    objAcc.Rating = 'Hot';
                }
            }
            if(trigger.isBefore && trigger.isUpdate){ 
                if(objAcc.Type != accOldMap.get(objAcc.Id).Type){
                     if(objAcc.Type == 'Prospect'){
                     objAcc.Rating = 'Hot';
                     }
                }
            }
        }
    }
        
    }
}