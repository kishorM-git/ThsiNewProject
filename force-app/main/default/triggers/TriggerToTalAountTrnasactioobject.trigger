trigger TriggerToTalAountTrnasactioobject on TransactionS__c (after insert,after update,after delete,after undelete) {
    string opration;
    if(trigger.isInsert && trigger.isAfter){
       opration='AFTER_INSERT';
        system.debug('AFTER_INSERT  '+Trigger.operationType);
        ClassTriggerToTalAountTrnasactioobject.insertRecord(trigger.new,null,opration);
    }
    if(trigger.isAfter && trigger.isupdate){
         opration='AFTER_UPDATE';
        system.debug('AFTER_INSERT update  '+Trigger.operationType);
         ClassTriggerToTalAountTrnasactioobject.insertRecord(trigger.new,trigger.oldMap,opration);
    }
    if(trigger.isAfter && trigger.isUndelete){
         opration='AFTER_UNDELETE';
        system.debug('AFTER_INSERT undelete  '+Trigger.operationType);
         ClassTriggerToTalAountTrnasactioobject.insertRecord(trigger.new,null,opration);
    }
     if(trigger.isAfter && trigger.isDelete){
         opration='AFTER_DELETE';
        system.debug('AFTER_INSERT delete  ' +Trigger.operationType);
          ClassTriggerToTalAountTrnasactioobject.insertRecord(trigger.old,null,opration);
    }


}