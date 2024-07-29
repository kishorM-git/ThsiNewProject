trigger triggerTransactionAggregate on Transaction__c (after insert,after update) {
    for(Transaction__c objTra:trigger.new){
     
    }
}