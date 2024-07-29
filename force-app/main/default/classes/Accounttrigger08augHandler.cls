public class Accounttrigger08augHandler {
    
          public static void beforeInsert(List<Account> accNewList){
        System.debug('From Handler Method = '+accNewList);
        AccountTrigger08AugHelper.updateAccountRecord(accNewList, null);
    }
    public static void beforeUpdate(List<Account> accNewList, Map<Id,Account> accOldMap){
        AccountTrigger08AugHelper.updateAccountRecord(accNewList,accOldMap);
    }
    
    public static void beforeDelete(List<Account> accOldList){
        AccountTrigger08AugHelper.preventAccountDeletion(accOldList);
    }
}