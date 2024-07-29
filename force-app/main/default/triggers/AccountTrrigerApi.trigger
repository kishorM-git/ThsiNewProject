trigger AccountTrrigerApi on Account (after insert) {
    set<id>accidset=new set<id>();
    for(Account objacc:trigger.new){
          
        accidset.add(objacc.id);
        
        
    }
    SourceAccountToTriggerRequestAPI.sendAccountRecordsToTarget(accidset);//A1, A2, A3
}