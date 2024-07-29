public with sharing class contactTrrigerErrorHandler {
    public static void afterinsert(List<Contact> conList) {

        contactTrrigerErrorHelper.updateaccountDesc(conlist);
    
    }
    public static void afterUpdate(List<Contact> conList){
        contactTrrigerErrorHelper.updateaccountDesc(conlist);

    
    }
    public static void beforeDelete(List<Contact> oldList){

        contactTrrigerErrorHelper.preventContactDelete(oldList);

   
    }
}