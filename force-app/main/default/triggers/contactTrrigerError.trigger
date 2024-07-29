trigger contactTrrigerError on Contact (after insert,after update,before delete) {
if(trigger.isAfter && trigger.isInsert){

    contactTrrigerErrorHandler.afterinsert(trigger.new);


}
if(trigger.isAfter && trigger.isUpdate){

    contactTrrigerErrorHandler.afterUpdate(trigger.new);


}

if(trigger.isbefore && trigger.isDelete){

    contactTrrigerErrorHandler.beforeDelete(trigger.old);

}


}