trigger accountRecursiveTrigger on Account (before insert) {
    if(trigger.isInsert && trigger.isBefore){
        AccountRecursiveHandler.insertrecord(trigger.new);
    }

}