trigger triggerAccount08aug on Account (before insert,before Update,before delete) {
    
        if(trigger.isBefore && trigger.isInsert){
        System.debug('From Trigger '+trigger.new);
        AccountTrigger08AugHandler.beforeInsert(trigger.new);  //List<Account>
    }
    
    if(trigger.isBefore && trigger.isUpdate){
        AccountTrigger08AugHandler.beforeUpdate(trigger.new, trigger.oldMap); //List<Account>
    }
    
    if(trigger.isBefore && trigger.isDelete){
        AccountTrigger08AugHandler.beforeDelete(trigger.old);
    }
}